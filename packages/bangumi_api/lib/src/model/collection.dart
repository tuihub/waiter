//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'collection.g.dart';

/// Collection
///
/// Properties:
/// * [wish]
/// * [collect]
/// * [doing]
/// * [onHold]
/// * [dropped]
@BuiltValue()
abstract class Collection implements Built<Collection, CollectionBuilder> {
  @BuiltValueField(wireName: r'wish')
  int get wish;

  @BuiltValueField(wireName: r'collect')
  int get collect;

  @BuiltValueField(wireName: r'doing')
  int get doing;

  @BuiltValueField(wireName: r'on_hold')
  int get onHold;

  @BuiltValueField(wireName: r'dropped')
  int get dropped;

  Collection._();

  factory Collection([void updates(CollectionBuilder b)]) = _$Collection;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(CollectionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<Collection> get serializer => _$CollectionSerializer();
}

class _$CollectionSerializer implements PrimitiveSerializer<Collection> {
  @override
  final Iterable<Type> types = const [Collection, _$Collection];

  @override
  final String wireName = r'Collection';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Collection object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'wish';
    yield serializers.serialize(
      object.wish,
      specifiedType: const FullType(int),
    );
    yield r'collect';
    yield serializers.serialize(
      object.collect,
      specifiedType: const FullType(int),
    );
    yield r'doing';
    yield serializers.serialize(
      object.doing,
      specifiedType: const FullType(int),
    );
    yield r'on_hold';
    yield serializers.serialize(
      object.onHold,
      specifiedType: const FullType(int),
    );
    yield r'dropped';
    yield serializers.serialize(
      object.dropped,
      specifiedType: const FullType(int),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Collection object, {
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
    required CollectionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'wish':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.wish = valueDes;
          break;
        case r'collect':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.collect = valueDes;
          break;
        case r'doing':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.doing = valueDes;
          break;
        case r'on_hold':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.onHold = valueDes;
          break;
        case r'dropped':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.dropped = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  Collection deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = CollectionBuilder();
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
