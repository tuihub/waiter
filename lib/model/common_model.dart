enum LoadState {
  /// 初始状态
  initial,

  /// 加载中
  loading,

  /// 加载完成
  success,

  /// 加载失败
  failure,
}

class ServerConfig {
  final String host;
  final int port;
  final bool tls;
  final String name;
  final String? refreshToken;

  const ServerConfig(this.host, this.port, this.tls,
      {this.refreshToken, this.name = ''});

  ServerConfig copyWith({
    String? host,
    int? port,
    bool? tls,
    String? name,
    String? refreshToken,
  }) {
    return ServerConfig(
      host ?? this.host,
      port ?? this.port,
      tls ?? this.tls,
      name: name ?? this.name,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  Map<String, Object?> toMap() {
    return {
      'host': host,
      'port': port,
      'tls': tls,
      'name': name,
      'refreshToken': refreshToken,
    };
  }

  factory ServerConfig.fromMap(Map<dynamic, dynamic> map) {
    return ServerConfig(
      map['host'] != null ? map['host']! as String : '',
      map['port'] != null ? map['port']! as int : 0,
      map['tls'] != null ? map['tls']! as bool : false,
      name: map['name'] != null ? map['name']! as String : '',
      refreshToken:
          map['refreshToken'] != null ? map['refreshToken']! as String : null,
    );
  }
}
