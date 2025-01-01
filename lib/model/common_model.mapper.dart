// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'common_model.dart';

class ClientDeviceInfoMapper extends ClassMapperBase<ClientDeviceInfo> {
  ClientDeviceInfoMapper._();

  static ClientDeviceInfoMapper? _instance;
  static ClientDeviceInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ClientDeviceInfoMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'ClientDeviceInfo';

  static String _$deviceName(ClientDeviceInfo v) => v.deviceName;
  static const Field<ClientDeviceInfo, String> _f$deviceName =
      Field('deviceName', _$deviceName);
  static String _$systemVersion(ClientDeviceInfo v) => v.systemVersion;
  static const Field<ClientDeviceInfo, String> _f$systemVersion =
      Field('systemVersion', _$systemVersion);

  @override
  final MappableFields<ClientDeviceInfo> fields = const {
    #deviceName: _f$deviceName,
    #systemVersion: _f$systemVersion,
  };

  static ClientDeviceInfo _instantiate(DecodingData data) {
    return ClientDeviceInfo(
        data.dec(_f$deviceName), data.dec(_f$systemVersion));
  }

  @override
  final Function instantiate = _instantiate;

  static ClientDeviceInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ClientDeviceInfo>(map);
  }

  static ClientDeviceInfo fromJson(String json) {
    return ensureInitialized().decodeJson<ClientDeviceInfo>(json);
  }
}

mixin ClientDeviceInfoMappable {
  String toJson() {
    return ClientDeviceInfoMapper.ensureInitialized()
        .encodeJson<ClientDeviceInfo>(this as ClientDeviceInfo);
  }

  Map<String, dynamic> toMap() {
    return ClientDeviceInfoMapper.ensureInitialized()
        .encodeMap<ClientDeviceInfo>(this as ClientDeviceInfo);
  }

  ClientDeviceInfoCopyWith<ClientDeviceInfo, ClientDeviceInfo, ClientDeviceInfo>
      get copyWith => _ClientDeviceInfoCopyWithImpl(
          this as ClientDeviceInfo, $identity, $identity);
  @override
  String toString() {
    return ClientDeviceInfoMapper.ensureInitialized()
        .stringifyValue(this as ClientDeviceInfo);
  }

  @override
  bool operator ==(Object other) {
    return ClientDeviceInfoMapper.ensureInitialized()
        .equalsValue(this as ClientDeviceInfo, other);
  }

  @override
  int get hashCode {
    return ClientDeviceInfoMapper.ensureInitialized()
        .hashValue(this as ClientDeviceInfo);
  }
}

extension ClientDeviceInfoValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ClientDeviceInfo, $Out> {
  ClientDeviceInfoCopyWith<$R, ClientDeviceInfo, $Out>
      get $asClientDeviceInfo =>
          $base.as((v, t, t2) => _ClientDeviceInfoCopyWithImpl(v, t, t2));
}

abstract class ClientDeviceInfoCopyWith<$R, $In extends ClientDeviceInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? deviceName, String? systemVersion});
  ClientDeviceInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ClientDeviceInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ClientDeviceInfo, $Out>
    implements ClientDeviceInfoCopyWith<$R, ClientDeviceInfo, $Out> {
  _ClientDeviceInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ClientDeviceInfo> $mapper =
      ClientDeviceInfoMapper.ensureInitialized();
  @override
  $R call({String? deviceName, String? systemVersion}) =>
      $apply(FieldCopyWithData({
        if (deviceName != null) #deviceName: deviceName,
        if (systemVersion != null) #systemVersion: systemVersion
      }));
  @override
  ClientDeviceInfo $make(CopyWithData data) => ClientDeviceInfo(
      data.get(#deviceName, or: $value.deviceName),
      data.get(#systemVersion, or: $value.systemVersion));

  @override
  ClientDeviceInfoCopyWith<$R2, ClientDeviceInfo, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ClientDeviceInfoCopyWithImpl($value, $cast, t);
}
