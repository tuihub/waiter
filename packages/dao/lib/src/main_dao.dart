import 'package:drift/drift.dart';

import 'database.dart';
import 'tables/server_config.dart';

part 'main_dao.g.dart';

@DriftAccessor(tables: [ServerConfigTable])
class MainDao extends DatabaseAccessor<AppDatabase> with _$MainDaoMixin {
  MainDao(super.db);

  Future<int> upsertServer(ServerConfig data) async {
    if (data.username.isEmpty) {
      throw Exception('Username is empty');
    }
    return into(serverConfigTable).insert(
      ServerConfigTableCompanion(
        host: Value(data.host),
        port: Value(data.port),
        enableTLS: Value(data.enableTLS),
        username: Value(data.username),
        refreshToken: Value(data.refreshToken),
        deviceId: Value(data.deviceId),
      ),
      onConflict: DoUpdate((old) {
        return ServerConfigTableCompanion(
          enableTLS: Value(data.enableTLS),
          refreshToken: Value(data.refreshToken),
          deviceId: Value(data.deviceId),
        );
      }, target: [
        serverConfigTable.host,
        serverConfigTable.port,
        serverConfigTable.username,
      ]),
    );
  }

  Future<List<ServerConfig>> loadServers() async {
    final query = select(serverConfigTable);
    return query.get();
  }
}
