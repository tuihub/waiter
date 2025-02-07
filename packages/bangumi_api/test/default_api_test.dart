import 'package:test/test.dart';
import 'package:bangumi_api/bangumi_api.dart';

/// tests for DefaultApi
void main() {
  final instance = BangumiApi().getDefaultApi();

  group(DefaultApi, () {
    // Add a subject to Index
    //
    //Future addSubjectToIndexByIndexId(int indexId, { IndexSubjectAddInfo indexSubjectAddInfo }) async
    test('test addSubjectToIndexByIndexId', () async {
      // TODO
    });

    // Collect character for current user
    //
    // 为当前用户收藏角色
    //
    //Future collectCharacterByCharacterIdAndUserId(int characterId) async
    test('test collectCharacterByCharacterIdAndUserId', () async {
      // TODO
    });

    // Collect index for current user
    //
    // 为当前用户收藏一条目录
    //
    //Future collectIndexByIndexIdAndUserId(int indexId) async
    test('test collectIndexByIndexIdAndUserId', () async {
      // TODO
    });

    // Collect person for current user
    //
    // 为当前用户收藏人物
    //
    //Future collectPersonByPersonIdAndUserId(int personId) async
    test('test collectPersonByPersonIdAndUserId', () async {
      // TODO
    });

    // Delete a subject from a Index
    //
    //Future delelteSubjectFromIndexByIndexIdAndSubjectID(int indexId, int subjectId) async
    test('test delelteSubjectFromIndexByIndexIdAndSubjectID', () async {
      // TODO
    });

    // Edit index's information
    //
    //Future<Index> editIndexById(int indexId, { IndexBasicInfo indexBasicInfo }) async
    test('test editIndexById', () async {
      // TODO
    });

    // Edit subject information in a index
    //
    // 如果条目不存在于目录，会创建该条目
    //
    //Future editIndexSubjectsByIndexIdAndSubjectID(int indexId, int subjectId, { IndexSubjectEditInfo indexSubjectEditInfo }) async
    test('test editIndexSubjectsByIndexIdAndSubjectID', () async {
      // TODO
    });

    // Get Character Detail
    //
    // cache with 60s
    //
    //Future<Character> getCharacterById(int characterId) async
    test('test getCharacterById', () async {
      // TODO
    });

    // Get Character Image
    //
    //Future getCharacterImageById(int characterId, String type) async
    test('test getCharacterImageById', () async {
      // TODO
    });

    // Get Character Revision
    //
    //Future<CharacterRevision> getCharacterRevisionByRevisionId(int revisionId) async
    test('test getCharacterRevisionByRevisionId', () async {
      // TODO
    });

    // Get Character Revisions
    //
    //Future<PagedRevision> getCharacterRevisions(int characterId, { int limit, int offset }) async
    test('test getCharacterRevisions', () async {
      // TODO
    });

    // Get Episode
    //
    //Future<EpisodeDetail> getEpisodeById(int episodeId) async
    test('test getEpisodeById', () async {
      // TODO
    });

    // Get Episode Revision
    //
    //Future<DetailedRevision> getEpisodeRevisionByRevisionId(int revisionId) async
    test('test getEpisodeRevisionByRevisionId', () async {
      // TODO
    });

    // Get Episode Revisions
    //
    //Future<PagedRevision> getEpisodeRevisions(int episodeId, { int limit, int offset }) async
    test('test getEpisodeRevisions', () async {
      // TODO
    });

    // Get Episodes
    //
    //Future<PagedEpisode> getEpisodes(int subjectId, { EpType type, int limit, int offset }) async
    test('test getEpisodes', () async {
      // TODO
    });

    // Get Index By ID
    //
    //Future<Index> getIndexById(int indexId) async
    test('test getIndexById', () async {
      // TODO
    });

    // Get Index Subjects
    //
    //Future getIndexSubjectsByIndexId(int indexId, { SubjectType type, int limit, int offset }) async
    test('test getIndexSubjectsByIndexId', () async {
      // TODO
    });

    // Get User
    //
    // 返回当前 Access Token 对应的用户信息
    //
    //Future<GetMyself200Response> getMyself() async
    test('test getMyself', () async {
      // TODO
    });

    // Get Person
    //
    // cache with 60s
    //
    //Future<PersonDetail> getPersonById(int personId) async
    test('test getPersonById', () async {
      // TODO
    });

    // Get Person Image
    //
    //Future getPersonImageById(int personId, String type) async
    test('test getPersonImageById', () async {
      // TODO
    });

    // Get Person Revision
    //
    //Future<PersonRevision> getPersonRevisionByRevisionId(int revisionId) async
    test('test getPersonRevisionByRevisionId', () async {
      // TODO
    });

    // Get Person Revisions
    //
    //Future<PagedRevision> getPersonRevisions(int personId, { int limit, int offset }) async
    test('test getPersonRevisions', () async {
      // TODO
    });

    // get person related characters
    //
    //Future<List<PersonCharacter>> getRelatedCharactersByPersonId(int personId) async
    test('test getRelatedCharactersByPersonId', () async {
      // TODO
    });

    // Get Subject Characters
    //
    //Future<List<RelatedCharacter>> getRelatedCharactersBySubjectId(int subjectId) async
    test('test getRelatedCharactersBySubjectId', () async {
      // TODO
    });

    // get character related persons
    //
    //Future<List<CharacterPerson>> getRelatedPersonsByCharacterId(int characterId) async
    test('test getRelatedPersonsByCharacterId', () async {
      // TODO
    });

    // Get Subject Persons
    //
    //Future<List<RelatedPerson>> getRelatedPersonsBySubjectId(int subjectId) async
    test('test getRelatedPersonsBySubjectId', () async {
      // TODO
    });

    // get character related subjects
    //
    //Future<List<V0RelatedSubject>> getRelatedSubjectsByCharacterId(int characterId) async
    test('test getRelatedSubjectsByCharacterId', () async {
      // TODO
    });

    // get person related subjects
    //
    //Future<List<V0RelatedSubject>> getRelatedSubjectsByPersonId(int personId) async
    test('test getRelatedSubjectsByPersonId', () async {
      // TODO
    });

    // Get Subject Relations
    //
    //Future<List<V0SubjectRelation>> getRelatedSubjectsBySubjectId(int subjectId) async
    test('test getRelatedSubjectsBySubjectId', () async {
      // TODO
    });

    // 获取条目
    //
    // cache with 300s
    //
    //Future<Subject> getSubjectById(int subjectId) async
    test('test getSubjectById', () async {
      // TODO
    });

    // Get Subject Image
    //
    //Future getSubjectImageById(int subjectId, String type) async
    test('test getSubjectImageById', () async {
      // TODO
    });

    // Get Subject Revision
    //
    //Future<SubjectRevision> getSubjectRevisionByRevisionId(int revisionId) async
    test('test getSubjectRevisionByRevisionId', () async {
      // TODO
    });

    // Get Subject Revisions
    //
    //Future<PagedRevision> getSubjectRevisions(int subjectId, { int limit, int offset }) async
    test('test getSubjectRevisions', () async {
      // TODO
    });

    // 浏览条目
    //
    // 第一页会 cache 24h，之后会 cache 1h
    //
    //Future<PagedSubject> getSubjects(SubjectType type, { SubjectCategory cat, bool series, String platform, String sort, int year, int month, int limit, int offset }) async
    test('test getSubjects', () async {
      // TODO
    });

    // Get User Avatar by name
    //
    // 获取用户头像，302 重定向至头像地址，设置了 username 之后无法使用 UID 查询。
    //
    //Future getUserAvatarByName(String username, String type) async
    test('test getUserAvatarByName', () async {
      // TODO
    });

    // Get User by name
    //
    // 获取用户信息
    //
    //Future<User> getUserByName(String username) async
    test('test getUserByName', () async {
      // TODO
    });

    // 获取用户单个角色收藏信息
    //
    //Future<UserCharacterCollection> getUserCharacterCollection(String username, int characterId) async
    test('test getUserCharacterCollection', () async {
      // TODO
    });

    // 获取用户角色收藏列表
    //
    //Future<PagedUserCharacterCollection> getUserCharacterCollections(String username) async
    test('test getUserCharacterCollections', () async {
      // TODO
    });

    // 获取用户单个条目收藏
    //
    // 获取对应用户的收藏，查看私有收藏需要 access token
    //
    //Future<UserSubjectCollection> getUserCollection(String username, int subjectId) async
    test('test getUserCollection', () async {
      // TODO
    });

    // 获取用户收藏
    //
    // 获取对应用户的收藏，查看私有收藏需要access token。
    //
    //Future<PagedUserCollection> getUserCollectionsByUsername(String username, { SubjectType subjectType, SubjectCollectionType type, int limit, int offset }) async
    test('test getUserCollectionsByUsername', () async {
      // TODO
    });

    // 章节收藏信息
    //
    //Future<UserEpisodeCollection> getUserEpisodeCollection(int episodeId) async
    test('test getUserEpisodeCollection', () async {
      // TODO
    });

    // 获取用户单个人物收藏信息
    //
    //Future<UserPersonCollection> getUserPersonCollection(String username, int personId) async
    test('test getUserPersonCollection', () async {
      // TODO
    });

    // 获取用户人物收藏列表
    //
    //Future<PagedUserPersonCollection> getUserPersonCollections(String username) async
    test('test getUserPersonCollections', () async {
      // TODO
    });

    // 章节收藏信息
    //
    //Future<GetUserSubjectEpisodeCollection200Response> getUserSubjectEpisodeCollection(int subjectId, { int offset, int limit, EpType episodeType }) async
    test('test getUserSubjectEpisodeCollection', () async {
      // TODO
    });

    // Create a new index
    //
    //Future<Index> newIndex() async
    test('test newIndex', () async {
      // TODO
    });

    // 修改用户单个收藏
    //
    // 修改条目收藏状态  由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。  PATCH 方法的所有请求体字段均可选
    //
    //Future patchUserCollection(int subjectId, { UserSubjectCollectionModifyPayload userSubjectCollectionModifyPayload }) async
    test('test patchUserCollection', () async {
      // TODO
    });

    // 章节收藏信息
    //
    // 同时会重新计算条目的完成度
    //
    //Future patchUserSubjectEpisodeCollection(int subjectId, { PatchUserSubjectEpisodeCollectionRequest patchUserSubjectEpisodeCollectionRequest }) async
    test('test patchUserSubjectEpisodeCollection', () async {
      // TODO
    });

    // 新增或修改用户单个条目收藏
    //
    // 修改条目收藏状态, 如果不存在则创建，如果存在则修改  由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。  方法的所有请求体字段均可选
    //
    //Future postUserCollection(int subjectId, { UserSubjectCollectionModifyPayload userSubjectCollectionModifyPayload }) async
    test('test postUserCollection', () async {
      // TODO
    });

    // 更新章节收藏信息
    //
    //Future putUserEpisodeCollection(int episodeId, { PutUserEpisodeCollectionRequest putUserEpisodeCollectionRequest }) async
    test('test putUserEpisodeCollection', () async {
      // TODO
    });

    // 角色搜索
    //
    // ## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动  目前支持的筛选条件包括: - `nsfw`: 使用 `include` 包含NSFW搜索结果。默认排除搜索NSFW条目。无权限情况下忽略此选项，不会返回NSFW条目。
    //
    //Future<PagedCharacter> searchCharacters({ int limit, int offset, SearchCharactersRequest searchCharactersRequest }) async
    test('test searchCharacters', () async {
      // TODO
    });

    // 人物搜索
    //
    // ## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动  目前支持的筛选条件包括: - `career`: 职业，可以多次出现。`且` 关系。  不同筛选条件之间为 `且`
    //
    //Future<PagedPerson> searchPersons({ int limit, int offset, SearchPersonsRequest searchPersonsRequest }) async
    test('test searchPersons', () async {
      // TODO
    });

    // 条目搜索
    //
    // ## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动  目前支持的筛选条件包括: - `type`: 条目类型，参照 `SubjectType` enum， `或`。 - `tag`: 标签，可以多次出现。`且` 关系。 - `airdate`: 播出日期/发售日期。`且` 关系。 - `rating`: 用于搜索指定评分的条目。`且` 关系。 - `rank`: 用于搜索指定排名的条目。`且` 关系。 - `nsfw`: 使用 `include` 包含NSFW搜索结果。默认排除搜索NSFW条目。无权限情况下忽略此选项，不会返回NSFW条目。  不同筛选条件之间为 `且`
    //
    //Future<PagedSubject> searchSubjects({ int limit, int offset, SearchSubjectsRequest searchSubjectsRequest }) async
    test('test searchSubjects', () async {
      // TODO
    });

    // Uncollect character for current user
    //
    // 为当前用户取消收藏角色
    //
    //Future uncollectCharacterByCharacterIdAndUserId(int characterId) async
    test('test uncollectCharacterByCharacterIdAndUserId', () async {
      // TODO
    });

    // Uncollect index for current user
    //
    // 为当前用户取消收藏一条目录
    //
    //Future uncollectIndexByIndexIdAndUserId(int indexId) async
    test('test uncollectIndexByIndexIdAndUserId', () async {
      // TODO
    });

    // Uncollect person for current user
    //
    // 为当前用户取消收藏人物
    //
    //Future uncollectPersonByPersonIdAndUserId(int personId) async
    test('test uncollectPersonByPersonIdAndUserId', () async {
      // TODO
    });
  });
}
