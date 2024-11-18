// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'local_app.dart';

class LocalAppMapper extends ClassMapperBase<LocalApp> {
  LocalAppMapper._();

  static LocalAppMapper? _instance;
  static LocalAppMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = LocalAppMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'LocalApp';

  static String _$uuid(LocalApp v) => v.uuid;
  static const Field<LocalApp, String> _f$uuid = Field('uuid', _$uuid);
  static String _$name(LocalApp v) => v.name;
  static const Field<LocalApp, String> _f$name = Field('name', _$name);
  static String? _$lastLaunchedInstUUID(LocalApp v) => v.lastLaunchedInstUUID;
  static const Field<LocalApp, String> _f$lastLaunchedInstUUID =
      Field('lastLaunchedInstUUID', _$lastLaunchedInstUUID, opt: true);
  static String? _$shortDescription(LocalApp v) => v.shortDescription;
  static const Field<LocalApp, String> _f$shortDescription =
      Field('shortDescription', _$shortDescription, opt: true);
  static String? _$iconImageUrl(LocalApp v) => v.iconImageUrl;
  static const Field<LocalApp, String> _f$iconImageUrl =
      Field('iconImageUrl', _$iconImageUrl, opt: true);
  static String? _$iconImagePath(LocalApp v) => v.iconImagePath;
  static const Field<LocalApp, String> _f$iconImagePath =
      Field('iconImagePath', _$iconImagePath, opt: true);
  static String? _$backgroundImageUrl(LocalApp v) => v.backgroundImageUrl;
  static const Field<LocalApp, String> _f$backgroundImageUrl =
      Field('backgroundImageUrl', _$backgroundImageUrl, opt: true);
  static String? _$backgroundImagePath(LocalApp v) => v.backgroundImagePath;
  static const Field<LocalApp, String> _f$backgroundImagePath =
      Field('backgroundImagePath', _$backgroundImagePath, opt: true);
  static String? _$coverImageUrl(LocalApp v) => v.coverImageUrl;
  static const Field<LocalApp, String> _f$coverImageUrl =
      Field('coverImageUrl', _$coverImageUrl, opt: true);
  static String? _$coverImagePath(LocalApp v) => v.coverImagePath;
  static const Field<LocalApp, String> _f$coverImagePath =
      Field('coverImagePath', _$coverImagePath, opt: true);
  static String? _$description(LocalApp v) => v.description;
  static const Field<LocalApp, String> _f$description =
      Field('description', _$description, opt: true);
  static String? _$releaseDate(LocalApp v) => v.releaseDate;
  static const Field<LocalApp, String> _f$releaseDate =
      Field('releaseDate', _$releaseDate, opt: true);
  static String? _$developer(LocalApp v) => v.developer;
  static const Field<LocalApp, String> _f$developer =
      Field('developer', _$developer, opt: true);
  static String? _$publisher(LocalApp v) => v.publisher;
  static const Field<LocalApp, String> _f$publisher =
      Field('publisher', _$publisher, opt: true);

  @override
  final MappableFields<LocalApp> fields = const {
    #uuid: _f$uuid,
    #name: _f$name,
    #lastLaunchedInstUUID: _f$lastLaunchedInstUUID,
    #shortDescription: _f$shortDescription,
    #iconImageUrl: _f$iconImageUrl,
    #iconImagePath: _f$iconImagePath,
    #backgroundImageUrl: _f$backgroundImageUrl,
    #backgroundImagePath: _f$backgroundImagePath,
    #coverImageUrl: _f$coverImageUrl,
    #coverImagePath: _f$coverImagePath,
    #description: _f$description,
    #releaseDate: _f$releaseDate,
    #developer: _f$developer,
    #publisher: _f$publisher,
  };

  static LocalApp _instantiate(DecodingData data) {
    return LocalApp(
        uuid: data.dec(_f$uuid),
        name: data.dec(_f$name),
        lastLaunchedInstUUID: data.dec(_f$lastLaunchedInstUUID),
        shortDescription: data.dec(_f$shortDescription),
        iconImageUrl: data.dec(_f$iconImageUrl),
        iconImagePath: data.dec(_f$iconImagePath),
        backgroundImageUrl: data.dec(_f$backgroundImageUrl),
        backgroundImagePath: data.dec(_f$backgroundImagePath),
        coverImageUrl: data.dec(_f$coverImageUrl),
        coverImagePath: data.dec(_f$coverImagePath),
        description: data.dec(_f$description),
        releaseDate: data.dec(_f$releaseDate),
        developer: data.dec(_f$developer),
        publisher: data.dec(_f$publisher));
  }

  @override
  final Function instantiate = _instantiate;

  static LocalApp fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<LocalApp>(map);
  }

  static LocalApp fromJson(String json) {
    return ensureInitialized().decodeJson<LocalApp>(json);
  }
}

