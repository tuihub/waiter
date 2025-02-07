// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Rating _$RatingFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Rating',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['rank', 'total', 'count', 'score'],
        );
        final val = Rating(
          rank: $checkedConvert('rank', (v) => (v as num).toInt()),
          total: $checkedConvert('total', (v) => (v as num).toInt()),
          count: $checkedConvert(
              'count', (v) => Count.fromJson(v as Map<String, dynamic>)),
          score: $checkedConvert('score', (v) => v as num),
        );
        return val;
      },
    );

Map<String, dynamic> _$RatingToJson(Rating instance) => <String, dynamic>{
      'rank': instance.rank,
      'total': instance.total,
      'count': instance.count.toJson(),
      'score': instance.score,
    };
