import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';
import 'package:waitress/common/client/grpc.dart';

import 'grpc.dart'
    if (dart.library.html) 'package:waiter/common/client/grpc_web.dart';

CallOptions withAuth(String token) {
  return CallOptions(metadata: {'Authorization': 'Bearer $token'});
}

LibrarianSephirahServiceClient clientFactory(
    {String host = "theam-grpc.gyx.moe", int port = 443}) {
  return newGrpc(host: host, port: port);
}
