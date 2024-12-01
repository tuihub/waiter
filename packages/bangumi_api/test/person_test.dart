import 'package:test/test.dart';
import 'package:openapi/openapi.dart';

// tests for Person
void main() {
  final instance = PersonBuilder();
  // TODO add properties to the builder and call build()

  group(Person, () {
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

    // String shortSummary
    test('to test the property `shortSummary`', () async {
      // TODO
    });

    // bool locked
    test('to test the property `locked`', () async {
      // TODO
    });
  });
}
