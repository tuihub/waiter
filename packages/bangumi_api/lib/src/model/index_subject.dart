//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:built_collection/built_collection.dart';
import 'package:bangumi_api/src/model/item.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'index_subject.g.dart';

/// 同名字段意义同<a href=\"#model-Subject\">Subject</a>
///
/// Properties:
/// * [id]
/// * [type]
/// * [name]
/// * [images]
/// * [infobox]
/// * [date]
/// * [comment]
/// * [addedAt]
@BuiltValue()
abstract class IndexSubject
    implements Built<IndexSubject, IndexSubjectBuilder> {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'type')
  int get type;

  @BuiltValueField(wireName: r'name')
  String get name;

  @BuiltValueField(wireName: r'images')
  Images? get images;

  @BuiltValueField(wireName: r'infobox')
  BuiltList<Item>? get infobox;

  @BuiltValueField(wireName: r'date')
  String? get date;

  @BuiltValueField(wireName: r'comment')
  String get comment;

  @BuiltValueField(wireName: r'added_at')
  DateTime get addedAt;

  IndexSubject._();

  factory IndexSubject([void updates(IndexSubjectBuilder b)]) = _$IndexSubject;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults(IndexSubjectBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<IndexSubject> get serializer => _$IndexSubjectSerializer();
}

class _$IndexSubjectSerializer implements PrimitiveSerializer<IndexSubject> {
  @override
  final Iterable<Type> types = const [IndexSubject, _$IndexSubject];

  @override
  final String wireName = r'IndexSubject';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    IndexSubject object, {
    FullType specifiedType = FullType.unspecified,
  }) sync* {
    yield r'id';
    yield serializers.serialize(
      object.id,
      specifiedType: const FullType(int),
    );
    yield r'type';
    yield serializers.serialize(
      object.type,
      specifiedType: const FullType(int),
    );
    yield r'name';
    yield serializers.serialize(
      object.name,
      specifiedType: const FullType(String),
    );
    if (object.images != null) {
      yield r'images';
      yield serializers.serialize(
        object.images,
        specifiedType: const FullType(Images),
      );
    }
    if (object.infobox != null) {
      yield r'infobox';
      yield serializers.serialize(
        object.infobox,
        specifiedType: const FullType(BuiltList, [FullType(Item)]),
      );
    }
    if (object.date != null) {
      yield r'date';
      yield serializers.serialize(
        object.date,
        specifiedType: const FullType(String),
      );
    }
    yield r'comment';
    yield serializers.serialize(
      object.comment,
      specifiedType: const FullType(String),
    );
    yield r'added_at';
    yield serializers.serialize(
      object.addedAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    IndexSubject object, {
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
    required IndexSubjectBuilder result,
    required List<Object?> unhandled,
  }) {
    for (var i = 0; i < serializedList.length; i += 2) {
      final key = serializedList[i] as String;
      final value = serializedList[i + 1];
      switch (key) {
        case r'id':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.id = valueDes;
          break;
        case r'type':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(int),
          ) as int;
          result.type = valueDes;
          break;
        case r'name':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.name = valueDes;
          break;
        case r'images':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Images),
          ) as Images;
          result.images.replace(valueDes);
          break;
        case r'infobox':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(BuiltList, [FullType(Item)]),
          ) as BuiltList<Item>;
          result.infobox.replace(valueDes);
          break;
        case r'date':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.date = valueDes;
          break;
        case r'comment':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.comment = valueDes;
          break;
        case r'added_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.addedAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  IndexSubject deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = IndexSubjectBuilder();
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
