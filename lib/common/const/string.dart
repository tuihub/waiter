const settingBoxKey = "setting";
const List<ServerConfig> newServerList = [
  ServerConfig("theam-grpc.gyx.moe", 443, true, name: "cf 代理"),
  ServerConfig("theam-grpc.gyx1.cn", 443, true, name: "直连"),
  ServerConfig("theam-grpc-rp.gyx1.cn", 443, true, name: "rp1"),
  ServerConfig("theam-grpc-rp2.gyx1.cn", 443, true, name: "rp2"),
];

class ServerConfig {
  final String host;
  final int port;
  final bool tls;
  final String name;

  const ServerConfig(this.host, this.port, this.tls, {this.name = ""});
}
