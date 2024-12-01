//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'episode_collection_type.g.dart';

class EpisodeCollectionType extends EnumClass {
  /// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
  @BuiltValueEnumConst(wireNumber: 1)
  static const EpisodeCollectionType number1 = _$number1;

  /// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
  @BuiltValueEnumConst(wireNumber: 2)
  static const EpisodeCollectionType number2 = _$number2;

  /// - `0`: 未收藏 - `1`: 想看 - `2`: 看过 - `3`: 抛弃
  @BuiltValueEnumConst(wireNumber: 3)
  static const EpisodeCollectionType number3 = _$number3;

  static Serializer<EpisodeCollectionType> get serializer =>
      _$episodeCollectionTypeSerializer;

  const EpisodeCollectionType._(String name) : super(name);

  static BuiltSet<EpisodeCollectionType> get values => _$values;
  static EpisodeCollectionType valueOf(String name) => _$valueOf(name);
}

/// Optionally, enum_class can generate a mixin to go with your enum for use
/// with Angular. It exposes your enum constants as getters. So, if you mix it
/// in to your Dart component class, the values become available to the
/// corresponding Angular template.
///
/// Trigger mixin generation by writing a line like this one next to your enum.
abstract class EpisodeCollectionTypeMixin = Object
    with _$EpisodeCollectionTypeMixin;
