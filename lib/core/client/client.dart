import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

import 'grpc.dart'
    if (dart.library.html) 'package:waiter/common/client/grpc_web.dart';

final grpcProvider = newGrpc("localhost", 9000);

CallOptions withAuth(String token) {
  return CallOptions(metadata: {'Authorization': 'Bearer $token'});
}
