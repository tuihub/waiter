//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'revision_extra.g.dart';

/// RevisionExtra
///
/// Properties:
/// * [img]
@BuiltValue()
abstract class RevisionExtra
    implements Built<RevisionExtra, RevisionExtraBuilder> {
  @BuiltValueField(wireName: r'img')
  String? get img;

  RevisionExtra._();

  factory RevisionExtra([void updates(RevisionExtraBuilder b)]) =
      _$RevisionExtra;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(RevisionExtraBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<RevisionExtra> get serializer =>
      _$RevisionExtraSerializer();
}

class _$RevisionExtraSerializer implements PrimitiveSerializer<RevisionExtra> {
  @override
  final Iterable<Type> types = const [RevisionExtra, _$RevisionExtra];

  @override
  final String wireName = r'RevisionExtra';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    RevisionExtra object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.img != null) {
      yield r'img';
      yield serializers.serialize(
        object.img,
        specifiedType: const FullType(String),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    RevisionExtra object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RevisionExtraBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'img':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.img = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  RevisionExtra deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = RevisionExtraBuilder();
    final serializedList = (serialized as Iterable<Object?>).toList();
    final unhandled = <Object?>[];
    _deserializeProperties(
      serializers,
      serialized,
      specifiedType: specifiedType,
      serializedList: serializedList,
      unhandled: unhandled,
      result: result,
    );
    return result.build();
  }
}
