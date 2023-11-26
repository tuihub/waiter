import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

import '../../model/common_model.dart';
import 'grpc.dart' if (dart.library.html) 'grpc_web.dart';

CallOptions withAuth(String token) {
  return CallOptions(metadata: {'Authorization': 'Bearer $token'});
}

LibrarianSephirahServiceClient clientFactory({required ServerConfig config}) {
  return newGrpc(host: config.host, port: config.port, tls: config.tls);
}
