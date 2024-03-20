// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yesod_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetYesodFeedItemListConfigCollection on Isar {
  IsarCollection<YesodFeedItemListConfig> get yesodFeedItemListConfigs =>
      this.collection();
}

const YesodFeedItemListConfigSchema = CollectionSchema(
  name: r'YesodFeedItemListConfig',
  id: -4146943744541238846,
  properties: {
    r'authorIdFilter': PropertySchema(
      id: 0,
      name: r'authorIdFilter',
      type: IsarType.stringList,
    ),
    r'categoryFilter': PropertySchema(
      id: 1,
      name: r'categoryFilter',
      type: IsarType.stringList,
    ),
    r'feedIdFilter': PropertySchema(
      id: 2,
      name: r'feedIdFilter',
      type: IsarType.stringList,
    ),
    r'hideRead': PropertySchema(
      id: 3,
      name: r'hideRead',
      type: IsarType.bool,
    ),
    r'listType': PropertySchema(
      id: 4,
      name: r'listType',
      type: IsarType.string,
      enumMap: _YesodFeedItemListConfiglistTypeEnumValueMap,
    ),
    r'publishPlatformFilter': PropertySchema(
      id: 5,
      name: r'publishPlatformFilter',
      type: IsarType.stringList,
    )
  },
  estimateSize: _yesodFeedItemListConfigEstimateSize,
  serialize: _yesodFeedItemListConfigSerialize,
  deserialize: _yesodFeedItemListConfigDeserialize,
  deserializeProp: _yesodFeedItemListConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _yesodFeedItemListConfigGetId,
  getLinks: _yesodFeedItemListConfigGetLinks,
  attach: _yesodFeedItemListConfigAttach,
  version: '3.1.0+1',
);

