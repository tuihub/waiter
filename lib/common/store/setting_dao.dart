import 'package:hive_flutter/hive_flutter.dart';

enum SettingKey {
  serverUrl,
  username,
  password,
  acessToken,
  refreshToken,
}

extension SettingValueType on SettingKey {
  Type getType() {
    switch (this) {
      default:
        return String;
    }
  }
}

class SettingDao {
  final Box<Object> _box;

  SettingDao(this._box);

  T? get<T>(SettingKey key, {T? defaultValue}) {
    if (_box.containsKey(key)) {
      return _box.get(key) as T;
    }
    return defaultValue;
  }

  T require<T>(SettingKey key) {
    if (_box.containsKey(key)) {
      return _box.get(key) as T;
    }
    throw Exception(
      "setting key ${key.toString()} is required before initialize",
    );
  }

  Future<bool> set(SettingKey key, Object value) async {
    if (value.runtimeType == key.getType()) {
      await _box.put(key, value);
      return true;
    }
    return false;
  }

  bool exsist(SettingKey key) {
    return _box.containsKey(key);
  }
}
