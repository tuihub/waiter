import 'package:bangumi_api/src/model/avatar.dart';
import 'package:bangumi_api/src/model/character.dart';
import 'package:bangumi_api/src/model/character_person.dart';
import 'package:bangumi_api/src/model/character_revision.dart';
import 'package:bangumi_api/src/model/character_revision_data_item.dart';
import 'package:bangumi_api/src/model/collection.dart';
import 'package:bangumi_api/src/model/count.dart';
import 'package:bangumi_api/src/model/creator.dart';
import 'package:bangumi_api/src/model/detail.dart';
import 'package:bangumi_api/src/model/detail_one_of.dart';
import 'package:bangumi_api/src/model/detailed_revision.dart';
import 'package:bangumi_api/src/model/episode.dart';
import 'package:bangumi_api/src/model/episode_detail.dart';
import 'package:bangumi_api/src/model/error_detail.dart';
import 'package:bangumi_api/src/model/get_myself200_response.dart';
import 'package:bangumi_api/src/model/get_user_subject_episode_collection200_response.dart';
import 'package:bangumi_api/src/model/images.dart';
import 'package:bangumi_api/src/model/index.dart';
import 'package:bangumi_api/src/model/index_basic_info.dart';
import 'package:bangumi_api/src/model/index_subject.dart';
import 'package:bangumi_api/src/model/index_subject_add_info.dart';
import 'package:bangumi_api/src/model/index_subject_edit_info.dart';
import 'package:bangumi_api/src/model/item.dart';
import 'package:bangumi_api/src/model/kv.dart';
import 'package:bangumi_api/src/model/page.dart';
import 'package:bangumi_api/src/model/paged_character.dart';
import 'package:bangumi_api/src/model/paged_episode.dart';
import 'package:bangumi_api/src/model/paged_index_subject.dart';
import 'package:bangumi_api/src/model/paged_person.dart';
import 'package:bangumi_api/src/model/paged_revision.dart';
import 'package:bangumi_api/src/model/paged_subject.dart';
import 'package:bangumi_api/src/model/paged_user_character_collection.dart';
import 'package:bangumi_api/src/model/paged_user_collection.dart';
import 'package:bangumi_api/src/model/paged_user_person_collection.dart';
import 'package:bangumi_api/src/model/patch_user_subject_episode_collection_request.dart';
import 'package:bangumi_api/src/model/person.dart';
import 'package:bangumi_api/src/model/person_character.dart';
import 'package:bangumi_api/src/model/person_detail.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:bangumi_api/src/model/person_revision.dart';
import 'package:bangumi_api/src/model/person_revision_data_item.dart';
import 'package:bangumi_api/src/model/person_revision_profession.dart';
import 'package:bangumi_api/src/model/put_user_episode_collection_request.dart';
import 'package:bangumi_api/src/model/rating.dart';
import 'package:bangumi_api/src/model/related_character.dart';
import 'package:bangumi_api/src/model/related_person.dart';
import 'package:bangumi_api/src/model/revision.dart';
import 'package:bangumi_api/src/model/revision_extra.dart';
import 'package:bangumi_api/src/model/search_characters_request.dart';
import 'package:bangumi_api/src/model/search_characters_request_filter.dart';
import 'package:bangumi_api/src/model/search_persons_request.dart';
import 'package:bangumi_api/src/model/search_persons_request_filter.dart';
import 'package:bangumi_api/src/model/search_subjects_request.dart';
import 'package:bangumi_api/src/model/search_subjects_request_filter.dart';
import 'package:bangumi_api/src/model/slim_subject.dart';
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/subject.dart';
import 'package:bangumi_api/src/model/subject_category.dart';
import 'package:bangumi_api/src/model/subject_revision.dart';
import 'package:bangumi_api/src/model/subject_revision_data.dart';
import 'package:bangumi_api/src/model/tag.dart';
import 'package:bangumi_api/src/model/user.dart';
import 'package:bangumi_api/src/model/user_character_collection.dart';
import 'package:bangumi_api/src/model/user_episode_collection.dart';
import 'package:bangumi_api/src/model/user_person_collection.dart';
import 'package:bangumi_api/src/model/user_subject_collection.dart';
import 'package:bangumi_api/src/model/user_subject_collection_modify_payload.dart';
import 'package:bangumi_api/src/model/v.dart';
import 'package:bangumi_api/src/model/v0_related_subject.dart';
import 'package:bangumi_api/src/model/v0_subject_relation.dart';
import 'package:bangumi_api/src/model/value.dart';
import 'package:bangumi_api/src/model/value_any_of_inner.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'Avatar':
      return Avatar.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'BloodType':
    case 'Character':
      return Character.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CharacterPerson':
      return CharacterPerson.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CharacterRevision':
      return CharacterRevision.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CharacterRevisionDataItem':
      return CharacterRevisionDataItem.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'CharacterType':
    case 'Collection':
      return Collection.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Count':
      return Count.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Creator':
      return Creator.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Detail':
      return Detail.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DetailOneOf':
      return DetailOneOf.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'DetailedRevision':
      return DetailedRevision.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'EpType':
    case 'Episode':
      return Episode.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'EpisodeCollectionType':
    case 'EpisodeDetail':
      return EpisodeDetail.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ErrorDetail':
      return ErrorDetail.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'GetMyself200Response':
      return GetMyself200Response.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'GetUserSubjectEpisodeCollection200Response':
      return GetUserSubjectEpisodeCollection200Response.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'Images':
      return Images.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Index':
      return Index.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'IndexBasicInfo':
      return IndexBasicInfo.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IndexSubject':
      return IndexSubject.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'IndexSubjectAddInfo':
      return IndexSubjectAddInfo.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'IndexSubjectEditInfo':
      return IndexSubjectEditInfo.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Item':
      return Item.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'KV':
      return KV.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Page':
      return Page.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PagedCharacter':
      return PagedCharacter.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PagedEpisode':
      return PagedEpisode.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PagedIndexSubject':
      return PagedIndexSubject.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PagedPerson':
      return PagedPerson.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PagedRevision':
      return PagedRevision.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PagedSubject':
      return PagedSubject.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PagedUserCharacterCollection':
      return PagedUserCharacterCollection.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'PagedUserCollection':
      return PagedUserCollection.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PagedUserPersonCollection':
      return PagedUserPersonCollection.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PatchUserSubjectEpisodeCollectionRequest':
      return PatchUserSubjectEpisodeCollectionRequest.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'Person':
      return Person.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PersonCareer':
    case 'PersonCharacter':
      return PersonCharacter.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PersonDetail':
      return PersonDetail.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PersonImages':
      return PersonImages.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'PersonRevision':
      return PersonRevision.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PersonRevisionDataItem':
      return PersonRevisionDataItem.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PersonRevisionProfession':
      return PersonRevisionProfession.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'PersonType':
    case 'PutUserEpisodeCollectionRequest':
      return PutUserEpisodeCollectionRequest.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'Rating':
      return Rating.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'RelatedCharacter':
      return RelatedCharacter.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'RelatedPerson':
      return RelatedPerson.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Revision':
      return Revision.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'RevisionExtra':
      return RevisionExtra.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SearchCharactersRequest':
      return SearchCharactersRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SearchCharactersRequestFilter':
      return SearchCharactersRequestFilter.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'SearchPersonsRequest':
      return SearchPersonsRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SearchPersonsRequestFilter':
      return SearchPersonsRequestFilter.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SearchSubjectsRequest':
      return SearchSubjectsRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SearchSubjectsRequestFilter':
      return SearchSubjectsRequestFilter.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SlimSubject':
      return SlimSubject.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Stat':
      return Stat.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Subject':
      return Subject.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'SubjectAnimeCategory':
    case 'SubjectBookCategory':
    case 'SubjectCategory':
      return SubjectCategory.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SubjectCollectionType':
    case 'SubjectGameCategory':
    case 'SubjectRealCategory':
    case 'SubjectRevision':
      return SubjectRevision.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SubjectRevisionData':
      return SubjectRevisionData.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'SubjectType':
    case 'Tag':
      return Tag.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'User':
      return User.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UserCharacterCollection':
      return UserCharacterCollection.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserEpisodeCollection':
      return UserEpisodeCollection.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserGroup':
    case 'UserPersonCollection':
      return UserPersonCollection.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserSubjectCollection':
      return UserSubjectCollection.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'UserSubjectCollectionModifyPayload':
      return UserSubjectCollectionModifyPayload.fromJson(
          value as Map<String, dynamic>) as ReturnType;
    case 'V':
      return V.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'V0RelatedSubject':
      return V0RelatedSubject.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'V0SubjectRelation':
      return V0SubjectRelation.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Value':
      return Value.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'ValueAnyOfInner':
      return ValueAnyOfInner.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
          value.keys as Iterable<String>,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
