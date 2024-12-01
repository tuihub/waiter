//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/index_subject.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'paged_index_subject.g.dart';

/// PagedIndexSubject
///
/// Properties:
/// * [total]
/// * [limit]
/// * [offset]
/// * [data]
@BuiltValue()
abstract class PagedIndexSubject
    implements Built<PagedIndexSubject, PagedIndexSubjectBuilder> {
  @BuiltValueField(wireName: r'total')
  int? get total;

  @BuiltValueField(wireName: r'limit')
  int? get limit;

  @BuiltValueField(wireName: r'offset')
  int? get offset;

  @BuiltValueField(wireName: r'data')
  BuiltList<IndexSubject>? get data;

  PagedIndexSubject._();

  factory PagedIndexSubject([void updates(PagedIndexSubjectBuilder b)]) =
      _$PagedIndexSubject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(PagedIndexSubjectBuilder b) => b
    ..total = 0
    ..limit = 0
    ..offset = 0
    ..data = ListBuilder();

  @BuiltValueSerializer(custom: true)
  static Serializer<PagedIndexSubject> get serializer =>
      _$PagedIndexSubjectSerializer();
}

class _$PagedIndexSubjectSerializer
    implements PrimitiveSerializer<PagedIndexSubject> {
  @override
  final Iterable<Type> types = const [PagedIndexSubject, _$PagedIndexSubject];

  @override
  final String wireName = r'PagedIndexSubject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    PagedIndexSubject object, {
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
        specifiedType: const FullType(BuiltList, [FullType(IndexSubject)]),
      );
    }
  }

  @override
  Object serialize(
    Serializers serializers,
    PagedIndexSubject object, {
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
    required PagedIndexSubjectBuilder result,
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
            specifiedType: const FullType(BuiltList, [FullType(IndexSubject)]),
          ) as BuiltList<IndexSubject>;
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
  PagedIndexSubject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = PagedIndexSubjectBuilder();
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