mixin LocalAppMappable {
  String toJson() {
    return LocalAppMapper.ensureInitialized()
        .encodeJson<LocalApp>(this as LocalApp);
  }

  Map<String, dynamic> toMap() {
    return LocalAppMapper.ensureInitialized()
        .encodeMap<LocalApp>(this as LocalApp);
  }

  LocalAppCopyWith<LocalApp, LocalApp, LocalApp> get copyWith =>
      _LocalAppCopyWithImpl(this as LocalApp, $identity, $identity);
  @override
  String toString() {
    return LocalAppMapper.ensureInitialized().stringifyValue(this as LocalApp);
  }

  @override
  bool operator ==(Object other) {
    return LocalAppMapper.ensureInitialized()
        .equalsValue(this as LocalApp, other);
  }

  @override
  int get hashCode {
    return LocalAppMapper.ensureInitialized().hashValue(this as LocalApp);
  }
}

extension LocalAppValueCopy<$R, $Out> on ObjectCopyWith<$R, LocalApp, $Out> {
  LocalAppCopyWith<$R, LocalApp, $Out> get $asLocalApp =>
      $base.as((v, t, t2) => _LocalAppCopyWithImpl(v, t, t2));
}

abstract class LocalAppCopyWith<$R, $In extends LocalApp, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call(
      {String? uuid,
      String? name,
      String? lastLaunchedInstUUID,
      String? shortDescription,
      String? iconImageUrl,
      String? iconImagePath,
      String? backgroundImageUrl,
      String? backgroundImagePath,
      String? coverImageUrl,
      String? coverImagePath,
      String? description,
      String? releaseDate,
      String? developer,
      String? publisher});
  LocalAppCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _LocalAppCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, LocalApp, $Out>
    implements LocalAppCopyWith<$R, LocalApp, $Out> {
  _LocalAppCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<LocalApp> $mapper =
      LocalAppMapper.ensureInitialized();
  @override
  $R call(
          {String? uuid,
          String? name,
          Object? lastLaunchedInstUUID = $none,
          Object? shortDescription = $none,
          Object? iconImageUrl = $none,
          Object? iconImagePath = $none,
          Object? backgroundImageUrl = $none,
          Object? backgroundImagePath = $none,
          Object? coverImageUrl = $none,
          Object? coverImagePath = $none,
          Object? description = $none,
          Object? releaseDate = $none,
          Object? developer = $none,
          Object? publisher = $none}) =>
      $apply(FieldCopyWithData({
        if (uuid != null) #uuid: uuid,
        if (name != null) #name: name,
        if (lastLaunchedInstUUID != $none)
          #lastLaunchedInstUUID: lastLaunchedInstUUID,
        if (shortDescription != $none) #shortDescription: shortDescription,
        if (iconImageUrl != $none) #iconImageUrl: iconImageUrl,
        if (iconImagePath != $none) #iconImagePath: iconImagePath,
        if (backgroundImageUrl != $none)
          #backgroundImageUrl: backgroundImageUrl,
        if (backgroundImagePath != $none)
          #backgroundImagePath: backgroundImagePath,
        if (coverImageUrl != $none) #coverImageUrl: coverImageUrl,
        if (coverImagePath != $none) #coverImagePath: coverImagePath,
        if (description != $none) #description: description,
        if (releaseDate != $none) #releaseDate: releaseDate,
        if (developer != $none) #developer: developer,
        if (publisher != $none) #publisher: publisher
      }));
  @override
  LocalApp $make(CopyWithData data) => LocalApp(
      uuid: data.get(#uuid, or: $value.uuid),
      name: data.get(#name, or: $value.name),
      lastLaunchedInstUUID:
          data.get(#lastLaunchedInstUUID, or: $value.lastLaunchedInstUUID),
      shortDescription:
          data.get(#shortDescription, or: $value.shortDescription),
      iconImageUrl: data.get(#iconImageUrl, or: $value.iconImageUrl),
      iconImagePath: data.get(#iconImagePath, or: $value.iconImagePath),
      backgroundImageUrl:
          data.get(#backgroundImageUrl, or: $value.backgroundImageUrl),
      backgroundImagePath:
          data.get(#backgroundImagePath, or: $value.backgroundImagePath),
      coverImageUrl: data.get(#coverImageUrl, or: $value.coverImageUrl),
      coverImagePath: data.get(#coverImagePath, or: $value.coverImagePath),
      description: data.get(#description, or: $value.description),
      releaseDate: data.get(#releaseDate, or: $value.releaseDate),
      developer: data.get(#developer, or: $value.developer),
      publisher: data.get(#publisher, or: $value.publisher));

  @override
  LocalAppCopyWith<$R2, LocalApp, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _LocalAppCopyWithImpl($value, $cast, t);
}
