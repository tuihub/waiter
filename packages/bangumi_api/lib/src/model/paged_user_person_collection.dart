//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/user_person_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paged_user_person_collection.g.dart';

/// PagedUserPersonCollection
///
/// Properties:
/// * [total]
/// * [limit]
/// * [offset]
/// * [data]
@BuiltValue()
abstract class PagedUserPersonCollection
    implements
        Built<PagedUserPersonCollection, PagedUserPersonCollectionBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'limit')
  int? get limit;

  @BuiltValueField(wireName: r'offset')
  int? get offset;

  @BuiltValueField(wireName: r'data')
  BuiltList<UserPersonCollection>? get data;

  PagedUserPersonCollection._();

  factory PagedUserPersonCollection(
          [void updates(PagedUserPersonCollectionBuilder b)]) =
      _$PagedUserPersonCollection;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PagedUserPersonCollectionBuilder b) => b
    ..total = 0
    ..limit = 0
    ..offset = 0
    ..data = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<PagedUserPersonCollection> get serializer =>
      _$PagedUserPersonCollectionSerializer();
}

class _$PagedUserPersonCollectionSerializer
    implements PrimitiveSerializer<PagedUserPersonCollection> {
  @override
  final Iterable<Type> types = const [
    PagedUserPersonCollection,
    _$PagedUserPersonCollection
  ];

  @override
  final String wireName = r'PagedUserPersonCollection';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PagedUserPersonCollection object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    if (object.total != null) {
      yield r'total';
      yield serializers.serialize(
        object.total,
        specifiedType: const FullType(int),
      );
    }
    if (object.limit != null) {
      yield r'limit';
      yield serializers.serialize(
        object.limit,
        specifiedType: const FullType(int),
      );
    }
    if (object.offset != null) {
      yield r'offset';
      yield serializers.serialize(
        object.offset,
        specifiedType: const FullType(int),
      );
    }
    if (object.data != null) {
      yield r'data';
      yield serializers.serialize(
        object.data,
        specifiedType:
            const FullType(BuiltList, [FullType(UserPersonCollection)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PagedUserPersonCollection object, {
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
    required PagedUserPersonCollectionBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'total':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.total = valueDes;
          break;
        case r'limit':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.limit = valueDes;
          break;
        case r'offset':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.offset = valueDes;
          break;
        case r'data':
          final valueDes = serializers.deserialize(
            value,
            specifiedType:
                const FullType(BuiltList, [FullType(UserPersonCollection)]),
          ) as BuiltList<UserPersonCollection>;
          result.data.replace(valueDes);
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  PagedUserPersonCollection deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PagedUserPersonCollectionBuilder();
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
