import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:waitress/common/client/grpc.dart';

import '../const/string.dart';
import 'grpc.dart'
    if (dart.library.html) 'package:waiter/common/client/grpc_web.dart';

CallOptions withAuth(String token) {
  return CallOptions(metadata: {'Authorization': 'Bearer $token'});
}

LibrarianSephirahServiceClient clientFactory(
    {required ServerConfig config}) {
  return newGrpc(host: config.host, port: config.port, tls: config.tls);
}
