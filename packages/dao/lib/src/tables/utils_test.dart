import 'utils.dart';

enum testEnum { a, b, c }

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

  final enumList = [testEnum.a, testEnum.b, testEnum.c];
  const enumListJson = '["testEnum.a","testEnum.b","testEnum.c"]';
  final enumListConverter = EnumListConverter(() => testEnum.values);
  final enumListSql = enumListConverter.toSql(enumList);
  final enumListFromSql = enumListConverter.fromSql(enumListJson);
  assert(enumListSql == enumListJson,
      'enumListSql: $enumListSql, enumListJson: $enumListJson');
  assert(enumListFromSql[0] == enumList[0],
      'enumListFromSql: $enumListFromSql, enumList: $enumList');
}
