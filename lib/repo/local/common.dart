import 'package:hive/hive.dart';

import '../../model/common_model.dart';

const _clientCommonBoxFile = 'common';
const _clientCommonBoxKey = 'default';

class ClientCommonRepo {
  late Box<Map<dynamic, dynamic>> _box;

  ClientCommonRepo._init(Box<Map<dynamic, dynamic>> box) {
    _box = box;
  }

  static Future<ClientCommonRepo> init() async {
    final box = await Hive.openBox<Map<dynamic, dynamic>>(_clientCommonBoxFile);
    return ClientCommonRepo._init(box);
  }

  ClientCommonData get() {
    final data = _box.get(_clientCommonBoxKey);
    if (data != null) {
      return ClientCommonData.fromMap(data);
    }
    return ClientCommonData();
  }

  Future<void> set(ClientCommonData data) {
    return _box.put(_clientCommonBoxKey, data.toMap());
  }
}

class ClientCommonData {
  final ServerConfig? server;
  final int? theme;
  final int? themeMode;

  ClientCommonData({
    this.server,
    this.theme,
    this.themeMode,
  });

  ClientCommonData copyWith({
    ServerConfig? server,
    int? theme,
    int? themeMode,
  }) {
    return ClientCommonData(
      server: server ?? this.server,
      theme: theme ?? this.theme,
      themeMode: themeMode ?? this.themeMode,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return {
      'server': server?.toMap(),
      'theme': theme,
      'themeMode': themeMode,
    };
  }

  factory ClientCommonData.fromMap(Map<dynamic, dynamic> map) {
    return ClientCommonData(
      server: map['server'] != null
          ? ServerConfig.fromMap(map['server']! as Map<dynamic, dynamic>)
          : null,
      theme: map['theme'] as int?,
      themeMode: map['themeMode'] as int?,
    );
  }
}
