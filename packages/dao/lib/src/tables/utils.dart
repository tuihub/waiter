import 'dart:convert';
import 'package:drift/drift.dart';

class StringListConverter extends TypeConverter<List<String>, String>
    with JsonTypeConverter<List<String>, String> {
  const StringListConverter();

  @override
  List<String> fromSql(String fromDb) {
    try {
      return (jsonDecode(fromDb) as List).cast<String>();
    } catch (e) {
      return [];
    }
  }

  @override
  String toSql(List<String> value) {
    try {
      return jsonEncode(value);
    } catch (e) {
      return '[]';
    }
  }
}

class EnumListConverter<T extends Enum> extends TypeConverter<List<T>, String>
    with JsonTypeConverter<List<T>, String> {
  final List<T> Function() values;
  const EnumListConverter(this.values);

  @override
  List<T> fromSql(String fromDb) {
    try {
      return (jsonDecode(fromDb) as List)
          .map((e) => values().firstWhere((element) => element.toString() == e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  String toSql(List<T> value) {
    try {
      return jsonEncode(value.map((e) => e.toString()).toList());
    } catch (e) {
      return '[]';
    }
  }
}

class StringMapConverter extends TypeConverter<Map<String, String>, String>
    with JsonTypeConverter<Map<String, String>, String> {
  const StringMapConverter();

  @override
  Map<String, String> fromSql(String fromDb) {
    try {
      return (jsonDecode(fromDb) as Map).cast<String, String>();
    } catch (e) {
      return {};
    }
  }

  @override
  String toSql(Map<String, String> value) {
    try {
      return jsonEncode(value);
    } catch (e) {
      return '{}';
    }
  }
}
