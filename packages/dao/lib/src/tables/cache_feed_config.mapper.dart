// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cache_feed_config.dart';

class CacheFeedConfigMapper extends ClassMapperBase<CacheFeedConfig> {
  CacheFeedConfigMapper._();

  static CacheFeedConfigMapper? _instance;
  static CacheFeedConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheFeedConfigMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CacheFeedConfig';

  static String _$serverId(CacheFeedConfig v) => v.serverId;
  static const Field<CacheFeedConfig, String> _f$serverId =
      Field('serverId', _$serverId);
  static String _$internalId(CacheFeedConfig v) => v.internalId;
  static const Field<CacheFeedConfig, String> _f$internalId =
      Field('internalId', _$internalId);
  static String _$name(CacheFeedConfig v) => v.name;
  static const Field<CacheFeedConfig, String> _f$name = Field('name', _$name);
  static String _$category(CacheFeedConfig v) => v.category;
  static const Field<CacheFeedConfig, String> _f$category =
      Field('category', _$category);
  static String _$rawJsonData(CacheFeedConfig v) => v.rawJsonData;
  static const Field<CacheFeedConfig, String> _f$rawJsonData =
      Field('rawJsonData', _$rawJsonData);

  @override
  final MappableFields<CacheFeedConfig> fields = const {
    #serverId: _f$serverId,
    #internalId: _f$internalId,
    #name: _f$name,
    #category: _f$category,
    #rawJsonData: _f$rawJsonData,
  };

  static CacheFeedConfig _instantiate(DecodingData data) {
    return CacheFeedConfig(
        serverId: data.dec(_f$serverId),
        internalId: data.dec(_f$internalId),
        name: data.dec(_f$name),
        category: data.dec(_f$category),
        rawJsonData: data.dec(_f$rawJsonData));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheFeedConfig fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheFeedConfig>(map);
  }

  static CacheFeedConfig fromJson(String json) {
    return ensureInitialized().decodeJson<CacheFeedConfig>(json);
  }
}

mixin CacheFeedConfigMappable {
  String toJson() {
    return CacheFeedConfigMapper.ensureInitialized()
        .encodeJson<CacheFeedConfig>(this as CacheFeedConfig);
  }

  Map<String, dynamic> toMap() {
    return CacheFeedConfigMapper.ensureInitialized()
        .encodeMap<CacheFeedConfig>(this as CacheFeedConfig);
  }

  CacheFeedConfigCopyWith<CacheFeedConfig, CacheFeedConfig, CacheFeedConfig>
      get copyWith => _CacheFeedConfigCopyWithImpl(
          this as CacheFeedConfig, $identity, $identity);
  @override
  String toString() {
    return CacheFeedConfigMapper.ensureInitialized()
        .stringifyValue(this as CacheFeedConfig);
  }

  @override
  bool operator ==(Object other) {
    return CacheFeedConfigMapper.ensureInitialized()
        .equalsValue(this as CacheFeedConfig, other);
  }

  @override
  int get hashCode {
    return CacheFeedConfigMapper.ensureInitialized()
        .hashValue(this as CacheFeedConfig);
  }
}

extension CacheFeedConfigValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheFeedConfig, $Out> {
  CacheFeedConfigCopyWith<$R, CacheFeedConfig, $Out> get $asCacheFeedConfig =>
      $base.as((v, t, t2) => _CacheFeedConfigCopyWithImpl(v, t, t2));
}

abstract class CacheFeedConfigCopyWith<$R, $In extends CacheFeedConfig, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? serverId,
      String? internalId,
      String? name,
      String? category,
      String? rawJsonData});
  CacheFeedConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _CacheFeedConfigCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheFeedConfig, $Out>
    implements CacheFeedConfigCopyWith<$R, CacheFeedConfig, $Out> {
  _CacheFeedConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheFeedConfig> $mapper =
      CacheFeedConfigMapper.ensureInitialized();
  @override
  $R call(
          {String? serverId,
          String? internalId,
          String? name,
          String? category,
          String? rawJsonData}) =>
      $apply(FieldCopyWithData({
        if (serverId != null) #serverId: serverId,
        if (internalId != null) #internalId: internalId,
        if (name != null) #name: name,
        if (category != null) #category: category,
        if (rawJsonData != null) #rawJsonData: rawJsonData
      }));
  @override
  CacheFeedConfig $make(CopyWithData data) => CacheFeedConfig(
      serverId: data.get(#serverId, or: $value.serverId),
      internalId: data.get(#internalId, or: $value.internalId),
      name: data.get(#name, or: $value.name),
      category: data.get(#category, or: $value.category),
      rawJsonData: data.get(#rawJsonData, or: $value.rawJsonData));

  @override
  CacheFeedConfigCopyWith<$R2, CacheFeedConfig, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CacheFeedConfigCopyWithImpl($value, $cast, t);
}
