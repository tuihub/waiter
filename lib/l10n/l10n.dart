// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `TuiHub`
  String get title {
    return Intl.message(
      'TuiHub',
      name: 'title',
      desc: 'Title for the application',
      args: [],
    );
  }

  /// `类型`
  String get USER_TYPE {
    return Intl.message(
      '类型',
      name: 'USER_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get USER_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'USER_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `管理员`
  String get USER_TYPE_ADMIN {
    return Intl.message(
      '管理员',
      name: 'USER_TYPE_ADMIN',
      desc: '',
      args: [],
    );
  }

  /// `普通`
  String get USER_TYPE_NORMAL {
    return Intl.message(
      '普通',
      name: 'USER_TYPE_NORMAL',
      desc: '',
      args: [],
    );
  }

  /// `扫描器`
  String get USER_TYPE_SENTINEL {
    return Intl.message(
      '扫描器',
      name: 'USER_TYPE_SENTINEL',
      desc: '',
      args: [],
    );
  }

  /// `状态`
  String get USER_STATUS {
    return Intl.message(
      '状态',
      name: 'USER_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get USER_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'USER_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `正常`
  String get USER_STATUS_ACTIVE {
    return Intl.message(
      '正常',
      name: 'USER_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `禁用`
  String get USER_STATUS_BLOCKED {
    return Intl.message(
      '禁用',
      name: 'USER_STATUS_BLOCKED',
      desc: '',
      args: [],
    );
  }

  /// `平台`
  String get ACCOUNT_PLATFORM {
    return Intl.message(
      '平台',
      name: 'ACCOUNT_PLATFORM',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get ACCOUNT_PLATFORM_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'ACCOUNT_PLATFORM_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Steam`
  String get ACCOUNT_PLATFORM_STEAM {
    return Intl.message(
      'Steam',
      name: 'ACCOUNT_PLATFORM_STEAM',
      desc: '',
      args: [],
    );
  }

  /// `来源`
  String get APP_SOURCE {
    return Intl.message(
      '来源',
      name: 'APP_SOURCE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get APP_SOURCE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'APP_SOURCE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `内置`
  String get APP_SOURCE_INTERNAL {
    return Intl.message(
      '内置',
      name: 'APP_SOURCE_INTERNAL',
      desc: '',
      args: [],
    );
  }

  /// `Steam`
  String get APP_SOURCE_STEAM {
    return Intl.message(
      'Steam',
      name: 'APP_SOURCE_STEAM',
      desc: '',
      args: [],
    );
  }

  /// `类型`
  String get APP_TYPE {
    return Intl.message(
      '类型',
      name: 'APP_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get APP_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'APP_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `游戏`
  String get APP_TYPE_GAME {
    return Intl.message(
      '游戏',
      name: 'APP_TYPE_GAME',
      desc: '',
      args: [],
    );
  }

  /// `来源`
  String get APP_PACKAGE_SOURCE {
    return Intl.message(
      '来源',
      name: 'APP_PACKAGE_SOURCE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get APP_PACKAGE_SOURCE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'APP_PACKAGE_SOURCE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `手动`
  String get APP_PACKAGE_SOURCE_MANUAL {
    return Intl.message(
      '手动',
      name: 'APP_PACKAGE_SOURCE_MANUAL',
      desc: '',
      args: [],
    );
  }

  /// `扫描`
  String get APP_PACKAGE_SOURCE_SENTINEL {
    return Intl.message(
      '扫描',
      name: 'APP_PACKAGE_SOURCE_SENTINEL',
      desc: '',
      args: [],
    );
  }

  /// `状态`
  String get FEED_CONFIG_STATUS {
    return Intl.message(
      '状态',
      name: 'FEED_CONFIG_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get FEED_CONFIG_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'FEED_CONFIG_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `启用`
  String get FEED_CONFIG_STATUS_ACTIVE {
    return Intl.message(
      '启用',
      name: 'FEED_CONFIG_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `停止`
  String get FEED_CONFIG_STATUS_SUSPEND {
    return Intl.message(
      '停止',
      name: 'FEED_CONFIG_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `状态`
  String get NOTIFY_TARGET_STATUS {
    return Intl.message(
      '状态',
      name: 'NOTIFY_TARGET_STATUS',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get NOTIFY_TARGET_STATUS_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'NOTIFY_TARGET_STATUS_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `启用`
  String get NOTIFY_TARGET_STATUS_ACTIVE {
    return Intl.message(
      '启用',
      name: 'NOTIFY_TARGET_STATUS_ACTIVE',
      desc: '',
      args: [],
    );
  }

  /// `停止`
  String get NOTIFY_TARGET_STATUS_SUSPEND {
    return Intl.message(
      '停止',
      name: 'NOTIFY_TARGET_STATUS_SUSPEND',
      desc: '',
      args: [],
    );
  }

  /// `类型`
  String get NOTIFY_TARGET_TYPE {
    return Intl.message(
      '类型',
      name: 'NOTIFY_TARGET_TYPE',
      desc: '',
      args: [],
    );
  }

  /// `未知`
  String get NOTIFY_TARGET_TYPE_UNSPECIFIED {
    return Intl.message(
      '未知',
      name: 'NOTIFY_TARGET_TYPE_UNSPECIFIED',
      desc: '',
      args: [],
    );
  }

  /// `Telegram`
  String get NOTIFY_TARGET_TYPE_TELEGRAM {
    return Intl.message(
      'Telegram',
      name: 'NOTIFY_TARGET_TYPE_TELEGRAM',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'zh', countryCode: 'CN'),
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
