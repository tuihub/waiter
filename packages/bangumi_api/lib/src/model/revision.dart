//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:bangumi_api/src/model/creator.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'revision.g.dart';

/// Revision
///
/// Properties:
/// * [id]
/// * [type]
/// * [creator]
/// * [summary]
/// * [createdAt]
@BuiltValue(instantiable: false)
abstract class Revision {
  @BuiltValueField(wireName: r'id')
  int get id;

  @BuiltValueField(wireName: r'type')
  int get type;

  @BuiltValueField(wireName: r'creator')
  Creator? get creator;

  @BuiltValueField(wireName: r'summary')
  String get summary;

  @BuiltValueField(wireName: r'created_at')
  DateTime get createdAt;

  @BuiltValueSerializer(custom: true)
  static Serializer<Revision> get serializer => _$RevisionSerializer();
}

class _$RevisionSerializer implements PrimitiveSerializer<Revision> {
  @override
  final Iterable<Type> types = const [Revision];

  @override
  final String wireName = r'Revision';

  Iterable<Object?> _serializeProperties(
    Serializers serializers,
    Revision object, {
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
    if (object.creator != null) {
      yield r'creator';
      yield serializers.serialize(
        object.creator,
        specifiedType: const FullType(Creator),
      );
    }
    yield r'summary';
    yield serializers.serialize(
      object.summary,
      specifiedType: const FullType(String),
    );
    yield r'created_at';
    yield serializers.serialize(
      object.createdAt,
      specifiedType: const FullType(DateTime),
    );
  }

  @override
  Object serialize(
    Serializers serializers,
    Revision object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return _serializeProperties(serializers, object,
            specifiedType: specifiedType)
        .toList();
  }

  @override
  Revision deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.deserialize(serialized,
        specifiedType: FullType($Revision)) as $Revision;
  }
}

/// a concrete implementation of [Revision], since [Revision] is not instantiable
@BuiltValue(instantiable: true)
abstract class $Revision
    implements Revision, Built<$Revision, $RevisionBuilder> {
  $Revision._();

  factory $Revision([void Function($RevisionBuilder)? updates]) = _$$Revision;

  @BuiltValueHook(initializeBuilder: true)
  static void _defaults($RevisionBuilder b) => b;

  @BuiltValueSerializer(custom: true)
  static Serializer<$Revision> get serializer => _$$RevisionSerializer();
}

class _$$RevisionSerializer implements PrimitiveSerializer<$Revision> {
  @override
  final Iterable<Type> types = const [$Revision, _$$Revision];

  @override
  final String wireName = r'$Revision';

  @override
  Object serialize(
    Serializers serializers,
    $Revision object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return serializers.serialize(object, specifiedType: FullType(Revision))!;
  }

  void _deserializeProperties(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
    required List<Object?> serializedList,
    required RevisionBuilder result,
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
        case r'creator':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(Creator),
          ) as Creator;
          result.creator.replace(valueDes);
          break;
        case r'summary':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(String),
          ) as String;
          result.summary = valueDes;
          break;
        case r'created_at':
          final valueDes = serializers.deserialize(
            value,
            specifiedType: const FullType(DateTime),
          ) as DateTime;
          result.createdAt = valueDes;
          break;
        default:
          unhandled.add(key);
          unhandled.add(value);
          break;
      }
    }
  }

  @override
  $Revision deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = $RevisionBuilder();
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
