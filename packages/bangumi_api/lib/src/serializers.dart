//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:bangumi_api/src/date_serializer.dart';
import 'package:bangumi_api/src/model/date.dart';

import 'package:bangumi_api/src/model/avatar.dart';
import 'package:bangumi_api/src/model/blood_type.dart';
import 'package:bangumi_api/src/model/character_detail.dart';
import 'package:bangumi_api/src/model/character_person.dart';
import 'package:bangumi_api/src/model/character_revision.dart';
import 'package:bangumi_api/src/model/character_revision_data_item.dart';
import 'package:bangumi_api/src/model/character_type.dart';
import 'package:bangumi_api/src/model/collection.dart';
import 'package:bangumi_api/src/model/count.dart';
import 'package:bangumi_api/src/model/creator.dart';
import 'package:bangumi_api/src/model/detail.dart';
import 'package:bangumi_api/src/model/detail_one_of.dart';
import 'package:bangumi_api/src/model/detailed_revision.dart';
import 'package:bangumi_api/src/model/ep_type.dart';
import 'package:bangumi_api/src/model/episode.dart';
import 'package:bangumi_api/src/model/episode_collection_type.dart';
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
import 'package:bangumi_api/src/model/paged_episode.dart';
import 'package:bangumi_api/src/model/paged_index_subject.dart';
import 'package:bangumi_api/src/model/paged_revision.dart';
import 'package:bangumi_api/src/model/paged_subject.dart';
import 'package:bangumi_api/src/model/paged_user_character_collection.dart';
import 'package:bangumi_api/src/model/paged_user_collection.dart';
import 'package:bangumi_api/src/model/paged_user_person_collection.dart';
import 'package:bangumi_api/src/model/patch_user_subject_episode_collection_request.dart';
import 'package:bangumi_api/src/model/person.dart';
import 'package:bangumi_api/src/model/person_career.dart';
import 'package:bangumi_api/src/model/person_character.dart';
import 'package:bangumi_api/src/model/person_detail.dart';
import 'package:bangumi_api/src/model/person_images.dart';
import 'package:bangumi_api/src/model/person_revision.dart';
import 'package:bangumi_api/src/model/person_revision_data_item.dart';
import 'package:bangumi_api/src/model/person_revision_profession.dart';
import 'package:bangumi_api/src/model/person_type.dart';
import 'package:bangumi_api/src/model/put_user_episode_collection_request.dart';
import 'package:bangumi_api/src/model/rating.dart';
import 'package:bangumi_api/src/model/related_character.dart';
import 'package:bangumi_api/src/model/related_person.dart';
import 'package:bangumi_api/src/model/revision.dart';
import 'package:bangumi_api/src/model/revision_extra.dart';
import 'package:bangumi_api/src/model/search_subjects_request.dart';
import 'package:bangumi_api/src/model/search_subjects_request_filter.dart';
import 'package:bangumi_api/src/model/slim_subject.dart';
import 'package:bangumi_api/src/model/stat.dart';
import 'package:bangumi_api/src/model/subject.dart';
import 'package:bangumi_api/src/model/subject_anime_category.dart';
import 'package:bangumi_api/src/model/subject_book_category.dart';
import 'package:bangumi_api/src/model/subject_category.dart';
import 'package:bangumi_api/src/model/subject_collection_type.dart';
import 'package:bangumi_api/src/model/subject_game_category.dart';
import 'package:bangumi_api/src/model/subject_real_category.dart';
import 'package:bangumi_api/src/model/subject_revision.dart';
import 'package:bangumi_api/src/model/subject_revision_data.dart';
import 'package:bangumi_api/src/model/subject_type.dart';
import 'package:bangumi_api/src/model/tag.dart';
import 'package:bangumi_api/src/model/user.dart';
import 'package:bangumi_api/src/model/user_character_collection.dart';
import 'package:bangumi_api/src/model/user_episode_collection.dart';
import 'package:bangumi_api/src/model/user_group.dart';
import 'package:bangumi_api/src/model/user_person_collection.dart';
import 'package:bangumi_api/src/model/user_subject_collection.dart';
import 'package:bangumi_api/src/model/user_subject_collection_modify_payload.dart';
import 'package:bangumi_api/src/model/v.dart';
import 'package:bangumi_api/src/model/v0_related_subject.dart';
import 'package:bangumi_api/src/model/v0_subject_relation.dart';
import 'package:bangumi_api/src/model/value.dart';
import 'package:bangumi_api/src/model/value_any_of_inner.dart';

part 'serializers.g.dart';

@SerializersFor([
  Avatar,
  BloodType,
  CharacterDetail,
  CharacterPerson,
  CharacterRevision,
  CharacterRevisionDataItem,
  CharacterType,
  Collection,
  Count,
  Creator,
  Detail,
  DetailOneOf,
  DetailedRevision,
  EpType,
  Episode,
  EpisodeCollectionType,
  EpisodeDetail,
  ErrorDetail,
  GetMyself200Response,
  GetUserSubjectEpisodeCollection200Response,
  Images,
  Index,
  IndexBasicInfo,
  IndexSubject,
  IndexSubjectAddInfo,
  IndexSubjectEditInfo,
  Item,
  KV,
  Page,
  $Page,
  PagedEpisode,
  PagedIndexSubject,
  PagedRevision,
  PagedSubject,
  PagedUserCharacterCollection,
  PagedUserCollection,
  PagedUserPersonCollection,
  PatchUserSubjectEpisodeCollectionRequest,
  Person,
  PersonCareer,
  PersonCharacter,
  PersonDetail,
  PersonImages,
  PersonRevision,
  PersonRevisionDataItem,
  PersonRevisionProfession,
  PersonType,
  PutUserEpisodeCollectionRequest,
  Rating,
  RelatedCharacter,
  RelatedPerson,
  Revision,
  $Revision,
  RevisionExtra,
  SearchSubjectsRequest,
  SearchSubjectsRequestFilter,
  SlimSubject,
  Stat,
  Subject,
  SubjectAnimeCategory,
  SubjectBookCategory,
  SubjectCategory,
  SubjectCollectionType,
  SubjectGameCategory,
  SubjectRealCategory,
  SubjectRevision,
  SubjectRevisionData,
  SubjectType,
  Tag,
  User,
  $User,
  UserCharacterCollection,
  UserEpisodeCollection,
  UserGroup,
  UserPersonCollection,
  UserSubjectCollection,
  UserSubjectCollectionModifyPayload,
  V,
  V0RelatedSubject,
  V0SubjectRelation,
  Value,
  ValueAnyOfInner,
])
Serializers serializers = (_$serializers.toBuilder()
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(RelatedPerson)]),
        () => ListBuilder<RelatedPerson>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(V0RelatedSubject)]),
        () => ListBuilder<V0RelatedSubject>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(RelatedCharacter)]),
        () => ListBuilder<RelatedCharacter>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(PersonCharacter)]),
        () => ListBuilder<PersonCharacter>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(V0SubjectRelation)]),
        () => ListBuilder<V0SubjectRelation>(),
      )
      ..addBuilderFactory(
        const FullType(BuiltList, [FullType(CharacterPerson)]),
        () => ListBuilder<CharacterPerson>(),
      )
      ..add(Page.serializer)
      ..add(Revision.serializer)
      ..add(User.serializer)
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
