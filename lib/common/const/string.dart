const settingBoxKey = "setting";
const List<ServerConfig> newServerList = [
  ServerConfig("theam-grpc.gyx.moe", 443, true),
  ServerConfig("theam-grpc.gyx1.cn", 443, true),
  ServerConfig("theam-grpc-rp.gyx1.cn", 443, true),
  // ServerConfig("theam-grpc-rp2.gyx1.cn", 443, true),
  ServerConfig("theam-grpc-rp2.gyx1.cn", 443, true),
];
class ServerConfig {
  final String host;
  final int port;
  final bool tls;

  const ServerConfig(this.host, this.port, this.tls);
}