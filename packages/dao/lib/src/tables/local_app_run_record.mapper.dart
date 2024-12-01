// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_app_run_record.dart';

class LocalAppRunRecordMapper extends ClassMapperBase<LocalAppRunRecord> {
  LocalAppRunRecordMapper._();

  static LocalAppRunRecordMapper? _instance;
  static LocalAppRunRecordMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalAppRunRecordMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalAppRunRecord';

  static String _$uuid(LocalAppRunRecord v) => v.uuid;
  static const Field<LocalAppRunRecord, String> _f$uuid = Field('uuid', _$uuid);
  static String _$appUUID(LocalAppRunRecord v) => v.appUUID;
  static const Field<LocalAppRunRecord, String> _f$appUUID =
      Field('appUUID', _$appUUID);
  static String _$instUUID(LocalAppRunRecord v) => v.instUUID;
  static const Field<LocalAppRunRecord, String> _f$instUUID =
      Field('instUUID', _$instUUID);
  static String _$launcherUUID(LocalAppRunRecord v) => v.launcherUUID;
  static const Field<LocalAppRunRecord, String> _f$launcherUUID =
      Field('launcherUUID', _$launcherUUID);
  static DateTime _$startTime(LocalAppRunRecord v) => v.startTime;
  static const Field<LocalAppRunRecord, DateTime> _f$startTime =
      Field('startTime', _$startTime);
  static DateTime? _$endTime(LocalAppRunRecord v) => v.endTime;
  static const Field<LocalAppRunRecord, DateTime> _f$endTime =
      Field('endTime', _$endTime, opt: true);

  @override
  final MappableFields<LocalAppRunRecord> fields = const {
    #uuid: _f$uuid,
    #appUUID: _f$appUUID,
    #instUUID: _f$instUUID,
    #launcherUUID: _f$launcherUUID,
    #startTime: _f$startTime,
    #endTime: _f$endTime,
  };

  static LocalAppRunRecord _instantiate(DecodingData data) {
    return LocalAppRunRecord(
        uuid: data.dec(_f$uuid),
        appUUID: data.dec(_f$appUUID),
        instUUID: data.dec(_f$instUUID),
        launcherUUID: data.dec(_f$launcherUUID),
        startTime: data.dec(_f$startTime),
        endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalAppRunRecord fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalAppRunRecord>(map);
  }

  static LocalAppRunRecord fromJson(String json) {
    return ensureInitialized().decodeJson<LocalAppRunRecord>(json);
  }
}

mixin LocalAppRunRecordMappable {
  String toJson() {
    return LocalAppRunRecordMapper.ensureInitialized()
        .encodeJson<LocalAppRunRecord>(this as LocalAppRunRecord);
  }

  Map<String, dynamic> toMap() {
    return LocalAppRunRecordMapper.ensureInitialized()
        .encodeMap<LocalAppRunRecord>(this as LocalAppRunRecord);
  }

  LocalAppRunRecordCopyWith<LocalAppRunRecord, LocalAppRunRecord,
          LocalAppRunRecord>
      get copyWith => _LocalAppRunRecordCopyWithImpl(
          this as LocalAppRunRecord, $identity, $identity);
  @override
  String toString() {
    return LocalAppRunRecordMapper.ensureInitialized()
        .stringifyValue(this as LocalAppRunRecord);
  }

  @override
  bool operator ==(Object other) {
    return LocalAppRunRecordMapper.ensureInitialized()
        .equalsValue(this as LocalAppRunRecord, other);
  }

  @override
  int get hashCode {
    return LocalAppRunRecordMapper.ensureInitialized()
        .hashValue(this as LocalAppRunRecord);
  }
}

extension LocalAppRunRecordValueCopy<$R, $Out>
    on ObjectCopyWith<$R, LocalAppRunRecord, $Out> {
  LocalAppRunRecordCopyWith<$R, LocalAppRunRecord, $Out>
      get $asLocalAppRunRecord =>
          $base.as((v, t, t2) => _LocalAppRunRecordCopyWithImpl(v, t, t2));
}

abstract class LocalAppRunRecordCopyWith<$R, $In extends LocalAppRunRecord,
    $Out> implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? uuid,
      String? appUUID,
      String? instUUID,
      String? launcherUUID,
      DateTime? startTime,
      DateTime? endTime});
  LocalAppRunRecordCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _LocalAppRunRecordCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalAppRunRecord, $Out>
    implements LocalAppRunRecordCopyWith<$R, LocalAppRunRecord, $Out> {
  _LocalAppRunRecordCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalAppRunRecord> $mapper =
      LocalAppRunRecordMapper.ensureInitialized();
  @override
  $R call(
          {String? uuid,
          String? appUUID,
          String? instUUID,
          String? launcherUUID,
          DateTime? startTime,
          Object? endTime = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (appUUID != null) #appUUID: appUUID,
        if (instUUID != null) #instUUID: instUUID,
        if (launcherUUID != null) #launcherUUID: launcherUUID,
        if (startTime != null) #startTime: startTime,
        if (endTime != $none) #endTime: endTime
      }));
  @override
  LocalAppRunRecord $make(CopyWithData data) => LocalAppRunRecord(
      uuid: data.get(#uuid, or: $value.uuid),
      appUUID: data.get(#appUUID, or: $value.appUUID),
      instUUID: data.get(#instUUID, or: $value.instUUID),
      launcherUUID: data.get(#launcherUUID, or: $value.launcherUUID),
      startTime: data.get(#startTime, or: $value.startTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  LocalAppRunRecordCopyWith<$R2, LocalAppRunRecord, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalAppRunRecordCopyWithImpl($value, $cast, t);
}
