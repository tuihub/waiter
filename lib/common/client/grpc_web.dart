import 'package:grpc/grpc_web.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

LibrarianSephirahServiceClient newGrpc(
    {String host = "theam-grpc.gyx.moe", int port = 443}) {
  final channel = GrpcWebClientChannel.xhr(Uri.parse('http://$host:$port'));
  return LibrarianSephirahServiceClient(channel);
}
