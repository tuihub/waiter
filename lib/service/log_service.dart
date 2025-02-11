import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dao/dao.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

import '../common/bloc_observer.dart';

class Logger {
  static final Logger _instance = Logger._();

  Logger._();

  late LogDatabase _db;
  final LogLevel _levelFilter = kDebugMode ? LogLevel.trace : LogLevel.info;
  int _defaultInfoLogExpiry = 7;
  int _defaultWarningLogExpiry = 14;
  int _defaultErrorLogExpiry = 30;

  static Logger init(
    String dataPath, {
    int? infoLogExpiry,
    int? warningLogExpiry,
    int? errorLogExpiry,
  }) {
    _instance._db = LogDatabase(dataPath);
    if (infoLogExpiry != null) {
      _instance._defaultInfoLogExpiry = infoLogExpiry;
    }
    if (warningLogExpiry != null) {
      _instance._defaultWarningLogExpiry = warningLogExpiry;
    }
    if (errorLogExpiry != null) {
      _instance._defaultErrorLogExpiry = errorLogExpiry;
    }
    // Clear old logs
    unawaited(_instance.clearLogs().catchError((e) {
      debugPrint('Failed to clear logs: $e');
    }));
    return _instance;
  }

  Future<void> clearLogs() async {
    await _db.clearLogs(_defaultInfoLogExpiry, [
      LogLevel.trace,
      LogLevel.debug,
      LogLevel.info,
    ]);
    await _db.clearLogs(_defaultWarningLogExpiry, [
      LogLevel.warning,
    ]);
    await _db.clearLogs(_defaultErrorLogExpiry, [
      LogLevel.error,
    ]);
  }

  void _log(
    LogLevel level,
    String title,
    String? message, {
    String? source,
    String? context,
    String? stackTrace,
    DateTime? occurTime,
  }) {
    if (level.index < _levelFilter.index) {
      return;
    }
    try {
      unawaited(
        _db
            .log(
          level,
          title,
          message,
          source: source,
          context: context,
          stackTrace: stackTrace,
          occurTime: occurTime,
        )
            .catchError(
          (e) {
            debugPrint('Failed to log: $e');
          },
        ),
      );
    } catch (e) {
      debugPrint('Failed to log: $e');
    }
  }

  static void trace(
    String title, {
    String? message,
    String? source,
    String? context,
    DateTime? occurTime,
  }) {
    _instance._log(
      LogLevel.trace,
      title,
      message,
      source: source,
      context: context,
      occurTime: occurTime,
    );
  }

  static void debug(
    String title, {
    String? message,
    String? source,
    String? context,
    DateTime? occurTime,
  }) {
    _instance._log(
      LogLevel.debug,
      title,
      message,
      source: source,
      context: context,
      occurTime: occurTime,
    );
  }

  static void info(
    String title, {
    String? message,
    String? source,
    String? context,
    DateTime? occurTime,
  }) {
    _instance._log(
      LogLevel.info,
      title,
      message,
      source: source,
      context: context,
      occurTime: occurTime,
    );
  }

  static void warning(
    String title, {
    String? message,
    String? source,
    String? context,
    DateTime? occurTime,
  }) {
    _instance._log(
      LogLevel.warning,
      title,
      message,
      source: source,
      context: context,
      occurTime: occurTime,
    );
  }

  static void error(
    String title, {
    required String stackTrace,
    String? message,
    String? source,
    String? context,
    DateTime? occurTime,
  }) {
    _instance._log(
      LogLevel.error,
      title,
      message,
      stackTrace: stackTrace,
      source: source,
      context: context,
      occurTime: occurTime,
    );
  }

  static Future<void> cacheServerLogs(ServerID serverID, List<Log> logs) {
    return _instance._db.cacheServerLogs(serverID.toString(), logs);
  }

  static Future<List<Log>> queryLogs(LogFilter filter,
      {List<String>? serverIDs}) {
    return _instance._db.queryLogs(filter, serverIDs: serverIDs);
  }
}

class LoggerBlocObserver extends SimpleBlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Logger.trace(
      '[BLOC] ${bloc.runtimeType} current: ${change.currentState}, next: ${change.nextState}',
      source: 'bloc',
    );
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Logger.trace('[BLOC] ${bloc.runtimeType} $transition', source: 'bloc');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Logger.error('[BLOC] ${bloc.runtimeType} $error',
        stackTrace: stackTrace.toString(), source: 'bloc');
  }
}

class LoggerRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    Logger.trace('[ROUTER] didPush $route', source: 'router');
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    Logger.trace('[ROUTER] didPop $route', source: 'router');
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    Logger.trace('[ROUTER] didRemove $route', source: 'router');
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    Logger.trace('[ROUTER] didReplace $newRoute', source: 'router');
  }

  @override
  void didChangeTop(Route<dynamic> topRoute, Route<dynamic>? previousTopRoute) {
    super.didChangeTop(topRoute, previousTopRoute);
    Logger.trace('[ROUTER] didChangeTop $topRoute', source: 'router');
  }

  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
    Logger.trace('[ROUTER] didStartUserGesture $route', source: 'router');
  }

  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
    Logger.trace('[ROUTER] didStopUserGesture', source: 'router');
  }
}
