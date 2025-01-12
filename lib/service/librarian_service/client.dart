import 'package:dao/dao.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

import 'unsupported.dart'
    if (dart.library.ffi) '_grpc.dart'
    if (dart.library.html) '_grpc_web.dart';

CallOptions withAuth(String token) {
  return CallOptions(metadata: {'Authorization': 'Bearer $token'});
}

Future<LibrarianSephirahServiceClient> clientFactory({
  required ServerConfig config,
  bool? useSystemProxy,
}) {
  return newGrpc(
    host: config.host,
    port: config.port,
    tls: config.enableTLS,
    useSystemProxy: useSystemProxy ?? false,
  );
}

Future<void> applySystemProxy() {
  return applySystemProxyImpl();
}
