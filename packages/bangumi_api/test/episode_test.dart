import 'package:test/test.dart';
import 'package:bangumi_api/bangumi_api.dart';

// tests for Episode
void main() {
  final Episode? instance = /* Episode(...) */ null;
  // TODO add properties to the entity

  group(Episode, () {
    // int id
    test('to test the property `id`', () async {
      // TODO
    });

    // `0` 本篇，`1` SP，`2` OP，`3` ED
    // int type
    test('to test the property `type`', () async {
      // TODO
    });

    // String name
    test('to test the property `name`', () async {
      // TODO
    });

    // String nameCn
    test('to test the property `nameCn`', () async {
      // TODO
    });

    // 同类条目的排序和集数
    // num sort
    test('to test the property `sort`', () async {
      // TODO
    });

    // 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义
    // num ep
    test('to test the property `ep`', () async {
      // TODO
    });

    // String airdate
    test('to test the property `airdate`', () async {
      // TODO
    });

    // int comment
    test('to test the property `comment`', () async {
      // TODO
    });

    // 维基人填写的原始时长
    // String duration
    test('to test the property `duration`', () async {
      // TODO
    });

    // 简介
    // String desc
    test('to test the property `desc`', () async {
      // TODO
    });

    // 音乐曲目的碟片数
    // int disc
    test('to test the property `disc`', () async {
      // TODO
    });

    // 服务器解析的时长，无法解析时为 `0`
    // int durationSeconds
    test('to test the property `durationSeconds`', () async {
      // TODO
    });
  });
}
