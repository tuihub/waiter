import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

LibrarianSephirahServiceClient newGrpc(String host, int port) {
  final channel = ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  return LibrarianSephirahServiceClient(channel);
}
