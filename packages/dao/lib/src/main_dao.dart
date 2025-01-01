import 'package:dao/src/tables/server_config.dart';
import 'package:drift/drift.dart';

import 'database.dart';

part 'main_dao.g.dart';

@DriftAccessor(tables: [ServerConfigTable])
class MainDao extends DatabaseAccessor<AppDatabase> with _$MainDaoMixin {
  MainDao(super.db);

  Future<int> addServer(ServerConfig data) async {
    if (data.username.isEmpty) {
      throw Exception('Username is empty');
    }
    return into(serverConfigTable).insert(ServerConfigTableCompanion(
      host: Value(data.host),
      port: Value(data.port),
      enableTLS: Value(data.enableTLS),
      username: Value(data.username),
      refreshToken: Value(data.refreshToken),
      deviceId: Value(data.deviceId),
    ));
  }

  Future<List<ServerConfig>> loadServers() async {
    final query = select(serverConfigTable);
    return query.get();
  }
}
