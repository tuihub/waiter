// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'cache_feed_item.dart';

class CacheFeedItemMapper extends ClassMapperBase<CacheFeedItem> {
  CacheFeedItemMapper._();

  static CacheFeedItemMapper? _instance;
  static CacheFeedItemMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CacheFeedItemMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CacheFeedItem';

  static String _$serverId(CacheFeedItem v) => v.serverId;
  static const Field<CacheFeedItem, String> _f$serverId =
      Field('serverId', _$serverId);
  static String _$internalId(CacheFeedItem v) => v.internalId;
  static const Field<CacheFeedItem, String> _f$internalId =
      Field('internalId', _$internalId);
  static String _$rawJsonData(CacheFeedItem v) => v.rawJsonData;
  static const Field<CacheFeedItem, String> _f$rawJsonData =
      Field('rawJsonData', _$rawJsonData);

  @override
  final MappableFields<CacheFeedItem> fields = const {
    #serverId: _f$serverId,
    #internalId: _f$internalId,
    #rawJsonData: _f$rawJsonData,
  };

  static CacheFeedItem _instantiate(DecodingData data) {
    return CacheFeedItem(
        serverId: data.dec(_f$serverId),
        internalId: data.dec(_f$internalId),
        rawJsonData: data.dec(_f$rawJsonData));
  }

  @override
  final Function instantiate = _instantiate;

  static CacheFeedItem fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CacheFeedItem>(map);
  }

  static CacheFeedItem fromJson(String json) {
    return ensureInitialized().decodeJson<CacheFeedItem>(json);
  }
}

mixin CacheFeedItemMappable {
  String toJson() {
    return CacheFeedItemMapper.ensureInitialized()
        .encodeJson<CacheFeedItem>(this as CacheFeedItem);
  }

  Map<String, dynamic> toMap() {
    return CacheFeedItemMapper.ensureInitialized()
        .encodeMap<CacheFeedItem>(this as CacheFeedItem);
  }

  CacheFeedItemCopyWith<CacheFeedItem, CacheFeedItem, CacheFeedItem>
      get copyWith => _CacheFeedItemCopyWithImpl(
          this as CacheFeedItem, $identity, $identity);
  @override
  String toString() {
    return CacheFeedItemMapper.ensureInitialized()
        .stringifyValue(this as CacheFeedItem);
  }

  @override
  bool operator ==(Object other) {
    return CacheFeedItemMapper.ensureInitialized()
        .equalsValue(this as CacheFeedItem, other);
  }

  @override
  int get hashCode {
    return CacheFeedItemMapper.ensureInitialized()
        .hashValue(this as CacheFeedItem);
  }
}

extension CacheFeedItemValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CacheFeedItem, $Out> {
  CacheFeedItemCopyWith<$R, CacheFeedItem, $Out> get $asCacheFeedItem =>
      $base.as((v, t, t2) => _CacheFeedItemCopyWithImpl(v, t, t2));
}

abstract class CacheFeedItemCopyWith<$R, $In extends CacheFeedItem, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? serverId, String? internalId, String? rawJsonData});
  CacheFeedItemCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CacheFeedItemCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CacheFeedItem, $Out>
    implements CacheFeedItemCopyWith<$R, CacheFeedItem, $Out> {
  _CacheFeedItemCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CacheFeedItem> $mapper =
      CacheFeedItemMapper.ensureInitialized();
  @override
  $R call({String? serverId, String? internalId, String? rawJsonData}) =>
      $apply(FieldCopyWithData({
        if (serverId != null) #serverId: serverId,
        if (internalId != null) #internalId: internalId,
        if (rawJsonData != null) #rawJsonData: rawJsonData
      }));
  @override
  CacheFeedItem $make(CopyWithData data) => CacheFeedItem(
      serverId: data.get(#serverId, or: $value.serverId),
      internalId: data.get(#internalId, or: $value.internalId),
      rawJsonData: data.get(#rawJsonData, or: $value.rawJsonData));

  @override
  CacheFeedItemCopyWith<$R2, CacheFeedItem, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _CacheFeedItemCopyWithImpl($value, $cast, t);
}
