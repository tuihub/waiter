// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'serializers.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializers _$serializers = (new Serializers().toBuilder()
      ..add($Page.serializer)
      ..add($Revision.serializer)
      ..add($User.serializer)
      ..add(Avatar.serializer)
      ..add(BloodType.serializer)
      ..add(CharacterDetail.serializer)
      ..add(CharacterPerson.serializer)
      ..add(CharacterRevision.serializer)
      ..add(CharacterRevisionDataItem.serializer)
      ..add(CharacterType.serializer)
      ..add(Collection.serializer)
      ..add(Count.serializer)
      ..add(Creator.serializer)
      ..add(Detail.serializer)
      ..add(DetailOneOf.serializer)
      ..add(DetailedRevision.serializer)
      ..add(EpType.serializer)
      ..add(Episode.serializer)
      ..add(EpisodeCollectionType.serializer)
      ..add(EpisodeDetail.serializer)
      ..add(ErrorDetail.serializer)
      ..add(GetMyself200Response.serializer)
      ..add(GetUserSubjectEpisodeCollection200Response.serializer)
      ..add(Images.serializer)
      ..add(Index.serializer)
      ..add(IndexBasicInfo.serializer)
      ..add(IndexSubject.serializer)
      ..add(IndexSubjectAddInfo.serializer)
      ..add(IndexSubjectEditInfo.serializer)
      ..add(Item.serializer)
      ..add(KV.serializer)
      ..add(PagedEpisode.serializer)
      ..add(PagedIndexSubject.serializer)
      ..add(PagedRevision.serializer)
      ..add(PagedSubject.serializer)
      ..add(PagedUserCharacterCollection.serializer)
      ..add(PagedUserCollection.serializer)
      ..add(PagedUserPersonCollection.serializer)
      ..add(PatchUserSubjectEpisodeCollectionRequest.serializer)
      ..add(Person.serializer)
      ..add(PersonCareer.serializer)
      ..add(PersonCharacter.serializer)
      ..add(PersonDetail.serializer)
      ..add(PersonImages.serializer)
      ..add(PersonRevision.serializer)
      ..add(PersonRevisionDataItem.serializer)
      ..add(PersonRevisionProfession.serializer)
      ..add(PersonType.serializer)
      ..add(PutUserEpisodeCollectionRequest.serializer)
      ..add(Rating.serializer)
      ..add(RelatedCharacter.serializer)
      ..add(RelatedPerson.serializer)
      ..add(RevisionExtra.serializer)
      ..add(SearchSubjectsRequest.serializer)
      ..add(SearchSubjectsRequestFilter.serializer)
      ..add(SearchSubjectsRequestSortEnum.serializer)
      ..add(SlimSubject.serializer)
      ..add(Stat.serializer)
      ..add(Subject.serializer)
      ..add(SubjectAnimeCategory.serializer)
      ..add(SubjectBookCategory.serializer)
      ..add(SubjectCategory.serializer)
      ..add(SubjectCollectionType.serializer)
      ..add(SubjectGameCategory.serializer)
      ..add(SubjectRealCategory.serializer)
      ..add(SubjectRevision.serializer)
      ..add(SubjectRevisionData.serializer)
      ..add(SubjectType.serializer)
      ..add(Tag.serializer)
      ..add(UserCharacterCollection.serializer)
      ..add(UserEpisodeCollection.serializer)
      ..add(UserGroup.serializer)
      ..add(UserPersonCollection.serializer)
      ..add(UserSubjectCollection.serializer)
      ..add(UserSubjectCollectionModifyPayload.serializer)
      ..add(V.serializer)
      ..add(V0RelatedSubject.serializer)
      ..add(V0SubjectRelation.serializer)
      ..add(Value.serializer)
      ..add(ValueAnyOfInner.serializer)
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Episode)]),
          () => new ListBuilder<Episode>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(IndexSubject)]),
          () => new ListBuilder<IndexSubject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Item)]),
          () => new ListBuilder<Item>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Item)]),
          () => new ListBuilder<Item>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Tag)]),
          () => new ListBuilder<Tag>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(JsonObject)]),
          () => new ListBuilder<JsonObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Person)]),
          () => new ListBuilder<Person>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PersonCareer)]),
          () => new ListBuilder<PersonCareer>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PersonCareer)]),
          () => new ListBuilder<PersonCareer>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PersonCareer)]),
          () => new ListBuilder<PersonCareer>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(PersonCareer)]),
          () => new ListBuilder<PersonCareer>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(JsonObject)]),
          () => new ListBuilder<JsonObject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Revision)]),
          () => new ListBuilder<Revision>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Subject)]),
          () => new ListBuilder<Subject>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(SubjectType)]),
          () => new ListBuilder<SubjectType>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(String)]),
          () => new ListBuilder<String>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(Tag)]),
          () => new ListBuilder<Tag>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UserCharacterCollection)]),
          () => new ListBuilder<UserCharacterCollection>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UserEpisodeCollection)]),
          () => new ListBuilder<UserEpisodeCollection>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UserPersonCollection)]),
          () => new ListBuilder<UserPersonCollection>())
      ..addBuilderFactory(
          const FullType(
              BuiltList, const [const FullType(UserSubjectCollection)]),
          () => new ListBuilder<UserSubjectCollection>())
      ..addBuilderFactory(
          const FullType(BuiltList, const [const FullType(int)]),
          () => new ListBuilder<int>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(CharacterRevisionDataItem)
          ]),
          () => new MapBuilder<String, CharacterRevisionDataItem>())
      ..addBuilderFactory(
          const FullType(BuiltMap, const [
            const FullType(String),
            const FullType(PersonRevisionDataItem)
          ]),
          () => new MapBuilder<String, PersonRevisionDataItem>()))
    .build();

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
