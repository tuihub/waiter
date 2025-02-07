import 'utils.dart';

enum _TestEnum { a, b, c }

void main() {
  final stringList = ['a', 'b', 'c'];
  const stringListJson = '["a","b","c"]';
  const stringListConverter = StringListConverter();
  final stringListSql = stringListConverter.toSql(stringList);
  final stringListFromSql = stringListConverter.fromSql(stringListJson);
  assert(stringListSql == stringListJson,
      'stringListSql: $stringListSql, stringListJson: $stringListJson');
  assert(stringListFromSql[0] == stringList[0],
      'stringListFromSql: $stringListFromSql, stringList: $stringList');

  final enumList = [_TestEnum.a, _TestEnum.b, _TestEnum.c];
  const enumListJson = '["testEnum.a","testEnum.b","testEnum.c"]';
  final enumListConverter = EnumListConverter(() => _TestEnum.values);
  final enumListSql = enumListConverter.toSql(enumList);
  final enumListFromSql = enumListConverter.fromSql(enumListJson);
  assert(enumListSql == enumListJson,
      'enumListSql: $enumListSql, enumListJson: $enumListJson');
  assert(enumListFromSql[0] == enumList[0],
      'enumListFromSql: $enumListFromSql, enumList: $enumList');

  final stringMap = {'a': 'b', 'c': 'd'};
  const stringMapJson = '{"a":"b","c":"d"}';
  const stringMapConverter = StringMapConverter();
  final stringMapSql = stringMapConverter.toSql(stringMap);
  final stringMapFromSql = stringMapConverter.fromSql(stringMapJson);
  assert(stringMapSql == stringMapJson,
      'stringMapSql: $stringMapSql, stringMapJson: $stringMapJson');
  assert(stringMapFromSql['a'] == stringMap['a'],
      'stringMapFromSql: $stringMapFromSql, stringMap: $stringMap');
}
