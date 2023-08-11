import 'package:hive_flutter/hive_flutter.dart';

class CacheMissException implements Exception {
  final String message;

  CacheMissException(this.message);
}

class CacheDao {
  final Box<String> _cacheBox;

  CacheDao(this._cacheBox);

  String? get<T>(String key, {String? defaultValue}) {
    return _cacheBox.get(key, defaultValue: defaultValue);
  }

  String require<T>(String key) {
    if (_cacheBox.containsKey(key)) {
      return _cacheBox.get(key) as String;
    }
    throw CacheMissException(
      'cache data $key is required before cached',
    );
  }

  Future<bool> set(String key, String value) async {
    await _cacheBox.put(key, value);
    return true;
  }

  Future<void> pure(String key) async {
    await _cacheBox.delete(key);
  }

  Future<void> pureAll() async {
    await _cacheBox.clear();
  }

  bool exist(String key) {
    return _cacheBox.containsKey(key);
  }
}
