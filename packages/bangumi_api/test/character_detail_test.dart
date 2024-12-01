import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for CharacterDetail
void main() {
  final instance = CharacterDetailBuilder();
  // TODO add properties to the builder and call build()

  group(CharacterDetail, () {
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // 角色，机体，舰船，组织...
    // CharacterType type
    test('to test the property `type`', () async {
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
