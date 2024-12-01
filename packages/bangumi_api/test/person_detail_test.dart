import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for PersonDetail
void main() {
  final instance = PersonDetailBuilder();
  // TODO add properties to the builder and call build()

  group(PersonDetail, () {
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // `1`, `2`, `3` 表示 `个人`, `公司`, `组合`
    // PersonType type
    test('to test the property `type`', () async {
      // TODO
    });

    // BuiltList<PersonCareer> career
    test('to test the property `career`', () async {
      // TODO
    });

    // object with some size of images, this object maybe `null`
    // PersonImages images
    test('to test the property `images`', () async {
      // TODO
    });

    // String summary
    test('to test the property `summary`', () async {
      // TODO
    });

    // bool locked
    test('to test the property `locked`', () async {
      // TODO
    });

    // currently it's latest user comment time, it will be replaced by wiki modified date in the future
    // DateTime lastModified
    test('to test the property `lastModified`', () async {
      // TODO
    });

    // server parsed infobox, a map from key to string or tuple null if server infobox is not valid
    // BuiltList<JsonObject> infobox
    test('to test the property `infobox`', () async {
      // TODO
    });

    // parsed from wiki, maybe null
    // String gender
    test('to test the property `gender`', () async {
      // TODO
    });

    // parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O`
    // BloodType bloodType
    test('to test the property `bloodType`', () async {
      // TODO
    });

    // parsed from wiki, maybe `null`
    // int birthYear
    test('to test the property `birthYear`', () async {
      // TODO
    });

    // parsed from wiki, maybe `null`
    // int birthMon
    test('to test the property `birthMon`', () async {
      // TODO
    });

    // parsed from wiki, maybe `null`
    // int birthDay
    test('to test the property `birthDay`', () async {
      // TODO
    });

    // Stat stat
    test('to test the property `stat`', () async {
      // TODO
    });
  });
}
