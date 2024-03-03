import 'package:grpc/grpc_web.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

Future<LibrarianSephirahServiceClient> newGrpc({
  required String host,
  required int port,
  required bool tls,
  bool useSystemProxy = false,
}) async {
  late String schema;
  if (tls) {
    schema = 'https://';
  } else {
    schema = 'http://';
  }
  final channel = GrpcWebClientChannel.xhr(Uri.parse('$schema$host:$port'));
  return LibrarianSephirahServiceClient(channel);
}

Future<void> applySystemProxyImpl() async {
  // do nothing
}
