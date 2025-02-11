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
  static String _$title(Log v) => v.title;
  static const Field<Log, String> _f$title = Field('title', _$title);
  static String? _$message(Log v) => v.message;
  static const Field<Log, String> _f$message =
      Field('message', _$message, opt: true);
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
    #title: _f$title,
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
        title: data.dec(_f$title),
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
      String? title,
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
          String? title,
          Object? message = $none,
          Object? source = $none,
          Object? stackTrace = $none,
          Object? context = $none,
          Object? occurTime = $none,
          DateTime? logTime}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (level != null) #level: level,
        if (title != null) #title: title,
        if (message != $none) #message: message,
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
      title: data.get(#title, or: $value.title),
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

class LogFilterMapper extends ClassMapperBase<LogFilter> {
  LogFilterMapper._();

  static LogFilterMapper? _instance;
  static LogFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LogFilterMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LogFilter';

  static List<LogLevel>? _$levels(LogFilter v) => v.levels;
  static const Field<LogFilter, List<LogLevel>> _f$levels =
      Field('levels', _$levels, opt: true);
  static List<String>? _$sources(LogFilter v) => v.sources;
  static const Field<LogFilter, List<String>> _f$sources =
      Field('sources', _$sources, opt: true);
  static DateTime? _$from(LogFilter v) => v.from;
  static const Field<LogFilter, DateTime> _f$from =
      Field('from', _$from, opt: true);
  static DateTime? _$to(LogFilter v) => v.to;
  static const Field<LogFilter, DateTime> _f$to = Field('to', _$to, opt: true);
  static int? _$limit(LogFilter v) => v.limit;
  static const Field<LogFilter, int> _f$limit =
      Field('limit', _$limit, opt: true);
  static int? _$offset(LogFilter v) => v.offset;
  static const Field<LogFilter, int> _f$offset =
      Field('offset', _$offset, opt: true);
  static String? _$keyword(LogFilter v) => v.keyword;
  static const Field<LogFilter, String> _f$keyword =
      Field('keyword', _$keyword, opt: true);

  @override
  final MappableFields<LogFilter> fields = const {
    #levels: _f$levels,
    #sources: _f$sources,
    #from: _f$from,
    #to: _f$to,
    #limit: _f$limit,
    #offset: _f$offset,
    #keyword: _f$keyword,
  };

  static LogFilter _instantiate(DecodingData data) {
    return LogFilter(
        levels: data.dec(_f$levels),
        sources: data.dec(_f$sources),
        from: data.dec(_f$from),
        to: data.dec(_f$to),
        limit: data.dec(_f$limit),
        offset: data.dec(_f$offset),
        keyword: data.dec(_f$keyword));
  }

  @override
  final Function instantiate = _instantiate;

  static LogFilter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LogFilter>(map);
  }

  static LogFilter fromJson(String json) {
    return ensureInitialized().decodeJson<LogFilter>(json);
  }
}

mixin LogFilterMappable {
  String toJson() {
    return LogFilterMapper.ensureInitialized()
        .encodeJson<LogFilter>(this as LogFilter);
  }

  Map<String, dynamic> toMap() {
    return LogFilterMapper.ensureInitialized()
        .encodeMap<LogFilter>(this as LogFilter);
  }

  LogFilterCopyWith<LogFilter, LogFilter, LogFilter> get copyWith =>
      _LogFilterCopyWithImpl(this as LogFilter, $identity, $identity);
  @override
  String toString() {
    return LogFilterMapper.ensureInitialized()
        .stringifyValue(this as LogFilter);
  }

  @override
  bool operator ==(Object other) {
    return LogFilterMapper.ensureInitialized()
        .equalsValue(this as LogFilter, other);
  }

  @override
  int get hashCode {
    return LogFilterMapper.ensureInitialized().hashValue(this as LogFilter);
  }
}

extension LogFilterValueCopy<$R, $Out> on ObjectCopyWith<$R, LogFilter, $Out> {
  LogFilterCopyWith<$R, LogFilter, $Out> get $asLogFilter =>
      $base.as((v, t, t2) => _LogFilterCopyWithImpl(v, t, t2));
}

abstract class LogFilterCopyWith<$R, $In extends LogFilter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, LogLevel, ObjectCopyWith<$R, LogLevel, LogLevel>>?
      get levels;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get sources;
  $R call(
      {List<LogLevel>? levels,
      List<String>? sources,
      DateTime? from,
      DateTime? to,
      int? limit,
      int? offset,
      String? keyword});
  LogFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LogFilterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LogFilter, $Out>
    implements LogFilterCopyWith<$R, LogFilter, $Out> {
  _LogFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LogFilter> $mapper =
      LogFilterMapper.ensureInitialized();
  @override
  ListCopyWith<$R, LogLevel, ObjectCopyWith<$R, LogLevel, LogLevel>>?
      get levels => $value.levels != null
          ? ListCopyWith($value.levels!,
              (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(levels: v))
          : null;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>>? get sources =>
      $value.sources != null
          ? ListCopyWith(
              $value.sources!,
              (v, t) => ObjectCopyWith(v, $identity, t),
              (v) => call(sources: v))
          : null;
  @override
  $R call(
          {Object? levels = $none,
          Object? sources = $none,
          Object? from = $none,
          Object? to = $none,
          Object? limit = $none,
          Object? offset = $none,
          Object? keyword = $none}) =>
      $apply(FieldCopyWithData({
        if (levels != $none) #levels: levels,
        if (sources != $none) #sources: sources,
        if (from != $none) #from: from,
        if (to != $none) #to: to,
        if (limit != $none) #limit: limit,
        if (offset != $none) #offset: offset,
        if (keyword != $none) #keyword: keyword
      }));
  @override
  LogFilter $make(CopyWithData data) => LogFilter(
      levels: data.get(#levels, or: $value.levels),
      sources: data.get(#sources, or: $value.sources),
      from: data.get(#from, or: $value.from),
      to: data.get(#to, or: $value.to),
      limit: data.get(#limit, or: $value.limit),
      offset: data.get(#offset, or: $value.offset),
      keyword: data.get(#keyword, or: $value.keyword));

  @override
  LogFilterCopyWith<$R2, LogFilter, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LogFilterCopyWithImpl($value, $cast, t);
}
