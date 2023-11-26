import 'dart:convert';

import 'package:hive/hive.dart';

import '../../model/common_model.dart';

const _clientCommonBoxFile = 'common';
const _clientCommonBoxKey = 'default';

class ClientCommonRepo {
  late Box<String> _box;

  ClientCommonRepo._init(Box<String> box) {
    _box = box;
  }

  static Future<ClientCommonRepo> init() async {
    final box = await Hive.openBox<String>(_clientCommonBoxFile);
    return ClientCommonRepo._init(box);
  }

  Future<void> set(ClientCommonData data) {
    return _box.put(
      _clientCommonBoxKey,
      jsonEncode(data.toJson()),
    );
  }

  ClientCommonData get() {
    final data = _box.get(_clientCommonBoxKey);
    if (data != null) {
      return ClientCommonData.fromJson(
          jsonDecode(data) as Map<String, dynamic>);
    }
    return const ClientCommonData();
  }
}
