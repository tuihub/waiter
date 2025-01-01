import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

Future<LibrarianSephirahServiceClient> newGrpc({
  required String host,
  required int port,
  required bool tls,
  bool useSystemProxy = false,
}) async {
  throw UnsupportedError('Cannot create gRPC client on this platform');
}

Future<void> applySystemProxyImpl() async {
  // do nothing
}
