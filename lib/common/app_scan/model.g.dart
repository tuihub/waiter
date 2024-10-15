// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommonAppFolderScanSettingImpl _$$CommonAppFolderScanSettingImplFromJson(
        Map<String, dynamic> json) =>
    _$CommonAppFolderScanSettingImpl(
      basePath: json['basePath'] as String,
      excludeDirectoryMatchers:
          (json['excludeDirectoryMatchers'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      minInstallDirDepth: (json['minInstallDirDepth'] as num).toInt(),
      maxInstallDirDepth: (json['maxInstallDirDepth'] as num).toInt(),
      pathFieldMatcher: (json['pathFieldMatcher'] as List<dynamic>)
          .map((e) =>
              $enumDecode(_$CommonAppFolderScanPathFieldMatcherEnumMap, e))
          .toList(),
      pathFieldMatcherAlignment: $enumDecode(
          _$CommonAppFolderScanPathFieldMatcherAlignmentEnumMap,
          json['pathFieldMatcherAlignment']),
      includeExecutableMatchers:
          (json['includeExecutableMatchers'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      excludeExecutableMatchers:
          (json['excludeExecutableMatchers'] as List<dynamic>)
              .map((e) => e as String)
              .toList(),
      minExecutableDepth: (json['minExecutableDepth'] as num).toInt(),
      maxExecutableDepth: (json['maxExecutableDepth'] as num).toInt(),
    );

Map<String, dynamic> _$$CommonAppFolderScanSettingImplToJson(
        _$CommonAppFolderScanSettingImpl instance) =>
    <String, dynamic>{
      'basePath': instance.basePath,
      'excludeDirectoryMatchers': instance.excludeDirectoryMatchers,
      'minInstallDirDepth': instance.minInstallDirDepth,
      'maxInstallDirDepth': instance.maxInstallDirDepth,
      'pathFieldMatcher': instance.pathFieldMatcher
          .map((e) => _$CommonAppFolderScanPathFieldMatcherEnumMap[e]!)
          .toList(),
      'pathFieldMatcherAlignment':
          _$CommonAppFolderScanPathFieldMatcherAlignmentEnumMap[
              instance.pathFieldMatcherAlignment]!,
      'includeExecutableMatchers': instance.includeExecutableMatchers,
      'excludeExecutableMatchers': instance.excludeExecutableMatchers,
      'minExecutableDepth': instance.minExecutableDepth,
      'maxExecutableDepth': instance.maxExecutableDepth,
    };

const _$CommonAppFolderScanPathFieldMatcherEnumMap = {
  CommonAppFolderScanPathFieldMatcher.ignore: 'ignore',
  CommonAppFolderScanPathFieldMatcher.name: 'name',
  CommonAppFolderScanPathFieldMatcher.version: 'version',
};

const _$CommonAppFolderScanPathFieldMatcherAlignmentEnumMap = {
  CommonAppFolderScanPathFieldMatcherAlignment.left: 'left',
  CommonAppFolderScanPathFieldMatcherAlignment.right: 'right',
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
      code: $enumDecode(_$CommonAppFolderScanResultCodeEnumMap, json['code']),
      msg: json['msg'] as String?,
    );

Map<String, dynamic> _$$CommonAppFolderScanResultImplToJson(
        _$CommonAppFolderScanResultImpl instance) =>
    <String, dynamic>{
      'installedApps': instance.installedApps,
      'details': instance.details,
      'code': _$CommonAppFolderScanResultCodeEnumMap[instance.code]!,
      'msg': instance.msg,
    };

const _$CommonAppFolderScanResultCodeEnumMap = {
  CommonAppFolderScanResultCode.unavailable: 'unavailable',
  CommonAppFolderScanResultCode.unknownError: 'unknownError',
  CommonAppFolderScanResultCode.baseFolderNotFound: 'baseFolderNotFound',
  CommonAppFolderScanResultCode.success: 'success',
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
