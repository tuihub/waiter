import 'package:hive_flutter/hive_flutter.dart';

class AppLauncherDao {
  final Box<Object> _box;

  AppLauncherDao(this._box);

  T? get<T>(String key, {T? defaultValue}) {
    return _box.get(key, defaultValue: defaultValue) as T;
  }

  T require<T>(String key) {
    if (_box.containsKey(key)) {
      return _box.get(key) as T;
    }
    throw Exception(
      'setting key $key is required before initialize',
    );
  }

  Future<bool> set(String key, Object value) async {
    await _box.put(key, value);
    return true;
  }

  Future<void> pure(String key) async {
    await _box.delete(key);
  }

  Future<void> pureAll() async {
    await _box.clear();
  }

  bool exist(String key) {
    return _box.containsKey(key);
  }
}
