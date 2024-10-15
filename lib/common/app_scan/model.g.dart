// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonAppFolderScanSettingImpl _$$CommonAppFolderScanSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonAppFolderScanSettingImpl(
      basePath: json['basePath'] as String,
      targetFileMatchers: (json['targetFileMatchers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      excludeFileMatchers: (json['excludeFileMatchers'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      excludeDirectoryMatchers:
          (json['excludeDirectoryMatchers'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      pathFieldMatcher: (json['pathFieldMatcher'] as List<dynamic>)
          .map((e) =>
              $enumDecode(_$CommonAppFolderScanPathFieldMatcherEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$CommonAppFolderScanSettingImplToJson(
        _$CommonAppFolderScanSettingImpl instance) =>
    <String, dynamic>{
      'basePath': instance.basePath,
      'targetFileMatchers': instance.targetFileMatchers,
      'excludeFileMatchers': instance.excludeFileMatchers,
      'excludeDirectoryMatchers': instance.excludeDirectoryMatchers,
      'pathFieldMatcher': instance.pathFieldMatcher
          .map((e) => _$CommonAppFolderScanPathFieldMatcherEnumMap[e]!)
          .toList(),
    };

const _$CommonAppFolderScanPathFieldMatcherEnumMap = {
  CommonAppFolderScanPathFieldMatcher.ignore: 'ignore',
  CommonAppFolderScanPathFieldMatcher.name: 'name',
  CommonAppFolderScanPathFieldMatcher.version: 'version',
};

_$CommonAppFolderScanResultImpl _$$CommonAppFolderScanResultImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonAppFolderScanResultImpl(
      installedApps: (json['installedApps'] as List<dynamic>)
          .map((e) => InstalledCommonApps.fromJson(e as Map<String, dynamic>))
          .toList(),
      details: (json['details'] as List<dynamic>)
          .map((e) => CommonAppFolderScanResultDetail.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CommonAppFolderScanResultImplToJson(
        _$CommonAppFolderScanResultImpl instance) =>
    <String, dynamic>{
      'installedApps': instance.installedApps,
      'details': instance.details,
    };

_$CommonAppFolderScanResultDetailImpl
    _$$CommonAppFolderScanResultDetailImplFromJson(Map<String, dynamic> json) =>
        _$CommonAppFolderScanResultDetailImpl(
          path: json['path'] as String,
          type:
              $enumDecode(_$CommonAppFolderScanEntryTypeEnumMap, json['type']),
          status: $enumDecode(
              _$CommonAppFolderScanEntryStatusEnumMap, json['status']),
          usedMatchers: (json['usedMatchers'] as List<dynamic>?)
                  ?.map((e) => $enumDecode(
                      _$CommonAppFolderScanPathFieldMatcherEnumMap, e))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$CommonAppFolderScanResultDetailImplToJson(
        _$CommonAppFolderScanResultDetailImpl instance) =>
    <String, dynamic>{
      'path': instance.path,
      'type': _$CommonAppFolderScanEntryTypeEnumMap[instance.type]!,
      'status': _$CommonAppFolderScanEntryStatusEnumMap[instance.status]!,
      'usedMatchers': instance.usedMatchers
          .map((e) => _$CommonAppFolderScanPathFieldMatcherEnumMap[e]!)
          .toList(),
    };

const _$CommonAppFolderScanEntryTypeEnumMap = {
  CommonAppFolderScanEntryType.file: 'file',
  CommonAppFolderScanEntryType.directory: 'directory',
  CommonAppFolderScanEntryType.unknown: 'unknown',
};

const _$CommonAppFolderScanEntryStatusEnumMap = {
  CommonAppFolderScanEntryStatus.error: 'error',
  CommonAppFolderScanEntryStatus.skipped: 'skipped',
  CommonAppFolderScanEntryStatus.accessed: 'accessed',
  CommonAppFolderScanEntryStatus.hit: 'hit',
};

_$InstalledCommonAppsImpl _$$InstalledCommonAppsImplFromJson(
        Map<String, dynamic> json) =>
    _$InstalledCommonAppsImpl(
      name: json['name'] as String,
      version: json['version'] as String,
      installPath: json['installPath'] as String,
      launcherPaths: (json['launcherPaths'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$InstalledCommonAppsImplToJson(
        _$InstalledCommonAppsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'version': instance.version,
      'installPath': instance.installPath,
      'launcherPaths': instance.launcherPaths,
    };
