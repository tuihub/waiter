import 'package:kana_kit/kana_kit.dart';
import 'package:pinyin/pinyin.dart';
import 'package:test/test.dart';

class CJKHelper {
  static const _kana = KanaKit();

  // contains is a method that checks if a text contains a pattern with CJK support
  // see tests for examples
  static bool contains(String text, String pattern) {
    final t = text.toLowerCase().replaceAll(RegExp(r'\s+'), '');
    final p = pattern.toLowerCase().replaceAll(RegExp(r'\s+'), '');
    if (t.contains(p)) {
      return true;
    }
    if (PinyinHelper.getPinyinE(t, separator: '', defPinyin: '').contains(p)) {
      return true;
    }
    if (PinyinHelper.getShortPinyin(t).contains(p)) {
      return true;
    }
    if (_kana.toRomaji(t).contains(p)) {
      return true;
    }
    if (t.contains(_kana.toKana(p))) {
      return true;
    }
    if (t.contains(_kana.toHiragana(p))) {
      return true;
    }
    if (t.contains(_kana.toKatakana(p))) {
      return true;
    }
    return false;
  }
}

void main() {
  test('CJKHelper.contains', () {
    expect(CJKHelper.contains('ATRI', 'a'), isTrue);
    expect(CJKHelper.contains('ATRI', 'd'), isFalse);
    expect(CJKHelper.contains('千恋万花', 'qian'), isTrue);
    expect(CJKHelper.contains('千恋万花', 'qianlianwanhua'), isTrue);
    expect(CJKHelper.contains('千恋万花', 'qlwh'), isTrue);
    expect(CJKHelper.contains('千恋万花', 'qll'), isFalse);
    expect(CJKHelper.contains('千恋万花', 'qw'), isFalse);
    expect(CJKHelper.contains('まいてつ', 'maitetsu'), isTrue);
    expect(CJKHelper.contains('まいてつ', 'mt'), isFalse);
  });
}
