// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'log_database.dart';

class LogMapper extends ClassMapperBase<Log> {
  LogMapper._();

  static LogMapper? _instance;
  static LogMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LogMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Log';

  static int _$id(Log v) => v.id;
  static const Field<Log, int> _f$id = Field('id', _$id);
  static LogLevel _$level(Log v) => v.level;
  static const Field<Log, LogLevel> _f$level = Field('level', _$level);
  static String _$message(Log v) => v.message;
  static const Field<Log, String> _f$message = Field('message', _$message);
  static String? _$source(Log v) => v.source;
  static const Field<Log, String> _f$source =
      Field('source', _$source, opt: true);
  static String? _$stackTrace(Log v) => v.stackTrace;
  static const Field<Log, String> _f$stackTrace =
      Field('stackTrace', _$stackTrace, opt: true);
  static String? _$context(Log v) => v.context;
  static const Field<Log, String> _f$context =
      Field('context', _$context, opt: true);
  static DateTime? _$occurTime(Log v) => v.occurTime;
  static const Field<Log, DateTime> _f$occurTime =
      Field('occurTime', _$occurTime, opt: true);
  static DateTime _$logTime(Log v) => v.logTime;
  static const Field<Log, DateTime> _f$logTime = Field('logTime', _$logTime);

  @override
  final MappableFields<Log> fields = const {
    #id: _f$id,
    #level: _f$level,
    #message: _f$message,
    #source: _f$source,
    #stackTrace: _f$stackTrace,
    #context: _f$context,
    #occurTime: _f$occurTime,
    #logTime: _f$logTime,
  };

  static Log _instantiate(DecodingData data) {
    return Log(
        id: data.dec(_f$id),
        level: data.dec(_f$level),
        message: data.dec(_f$message),
        source: data.dec(_f$source),
        stackTrace: data.dec(_f$stackTrace),
        context: data.dec(_f$context),
        occurTime: data.dec(_f$occurTime),
        logTime: data.dec(_f$logTime));
  }

  @override
  final Function instantiate = _instantiate;

  static Log fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Log>(map);
  }

  static Log fromJson(String json) {
    return ensureInitialized().decodeJson<Log>(json);
  }
}

mixin LogMappable {
  String toJson() {
    return LogMapper.ensureInitialized().encodeJson<Log>(this as Log);
  }

  Map<String, dynamic> toMap() {
    return LogMapper.ensureInitialized().encodeMap<Log>(this as Log);
  }

  LogCopyWith<Log, Log, Log> get copyWith =>
      _LogCopyWithImpl(this as Log, $identity, $identity);
  @override
  String toString() {
    return LogMapper.ensureInitialized().stringifyValue(this as Log);
  }

  @override
  bool operator ==(Object other) {
    return LogMapper.ensureInitialized().equalsValue(this as Log, other);
  }

  @override
  int get hashCode {
    return LogMapper.ensureInitialized().hashValue(this as Log);
  }
}

extension LogValueCopy<$R, $Out> on ObjectCopyWith<$R, Log, $Out> {
  LogCopyWith<$R, Log, $Out> get $asLog =>
      $base.as((v, t, t2) => _LogCopyWithImpl(v, t, t2));
}

abstract class LogCopyWith<$R, $In extends Log, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {int? id,
      LogLevel? level,
      String? message,
      String? source,
      String? stackTrace,
      String? context,
      DateTime? occurTime,
      DateTime? logTime});
  LogCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LogCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Log, $Out>
    implements LogCopyWith<$R, Log, $Out> {
  _LogCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Log> $mapper = LogMapper.ensureInitialized();
  @override
  $R call(
          {int? id,
          LogLevel? level,
          String? message,
          Object? source = $none,
          Object? stackTrace = $none,
          Object? context = $none,
          Object? occurTime = $none,
          DateTime? logTime}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (level != null) #level: level,
        if (message != null) #message: message,
        if (source != $none) #source: source,
        if (stackTrace != $none) #stackTrace: stackTrace,
        if (context != $none) #context: context,
        if (occurTime != $none) #occurTime: occurTime,
        if (logTime != null) #logTime: logTime
      }));
  @override
  Log $make(CopyWithData data) => Log(
      id: data.get(#id, or: $value.id),
      level: data.get(#level, or: $value.level),
      message: data.get(#message, or: $value.message),
      source: data.get(#source, or: $value.source),
      stackTrace: data.get(#stackTrace, or: $value.stackTrace),
      context: data.get(#context, or: $value.context),
      occurTime: data.get(#occurTime, or: $value.occurTime),
      logTime: data.get(#logTime, or: $value.logTime));

  @override
  LogCopyWith<$R2, Log, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _LogCopyWithImpl($value, $cast, t);
}
