import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import 'utils.dart';

part 'local_app.mapper.dart';

@MappableClass()
class LocalApp with LocalAppMappable {
  final String uuid;
  final String name;
  final String? lastLaunchedInstUUID;
  final String? shortDescription;
  final String? iconImageUrl;
  final String? iconImagePath;
  final String? backgroundImageUrl;
  final String? backgroundImagePath;
  final String? coverImageUrl;
  final String? coverImagePath;
  final String? description;
  final String? releaseDate;
  final String? developer;
  final String? publisher;
  final Map<String, String> thirdPartyIds;

  const LocalApp({
    required this.uuid,
    required this.name,
    this.lastLaunchedInstUUID,
    this.shortDescription,
    this.iconImageUrl,
    this.iconImagePath,
    this.backgroundImageUrl,
    this.backgroundImagePath,
    this.coverImageUrl,
    this.coverImagePath,
    this.description,
    this.releaseDate,
    this.developer,
    this.publisher,
    this.thirdPartyIds = const {},
  });

  static const fromMap = LocalAppMapper.fromMap;
  static const fromJson = LocalAppMapper.fromJson;
}

@UseRowClass(LocalApp)
@TableIndex(name: 'local_app_uuid', columns: {#uuid})
class LocalAppTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get name => text()();
  TextColumn get lastLaunchedInstUUID => text().nullable()();
  TextColumn get shortDescription => text().nullable()();
  TextColumn get iconImageUrl => text().nullable()();
  TextColumn get iconImagePath => text().nullable()();
  TextColumn get backgroundImageUrl => text().nullable()();
  TextColumn get backgroundImagePath => text().nullable()();
  TextColumn get coverImageUrl => text().nullable()();
  TextColumn get coverImagePath => text().nullable()();
  TextColumn get description => text().nullable()();
  TextColumn get releaseDate => text().nullable()();
  TextColumn get developer => text().nullable()();
  TextColumn get publisher => text().nullable()();
  TextColumn get thirdPartyIds => text().map(const StringMapConverter())();
}
