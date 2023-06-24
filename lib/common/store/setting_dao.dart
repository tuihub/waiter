import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';

enum SettingKey {
  serverHost,
  serverPort,
  serverTls,
  refreshToken,
  theme,
  themeMode,
}

extension SettingValueType on SettingKey {
  Type getType() {
    switch (this) {
      case SettingKey.serverPort:
        return int;
      case SettingKey.serverTls:
        return bool;
      case SettingKey.theme:
        return int;
      case SettingKey.themeMode:
        return int;
      default:
        return String;
    }
  }
}

class SettingDao {
  final Box<Object> _box;

  SettingDao(this._box);

  T? get<T>(SettingKey key, {T? defaultValue}) {
    if (_box.containsKey(key.name)) {
      return _box.get(key.name) as T;
    }
    return defaultValue;
  }

  T require<T>(SettingKey key) {
    if (_box.containsKey(key.name)) {
      return _box.get(key.name) as T;
    }
    throw Exception(
      "setting key ${key.toString()} is required before initialize",
    );
  }

  Future<bool> set(SettingKey key, Object value) async {
    if (value.runtimeType == key.getType()) {
      await _box.put(key.name, value);
      return true;
    }
    return false;
  }

  Future<void> pure(SettingKey key) async {
    await _box.delete(key.name);
  }

  bool exsist(SettingKey key) {
    return _box.containsKey(key.name);
  }
}
