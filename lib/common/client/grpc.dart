import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

LibrarianSephirahServiceClient newGrpc(
    {String host = "theam-grpc.gyx.moe", int port = 443}) {
  final channel = ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
      credentials: const ChannelCredentials.secure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  return LibrarianSephirahServiceClient(channel);
}
