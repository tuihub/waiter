import 'package:grpc/grpc.dart';
import 'package:tuihub_protos/librarian/sephirah/v1/sephirah.pbgrpc.dart';

LibrarianSephirahServiceClient newGrpc(
    {required String host, required int port, required bool tls}) {
  late ChannelCredentials credentials;
  if (tls) {
    credentials = const ChannelCredentials.secure();
  } else {
    credentials = const ChannelCredentials.insecure();
  }
  final channel = ClientChannel(
    host,
    port: port,
    options: ChannelOptions(
      credentials: credentials,
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  return LibrarianSephirahServiceClient(channel);
}