int _yesodFeedItemListConfigEstimateSize(
  YesodFeedItemListConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final list = object.authorIdFilter;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.categoryFilter;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final list = object.feedIdFilter;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  {
    final value = object.listType;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  {
    final list = object.publishPlatformFilter;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  return bytesCount;
}

void _yesodFeedItemListConfigSerialize(
  YesodFeedItemListConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeStringList(offsets[0], object.authorIdFilter);
  writer.writeStringList(offsets[1], object.categoryFilter);
  writer.writeStringList(offsets[2], object.feedIdFilter);
  writer.writeBool(offsets[3], object.hideRead);
  writer.writeString(offsets[4], object.listType?.name);
  writer.writeStringList(offsets[5], object.publishPlatformFilter);
}

YesodFeedItemListConfig _yesodFeedItemListConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = YesodFeedItemListConfig(
    id,
  );
  object.authorIdFilter = reader.readStringList(offsets[0]);
  object.categoryFilter = reader.readStringList(offsets[1]);
  object.feedIdFilter = reader.readStringList(offsets[2]);
  object.hideRead = reader.readBoolOrNull(offsets[3]);
  object.listType = _YesodFeedItemListConfiglistTypeValueEnumMap[
      reader.readStringOrNull(offsets[4])];
  object.publishPlatformFilter = reader.readStringList(offsets[5]);
  return object;
}

P _yesodFeedItemListConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringList(offset)) as P;
    case 1:
      return (reader.readStringList(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (_YesodFeedItemListConfiglistTypeValueEnumMap[
          reader.readStringOrNull(offset)]) as P;
    case 5:
      return (reader.readStringList(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _YesodFeedItemListConfiglistTypeEnumValueMap = {
  r'table': r'table',
  r'magazine': r'magazine',
  r'card': r'card',
};
const _YesodFeedItemListConfiglistTypeValueEnumMap = {
  r'table': FeedItemListType.table,
  r'magazine': FeedItemListType.magazine,
  r'card': FeedItemListType.card,
};

Id _yesodFeedItemListConfigGetId(YesodFeedItemListConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _yesodFeedItemListConfigGetLinks(
    YesodFeedItemListConfig object) {
  return [];
}

void _yesodFeedItemListConfigAttach(
    IsarCollection<dynamic> col, Id id, YesodFeedItemListConfig object) {}

extension YesodFeedItemListConfigQueryWhereSort
    on QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QWhere> {
  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterWhere>
      anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension YesodFeedItemListConfigQueryWhere on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QWhereClause> {
  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterWhereClause> idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterWhereClause> idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension YesodFeedItemListConfigQueryFilter on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QFilterCondition> {
  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'authorIdFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'authorIdFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'authorIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'authorIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'authorIdFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'authorIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'authorIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      authorIdFilterElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'authorIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      authorIdFilterElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'authorIdFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'authorIdFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'authorIdFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIdFilter',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIdFilter',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIdFilter',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIdFilter',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIdFilter',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> authorIdFilterLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'authorIdFilter',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'categoryFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'categoryFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      categoryFilterElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      categoryFilterElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryFilter',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryFilter',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryFilter',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryFilter',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryFilter',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> categoryFilterLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'categoryFilter',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'feedIdFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'feedIdFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'feedIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'feedIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'feedIdFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'feedIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'feedIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      feedIdFilterElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'feedIdFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      feedIdFilterElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'feedIdFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'feedIdFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'feedIdFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feedIdFilter',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feedIdFilter',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feedIdFilter',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feedIdFilter',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feedIdFilter',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> feedIdFilterLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'feedIdFilter',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> hideReadIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hideRead',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> hideReadIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hideRead',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> hideReadEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hideRead',
        value: value,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'listType',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'listType',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeEqualTo(
    FeedItemListType? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeGreaterThan(
    FeedItemListType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'listType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeLessThan(
    FeedItemListType? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'listType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeBetween(
    FeedItemListType? lower,
    FeedItemListType? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'listType',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'listType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'listType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      listTypeContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'listType',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      listTypeMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'listType',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'listType',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> listTypeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'listType',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'publishPlatformFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'publishPlatformFilter',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishPlatformFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'publishPlatformFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'publishPlatformFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'publishPlatformFilter',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'publishPlatformFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'publishPlatformFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      publishPlatformFilterElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'publishPlatformFilter',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
          QAfterFilterCondition>
      publishPlatformFilterElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'publishPlatformFilter',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'publishPlatformFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'publishPlatformFilter',
        value: '',
      ));
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'publishPlatformFilter',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'publishPlatformFilter',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'publishPlatformFilter',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'publishPlatformFilter',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'publishPlatformFilter',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig,
      QAfterFilterCondition> publishPlatformFilterLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'publishPlatformFilter',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension YesodFeedItemListConfigQueryObject on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QFilterCondition> {}

extension YesodFeedItemListConfigQueryLinks on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QFilterCondition> {}

extension YesodFeedItemListConfigQuerySortBy
    on QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QSortBy> {
  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      sortByHideRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideRead', Sort.asc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      sortByHideReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideRead', Sort.desc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      sortByListType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listType', Sort.asc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      sortByListTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listType', Sort.desc);
    });
  }
}

extension YesodFeedItemListConfigQuerySortThenBy on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QSortThenBy> {
  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      thenByHideRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideRead', Sort.asc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      thenByHideReadDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hideRead', Sort.desc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      thenByListType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listType', Sort.asc);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QAfterSortBy>
      thenByListTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'listType', Sort.desc);
    });
  }
}

extension YesodFeedItemListConfigQueryWhereDistinct on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct> {
  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct>
      distinctByAuthorIdFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'authorIdFilter');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct>
      distinctByCategoryFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryFilter');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct>
      distinctByFeedIdFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'feedIdFilter');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct>
      distinctByHideRead() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hideRead');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct>
      distinctByListType({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'listType', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<YesodFeedItemListConfig, YesodFeedItemListConfig, QDistinct>
      distinctByPublishPlatformFilter() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'publishPlatformFilter');
    });
  }
}

extension YesodFeedItemListConfigQueryProperty on QueryBuilder<
    YesodFeedItemListConfig, YesodFeedItemListConfig, QQueryProperty> {
  QueryBuilder<YesodFeedItemListConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, List<String>?, QQueryOperations>
      authorIdFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'authorIdFilter');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, List<String>?, QQueryOperations>
      categoryFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryFilter');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, List<String>?, QQueryOperations>
      feedIdFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'feedIdFilter');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, bool?, QQueryOperations>
      hideReadProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hideRead');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, FeedItemListType?, QQueryOperations>
      listTypeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'listType');
    });
  }

  QueryBuilder<YesodFeedItemListConfig, List<String>?, QQueryOperations>
      publishPlatformFilterProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'publishPlatformFilter');
    });
  }
}
