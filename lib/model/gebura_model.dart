import 'package:dart_mappable/dart_mappable.dart';

part 'gebura_model.mapper.dart';

@MappableClass()
class LibrarySettings with LibrarySettingsMappable {
  final LibraryFilter? filter;

  const LibrarySettings({this.filter});

  static const fromMap = LibrarySettingsMapper.fromMap;
  static const fromJson = LibrarySettingsMapper.fromJson;
}

@MappableClass()
class LibraryFilter with LibraryFilterMappable {
  final String? query;

  const LibraryFilter({this.query});

  static const fromMap = LibraryFilterMapper.fromMap;
  static const fromJson = LibraryFilterMapper.fromJson;
}

@MappableClass()
class LibraryListItem with LibraryListItemMappable {
  final String uuid;
  final String name;
  final String? iconImagePath;
  final String? coverImagePath;
  final String? backgroundImagePath;
  final bool filtered;
  // final int? appID;
  // final String? localAppUUID;

  const LibraryListItem({
    required this.uuid,
    required this.name,
    this.iconImagePath,
    this.coverImagePath,
    this.backgroundImagePath,
    this.filtered = false,
    // this.appID,
    // this.localAppUUID,
  });

  static const fromMap = LibraryListItemMapper.fromMap;
  static const fromJson = LibraryListItemMapper.fromJson;
}

@MappableClass()
class LocalLibraryScanResult with LocalLibraryScanResultMappable {
  final String uuid;
  final LocalLibraryScanResultType type;
  final String path;
  final int? trackedCount;
  final int? installedCount;
  final List<LocalLibraryScanResultDetail>? details;

  const LocalLibraryScanResult({
    required this.uuid,
    required this.type,
    required this.path,
    this.trackedCount,
    this.installedCount,
    this.details,
  });

  static const fromMap = LocalLibraryScanResultMapper.fromMap;
  static const fromJson = LocalLibraryScanResultMapper.fromJson;
}

enum LocalLibraryScanResultType {
  common,
  steam,
}

@MappableClass()
class LocalLibraryScanResultDetail with LocalLibraryScanResultDetailMappable {
  final String uuid;
  final String name;
  final String path;
  final String? iconImagePath;
  final bool tracked;

  const LocalLibraryScanResultDetail({
    required this.uuid,
    required this.name,
    required this.path,
    this.iconImagePath,
    required this.tracked,
  });

  static const fromMap = LocalLibraryScanResultDetailMapper.fromMap;
  static const fromJson = LocalLibraryScanResultDetailMapper.fromJson;
}
