# bangumi_api.api.DefaultApi

## Load the API package
```dart
import 'package:bangumi_api/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addSubjectToIndexByIndexId**](DefaultApi.md#addsubjecttoindexbyindexid) | **POST** /v0/indices/{index_id}/subjects | Add a subject to Index
[**collectCharacterByCharacterIdAndUserId**](DefaultApi.md#collectcharacterbycharacteridanduserid) | **POST** /v0/characters/{character_id}/collect | Collect character for current user
[**collectIndexByIndexIdAndUserId**](DefaultApi.md#collectindexbyindexidanduserid) | **POST** /v0/indices/{index_id}/collect | Collect index for current user
[**collectPersonByPersonIdAndUserId**](DefaultApi.md#collectpersonbypersonidanduserid) | **POST** /v0/persons/{person_id}/collect | Collect person for current user
[**delelteSubjectFromIndexByIndexIdAndSubjectID**](DefaultApi.md#deleltesubjectfromindexbyindexidandsubjectid) | **DELETE** /v0/indices/{index_id}/subjects/{subject_id} | Delete a subject from a Index
[**editIndexById**](DefaultApi.md#editindexbyid) | **PUT** /v0/indices/{index_id} | Edit index&#39;s information
[**editIndexSubjectsByIndexIdAndSubjectID**](DefaultApi.md#editindexsubjectsbyindexidandsubjectid) | **PUT** /v0/indices/{index_id}/subjects/{subject_id} | Edit subject information in a index
[**getCharacterById**](DefaultApi.md#getcharacterbyid) | **GET** /v0/characters/{character_id} | Get Character Detail
[**getCharacterImageById**](DefaultApi.md#getcharacterimagebyid) | **GET** /v0/characters/{character_id}/image | Get Character Image
[**getCharacterRevisionByRevisionId**](DefaultApi.md#getcharacterrevisionbyrevisionid) | **GET** /v0/revisions/characters/{revision_id} | Get Character Revision
[**getCharacterRevisions**](DefaultApi.md#getcharacterrevisions) | **GET** /v0/revisions/characters | Get Character Revisions
[**getEpisodeById**](DefaultApi.md#getepisodebyid) | **GET** /v0/episodes/{episode_id} | Get Episode
[**getEpisodeRevisionByRevisionId**](DefaultApi.md#getepisoderevisionbyrevisionid) | **GET** /v0/revisions/episodes/{revision_id} | Get Episode Revision
[**getEpisodeRevisions**](DefaultApi.md#getepisoderevisions) | **GET** /v0/revisions/episodes | Get Episode Revisions
[**getEpisodes**](DefaultApi.md#getepisodes) | **GET** /v0/episodes | Get Episodes
[**getIndexById**](DefaultApi.md#getindexbyid) | **GET** /v0/indices/{index_id} | Get Index By ID
[**getIndexSubjectsByIndexId**](DefaultApi.md#getindexsubjectsbyindexid) | **GET** /v0/indices/{index_id}/subjects | Get Index Subjects
[**getMyself**](DefaultApi.md#getmyself) | **GET** /v0/me | Get User
[**getPersonById**](DefaultApi.md#getpersonbyid) | **GET** /v0/persons/{person_id} | Get Person
[**getPersonImageById**](DefaultApi.md#getpersonimagebyid) | **GET** /v0/persons/{person_id}/image | Get Person Image
[**getPersonRevisionByRevisionId**](DefaultApi.md#getpersonrevisionbyrevisionid) | **GET** /v0/revisions/persons/{revision_id} | Get Person Revision
[**getPersonRevisions**](DefaultApi.md#getpersonrevisions) | **GET** /v0/revisions/persons | Get Person Revisions
[**getRelatedCharactersByPersonId**](DefaultApi.md#getrelatedcharactersbypersonid) | **GET** /v0/persons/{person_id}/characters | get person related characters
[**getRelatedCharactersBySubjectId**](DefaultApi.md#getrelatedcharactersbysubjectid) | **GET** /v0/subjects/{subject_id}/characters | Get Subject Characters
[**getRelatedPersonsByCharacterId**](DefaultApi.md#getrelatedpersonsbycharacterid) | **GET** /v0/characters/{character_id}/persons | get character related persons
[**getRelatedPersonsBySubjectId**](DefaultApi.md#getrelatedpersonsbysubjectid) | **GET** /v0/subjects/{subject_id}/persons | Get Subject Persons
[**getRelatedSubjectsByCharacterId**](DefaultApi.md#getrelatedsubjectsbycharacterid) | **GET** /v0/characters/{character_id}/subjects | get character related subjects
[**getRelatedSubjectsByPersonId**](DefaultApi.md#getrelatedsubjectsbypersonid) | **GET** /v0/persons/{person_id}/subjects | get person related subjects
[**getRelatedSubjectsBySubjectId**](DefaultApi.md#getrelatedsubjectsbysubjectid) | **GET** /v0/subjects/{subject_id}/subjects | Get Subject Relations
[**getSubjectById**](DefaultApi.md#getsubjectbyid) | **GET** /v0/subjects/{subject_id} | 获取条目
[**getSubjectImageById**](DefaultApi.md#getsubjectimagebyid) | **GET** /v0/subjects/{subject_id}/image | Get Subject Image
[**getSubjectRevisionByRevisionId**](DefaultApi.md#getsubjectrevisionbyrevisionid) | **GET** /v0/revisions/subjects/{revision_id} | Get Subject Revision
[**getSubjectRevisions**](DefaultApi.md#getsubjectrevisions) | **GET** /v0/revisions/subjects | Get Subject Revisions
[**getSubjects**](DefaultApi.md#getsubjects) | **GET** /v0/subjects | 浏览条目
[**getUserAvatarByName**](DefaultApi.md#getuseravatarbyname) | **GET** /v0/users/{username}/avatar | Get User Avatar by name
[**getUserByName**](DefaultApi.md#getuserbyname) | **GET** /v0/users/{username} | Get User by name
[**getUserCharacterCollection**](DefaultApi.md#getusercharactercollection) | **GET** /v0/users/{username}/collections/-/characters/{character_id} | 获取用户单个角色收藏信息
[**getUserCharacterCollections**](DefaultApi.md#getusercharactercollections) | **GET** /v0/users/{username}/collections/-/characters | 获取用户角色收藏列表
[**getUserCollection**](DefaultApi.md#getusercollection) | **GET** /v0/users/{username}/collections/{subject_id} | 获取用户单个条目收藏
[**getUserCollectionsByUsername**](DefaultApi.md#getusercollectionsbyusername) | **GET** /v0/users/{username}/collections | 获取用户收藏
[**getUserEpisodeCollection**](DefaultApi.md#getuserepisodecollection) | **GET** /v0/users/-/collections/-/episodes/{episode_id} | 章节收藏信息
[**getUserPersonCollection**](DefaultApi.md#getuserpersoncollection) | **GET** /v0/users/{username}/collections/-/persons/{person_id} | 获取用户单个人物收藏信息
[**getUserPersonCollections**](DefaultApi.md#getuserpersoncollections) | **GET** /v0/users/{username}/collections/-/persons | 获取用户人物收藏列表
[**getUserSubjectEpisodeCollection**](DefaultApi.md#getusersubjectepisodecollection) | **GET** /v0/users/-/collections/{subject_id}/episodes | 章节收藏信息
[**newIndex**](DefaultApi.md#newindex) | **POST** /v0/indices | Create a new index
[**patchUserCollection**](DefaultApi.md#patchusercollection) | **PATCH** /v0/users/-/collections/{subject_id} | 修改用户单个收藏
[**patchUserSubjectEpisodeCollection**](DefaultApi.md#patchusersubjectepisodecollection) | **PATCH** /v0/users/-/collections/{subject_id}/episodes | 章节收藏信息
[**postUserCollection**](DefaultApi.md#postusercollection) | **POST** /v0/users/-/collections/{subject_id} | 新增或修改用户单个条目收藏
[**putUserEpisodeCollection**](DefaultApi.md#putuserepisodecollection) | **PUT** /v0/users/-/collections/-/episodes/{episode_id} | 更新章节收藏信息
[**searchCharacters**](DefaultApi.md#searchcharacters) | **POST** /v0/search/characters | 角色搜索
[**searchPersons**](DefaultApi.md#searchpersons) | **POST** /v0/search/persons | 人物搜索
[**searchSubjects**](DefaultApi.md#searchsubjects) | **POST** /v0/search/subjects | 条目搜索
[**uncollectCharacterByCharacterIdAndUserId**](DefaultApi.md#uncollectcharacterbycharacteridanduserid) | **DELETE** /v0/characters/{character_id}/collect | Uncollect character for current user
[**uncollectIndexByIndexIdAndUserId**](DefaultApi.md#uncollectindexbyindexidanduserid) | **DELETE** /v0/indices/{index_id}/collect | Uncollect index for current user
[**uncollectPersonByPersonIdAndUserId**](DefaultApi.md#uncollectpersonbypersonidanduserid) | **DELETE** /v0/persons/{person_id}/collect | Uncollect person for current user


# **addSubjectToIndexByIndexId**
> addSubjectToIndexByIndexId(indexId, indexSubjectAddInfo)

Add a subject to Index

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID
final IndexSubjectAddInfo indexSubjectAddInfo = ; // IndexSubjectAddInfo | 

try {
    api.addSubjectToIndexByIndexId(indexId, indexSubjectAddInfo);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->addSubjectToIndexByIndexId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 
 **indexSubjectAddInfo** | [**IndexSubjectAddInfo**](IndexSubjectAddInfo.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **collectCharacterByCharacterIdAndUserId**
> collectCharacterByCharacterIdAndUserId(characterId)

Collect character for current user

为当前用户收藏角色

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID

try {
    api.collectCharacterByCharacterIdAndUserId(characterId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->collectCharacterByCharacterIdAndUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **collectIndexByIndexIdAndUserId**
> collectIndexByIndexIdAndUserId(indexId)

Collect index for current user

为当前用户收藏一条目录

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID

try {
    api.collectIndexByIndexIdAndUserId(indexId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->collectIndexByIndexIdAndUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **collectPersonByPersonIdAndUserId**
> collectPersonByPersonIdAndUserId(personId)

Collect person for current user

为当前用户收藏人物

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 人物 ID

try {
    api.collectPersonByPersonIdAndUserId(personId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->collectPersonByPersonIdAndUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 人物 ID | 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **delelteSubjectFromIndexByIndexIdAndSubjectID**
> delelteSubjectFromIndexByIndexIdAndSubjectID(indexId, subjectId)

Delete a subject from a Index

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID
final int subjectId = 56; // int | 条目 ID

try {
    api.delelteSubjectFromIndexByIndexIdAndSubjectID(indexId, subjectId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->delelteSubjectFromIndexByIndexIdAndSubjectID: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 
 **subjectId** | **int**| 条目 ID | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editIndexById**
> Index editIndexById(indexId, indexBasicInfo)

Edit index's information

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID
final IndexBasicInfo indexBasicInfo = ; // IndexBasicInfo | 

try {
    final response = api.editIndexById(indexId, indexBasicInfo);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->editIndexById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 
 **indexBasicInfo** | [**IndexBasicInfo**](IndexBasicInfo.md)|  | [optional] 

### Return type

[**Index**](Index.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **editIndexSubjectsByIndexIdAndSubjectID**
> editIndexSubjectsByIndexIdAndSubjectID(indexId, subjectId, indexSubjectEditInfo)

Edit subject information in a index

如果条目不存在于目录，会创建该条目

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID
final int subjectId = 56; // int | 条目 ID
final IndexSubjectEditInfo indexSubjectEditInfo = ; // IndexSubjectEditInfo | 

try {
    api.editIndexSubjectsByIndexIdAndSubjectID(indexId, subjectId, indexSubjectEditInfo);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->editIndexSubjectsByIndexIdAndSubjectID: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 
 **subjectId** | **int**| 条目 ID | 
 **indexSubjectEditInfo** | [**IndexSubjectEditInfo**](IndexSubjectEditInfo.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCharacterById**
> Character getCharacterById(characterId)

Get Character Detail

cache with 60s

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID

try {
    final response = api.getCharacterById(characterId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getCharacterById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 

### Return type

[**Character**](Character.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCharacterImageById**
> getCharacterImageById(characterId, type)

Get Character Image

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID
final String type = type_example; // String | 枚举值 {small|grid|large|medium}

try {
    api.getCharacterImageById(characterId, type);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getCharacterImageById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 
 **type** | **String**| 枚举值 {small|grid|large|medium} | 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCharacterRevisionByRevisionId**
> CharacterRevision getCharacterRevisionByRevisionId(revisionId)

Get Character Revision

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int revisionId = 56; // int | 版本 ID

try {
    final response = api.getCharacterRevisionByRevisionId(revisionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getCharacterRevisionByRevisionId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revisionId** | **int**| 版本 ID | 

### Return type

[**CharacterRevision**](CharacterRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getCharacterRevisions**
> PagedRevision getCharacterRevisions(characterId, limit, offset)

Get Character Revisions

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getCharacterRevisions(characterId, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getCharacterRevisions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedRevision**](PagedRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpisodeById**
> EpisodeDetail getEpisodeById(episodeId)

Get Episode

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int episodeId = 56; // int | 章节 ID

try {
    final response = api.getEpisodeById(episodeId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getEpisodeById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **episodeId** | **int**| 章节 ID | 

### Return type

[**EpisodeDetail**](EpisodeDetail.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpisodeRevisionByRevisionId**
> DetailedRevision getEpisodeRevisionByRevisionId(revisionId)

Get Episode Revision

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int revisionId = 56; // int | 版本 ID

try {
    final response = api.getEpisodeRevisionByRevisionId(revisionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getEpisodeRevisionByRevisionId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revisionId** | **int**| 版本 ID | 

### Return type

[**DetailedRevision**](DetailedRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpisodeRevisions**
> PagedRevision getEpisodeRevisions(episodeId, limit, offset)

Get Episode Revisions

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int episodeId = 56; // int | 章节 ID
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getEpisodeRevisions(episodeId, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getEpisodeRevisions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **episodeId** | **int**| 章节 ID | 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedRevision**](PagedRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getEpisodes**
> PagedEpisode getEpisodes(subjectId, type, limit, offset)

Get Episodes

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final EpType type = ; // EpType | 参照章节的`type`
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getEpisodes(subjectId, type, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getEpisodes: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **type** | [**EpType**](.md)| 参照章节的`type` | [optional] 
 **limit** | **int**| 分页参数 | [optional] [default to 100]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedEpisode**](PagedEpisode.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIndexById**
> Index getIndexById(indexId)

Get Index By ID

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID

try {
    final response = api.getIndexById(indexId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getIndexById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 

### Return type

[**Index**](Index.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getIndexSubjectsByIndexId**
> getIndexSubjectsByIndexId(indexId, type, limit, offset)

Get Index Subjects

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID
final SubjectType type = ; // SubjectType | 条目类型
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    api.getIndexSubjectsByIndexId(indexId, type, limit, offset);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getIndexSubjectsByIndexId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 
 **type** | [**SubjectType**](.md)| 条目类型 | [optional] 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMyself**
> GetMyself200Response getMyself()

Get User

返回当前 Access Token 对应的用户信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();

try {
    final response = api.getMyself();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getMyself: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**GetMyself200Response**](GetMyself200Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonById**
> PersonDetail getPersonById(personId)

Get Person

cache with 60s

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 人物 ID

try {
    final response = api.getPersonById(personId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getPersonById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 人物 ID | 

### Return type

[**PersonDetail**](PersonDetail.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonImageById**
> getPersonImageById(personId, type)

Get Person Image

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 人物 ID
final String type = type_example; // String | 枚举值 {small|grid|large|medium}

try {
    api.getPersonImageById(personId, type);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getPersonImageById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 人物 ID | 
 **type** | **String**| 枚举值 {small|grid|large|medium} | 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonRevisionByRevisionId**
> PersonRevision getPersonRevisionByRevisionId(revisionId)

Get Person Revision

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int revisionId = 56; // int | 历史版本 ID

try {
    final response = api.getPersonRevisionByRevisionId(revisionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getPersonRevisionByRevisionId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revisionId** | **int**| 历史版本 ID | 

### Return type

[**PersonRevision**](PersonRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getPersonRevisions**
> PagedRevision getPersonRevisions(personId, limit, offset)

Get Person Revisions

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 角色 ID
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getPersonRevisions(personId, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getPersonRevisions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 角色 ID | 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedRevision**](PagedRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedCharactersByPersonId**
> List<PersonCharacter> getRelatedCharactersByPersonId(personId)

get person related characters

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 人物 ID

try {
    final response = api.getRelatedCharactersByPersonId(personId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedCharactersByPersonId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 人物 ID | 

### Return type

[**List&lt;PersonCharacter&gt;**](PersonCharacter.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedCharactersBySubjectId**
> List<RelatedCharacter> getRelatedCharactersBySubjectId(subjectId)

Get Subject Characters

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID

try {
    final response = api.getRelatedCharactersBySubjectId(subjectId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedCharactersBySubjectId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 

### Return type

[**List&lt;RelatedCharacter&gt;**](RelatedCharacter.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedPersonsByCharacterId**
> List<CharacterPerson> getRelatedPersonsByCharacterId(characterId)

get character related persons

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID

try {
    final response = api.getRelatedPersonsByCharacterId(characterId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedPersonsByCharacterId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 

### Return type

[**List&lt;CharacterPerson&gt;**](CharacterPerson.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedPersonsBySubjectId**
> List<RelatedPerson> getRelatedPersonsBySubjectId(subjectId)

Get Subject Persons

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID

try {
    final response = api.getRelatedPersonsBySubjectId(subjectId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedPersonsBySubjectId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 

### Return type

[**List&lt;RelatedPerson&gt;**](RelatedPerson.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedSubjectsByCharacterId**
> List<V0RelatedSubject> getRelatedSubjectsByCharacterId(characterId)

get character related subjects

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID

try {
    final response = api.getRelatedSubjectsByCharacterId(characterId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedSubjectsByCharacterId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 

### Return type

[**List&lt;V0RelatedSubject&gt;**](V0RelatedSubject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedSubjectsByPersonId**
> List<V0RelatedSubject> getRelatedSubjectsByPersonId(personId)

get person related subjects

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 人物 ID

try {
    final response = api.getRelatedSubjectsByPersonId(personId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedSubjectsByPersonId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 人物 ID | 

### Return type

[**List&lt;V0RelatedSubject&gt;**](V0RelatedSubject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getRelatedSubjectsBySubjectId**
> List<V0SubjectRelation> getRelatedSubjectsBySubjectId(subjectId)

Get Subject Relations

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID

try {
    final response = api.getRelatedSubjectsBySubjectId(subjectId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getRelatedSubjectsBySubjectId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 

### Return type

[**List&lt;V0SubjectRelation&gt;**](V0SubjectRelation.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubjectById**
> Subject getSubjectById(subjectId)

获取条目

cache with 300s

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID

try {
    final response = api.getSubjectById(subjectId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getSubjectById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 

### Return type

[**Subject**](Subject.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubjectImageById**
> getSubjectImageById(subjectId, type)

Get Subject Image

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final String type = type_example; // String | 枚举值 {small|grid|large|medium|common}

try {
    api.getSubjectImageById(subjectId, type);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getSubjectImageById: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **type** | **String**| 枚举值 {small|grid|large|medium|common} | 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubjectRevisionByRevisionId**
> SubjectRevision getSubjectRevisionByRevisionId(revisionId)

Get Subject Revision

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int revisionId = 56; // int | 版本 ID

try {
    final response = api.getSubjectRevisionByRevisionId(revisionId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getSubjectRevisionByRevisionId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **revisionId** | **int**| 版本 ID | 

### Return type

[**SubjectRevision**](SubjectRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubjectRevisions**
> PagedRevision getSubjectRevisions(subjectId, limit, offset)

Get Subject Revisions

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getSubjectRevisions(subjectId, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getSubjectRevisions: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedRevision**](PagedRevision.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getSubjects**
> PagedSubject getSubjects(type, cat, series, platform, sort, year, month, limit, offset)

浏览条目

第一页会 cache 24h，之后会 cache 1h

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final SubjectType type = ; // SubjectType | 条目类型
final SubjectCategory cat = ; // SubjectCategory | 条目分类，参照 `SubjectCategory` enum
final bool series = true; // bool | 是否系列，仅对书籍类型的条目有效
final String platform = platform_example; // String | 平台，仅对游戏类型的条目有效
final String sort = sort_example; // String | 排序，枚举值 {date|rank}
final int year = 56; // int | 年份
final int month = 56; // int | 月份
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getSubjects(type, cat, series, platform, sort, year, month, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getSubjects: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **type** | [**SubjectType**](.md)| 条目类型 | 
 **cat** | [**SubjectCategory**](.md)| 条目分类，参照 `SubjectCategory` enum | [optional] 
 **series** | **bool**| 是否系列，仅对书籍类型的条目有效 | [optional] 
 **platform** | **String**| 平台，仅对游戏类型的条目有效 | [optional] 
 **sort** | **String**| 排序，枚举值 {date|rank} | [optional] 
 **year** | **int**| 年份 | [optional] 
 **month** | **int**| 月份 | [optional] 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedSubject**](PagedSubject.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserAvatarByName**
> getUserAvatarByName(username, type)

Get User Avatar by name

获取用户头像，302 重定向至头像地址，设置了 username 之后无法使用 UID 查询。

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。
final String type = type_example; // String | 枚举值 {small|large|medium}

try {
    api.getUserAvatarByName(username, type);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserAvatarByName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 
 **type** | **String**| 枚举值 {small|large|medium} | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserByName**
> User getUserByName(username)

Get User by name

获取用户信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。

try {
    final response = api.getUserByName(username);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserByName: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 

### Return type

[**User**](User.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserCharacterCollection**
> UserCharacterCollection getUserCharacterCollection(username, characterId)

获取用户单个角色收藏信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。
final int characterId = 56; // int | 角色 ID

try {
    final response = api.getUserCharacterCollection(username, characterId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserCharacterCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 
 **characterId** | **int**| 角色 ID | 

### Return type

[**UserCharacterCollection**](UserCharacterCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserCharacterCollections**
> PagedUserCharacterCollection getUserCharacterCollections(username)

获取用户角色收藏列表

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。

try {
    final response = api.getUserCharacterCollections(username);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserCharacterCollections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 

### Return type

[**PagedUserCharacterCollection**](PagedUserCharacterCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserCollection**
> UserSubjectCollection getUserCollection(username, subjectId)

获取用户单个条目收藏

获取对应用户的收藏，查看私有收藏需要 access token

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。
final int subjectId = 56; // int | 条目 ID

try {
    final response = api.getUserCollection(username, subjectId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 
 **subjectId** | **int**| 条目 ID | 

### Return type

[**UserSubjectCollection**](UserSubjectCollection.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserCollectionsByUsername**
> PagedUserCollection getUserCollectionsByUsername(username, subjectType, type, limit, offset)

获取用户收藏

获取对应用户的收藏，查看私有收藏需要access token。

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。
final SubjectType subjectType = ; // SubjectType | 条目类型，默认为全部  具体含义见 [SubjectType](#model-SubjectType)
final SubjectCollectionType type = ; // SubjectCollectionType | 收藏类型，默认为全部  具体含义见 [CollectionType](#model-CollectionType)
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数

try {
    final response = api.getUserCollectionsByUsername(username, subjectType, type, limit, offset);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserCollectionsByUsername: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 
 **subjectType** | [**SubjectType**](.md)| 条目类型，默认为全部  具体含义见 [SubjectType](#model-SubjectType) | [optional] 
 **type** | [**SubjectCollectionType**](.md)| 收藏类型，默认为全部  具体含义见 [CollectionType](#model-CollectionType) | [optional] 
 **limit** | **int**| 分页参数 | [optional] [default to 30]
 **offset** | **int**| 分页参数 | [optional] [default to 0]

### Return type

[**PagedUserCollection**](PagedUserCollection.md)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserEpisodeCollection**
> UserEpisodeCollection getUserEpisodeCollection(episodeId)

章节收藏信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int episodeId = 56; // int | 章节 ID

try {
    final response = api.getUserEpisodeCollection(episodeId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserEpisodeCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **episodeId** | **int**| 章节 ID | 

### Return type

[**UserEpisodeCollection**](UserEpisodeCollection.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserPersonCollection**
> UserPersonCollection getUserPersonCollection(username, personId)

获取用户单个人物收藏信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。
final int personId = 56; // int | 人物 ID

try {
    final response = api.getUserPersonCollection(username, personId);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserPersonCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 
 **personId** | **int**| 人物 ID | 

### Return type

[**UserPersonCollection**](UserPersonCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserPersonCollections**
> PagedUserPersonCollection getUserPersonCollections(username)

获取用户人物收藏列表

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final String username = username_example; // String | 设置了用户名之后无法使用 UID。

try {
    final response = api.getUserPersonCollections(username);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserPersonCollections: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **username** | **String**| 设置了用户名之后无法使用 UID。 | 

### Return type

[**PagedUserPersonCollection**](PagedUserPersonCollection.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getUserSubjectEpisodeCollection**
> GetUserSubjectEpisodeCollection200Response getUserSubjectEpisodeCollection(subjectId, offset, limit, episodeType)

章节收藏信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final int offset = 56; // int | 分页参数
final int limit = 56; // int | 分页参数
final EpType episodeType = ; // EpType | 章节类型，不传则不按照章节进行筛选

try {
    final response = api.getUserSubjectEpisodeCollection(subjectId, offset, limit, episodeType);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->getUserSubjectEpisodeCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **offset** | **int**| 分页参数 | [optional] [default to 0]
 **limit** | **int**| 分页参数 | [optional] [default to 100]
 **episodeType** | [**EpType**](.md)| 章节类型，不传则不按照章节进行筛选 | [optional] 

### Return type

[**GetUserSubjectEpisodeCollection200Response**](GetUserSubjectEpisodeCollection200Response.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **newIndex**
> Index newIndex()

Create a new index

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();

try {
    final response = api.newIndex();
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->newIndex: $e\n');
}
```

### Parameters
This endpoint does not need any parameter.

### Return type

[**Index**](Index.md)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchUserCollection**
> patchUserCollection(subjectId, userSubjectCollectionModifyPayload)

修改用户单个收藏

修改条目收藏状态  由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。  PATCH 方法的所有请求体字段均可选 

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final UserSubjectCollectionModifyPayload userSubjectCollectionModifyPayload = ; // UserSubjectCollectionModifyPayload | 

try {
    api.patchUserCollection(subjectId, userSubjectCollectionModifyPayload);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->patchUserCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **userSubjectCollectionModifyPayload** | [**UserSubjectCollectionModifyPayload**](UserSubjectCollectionModifyPayload.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **patchUserSubjectEpisodeCollection**
> patchUserSubjectEpisodeCollection(subjectId, patchUserSubjectEpisodeCollectionRequest)

章节收藏信息

同时会重新计算条目的完成度 

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final PatchUserSubjectEpisodeCollectionRequest patchUserSubjectEpisodeCollectionRequest = ; // PatchUserSubjectEpisodeCollectionRequest | 

try {
    api.patchUserSubjectEpisodeCollection(subjectId, patchUserSubjectEpisodeCollectionRequest);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->patchUserSubjectEpisodeCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **patchUserSubjectEpisodeCollectionRequest** | [**PatchUserSubjectEpisodeCollectionRequest**](PatchUserSubjectEpisodeCollectionRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **postUserCollection**
> postUserCollection(subjectId, userSubjectCollectionModifyPayload)

新增或修改用户单个条目收藏

修改条目收藏状态, 如果不存在则创建，如果存在则修改  由于直接修改剧集条目的完成度可能会引起意料之外效果，只能用于修改书籍类条目的完成度。  方法的所有请求体字段均可选 

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int subjectId = 56; // int | 条目 ID
final UserSubjectCollectionModifyPayload userSubjectCollectionModifyPayload = ; // UserSubjectCollectionModifyPayload | 

try {
    api.postUserCollection(subjectId, userSubjectCollectionModifyPayload);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->postUserCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **subjectId** | **int**| 条目 ID | 
 **userSubjectCollectionModifyPayload** | [**UserSubjectCollectionModifyPayload**](UserSubjectCollectionModifyPayload.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **putUserEpisodeCollection**
> putUserEpisodeCollection(episodeId, putUserEpisodeCollectionRequest)

更新章节收藏信息

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int episodeId = 56; // int | 章节 ID
final PutUserEpisodeCollectionRequest putUserEpisodeCollectionRequest = ; // PutUserEpisodeCollectionRequest | 

try {
    api.putUserEpisodeCollection(episodeId, putUserEpisodeCollectionRequest);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->putUserEpisodeCollection: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **episodeId** | **int**| 章节 ID | 
 **putUserEpisodeCollectionRequest** | [**PutUserEpisodeCollectionRequest**](PutUserEpisodeCollectionRequest.md)|  | [optional] 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchCharacters**
> PagedCharacter searchCharacters(limit, offset, searchCharactersRequest)

角色搜索

## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动  目前支持的筛选条件包括: - `nsfw`: 使用 `include` 包含NSFW搜索结果。默认排除搜索NSFW条目。无权限情况下忽略此选项，不会返回NSFW条目。 

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数
final SearchCharactersRequest searchCharactersRequest = ; // SearchCharactersRequest | 

try {
    final response = api.searchCharacters(limit, offset, searchCharactersRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->searchCharacters: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| 分页参数 | [optional] 
 **offset** | **int**| 分页参数 | [optional] 
 **searchCharactersRequest** | [**SearchCharactersRequest**](SearchCharactersRequest.md)|  | [optional] 

### Return type

[**PagedCharacter**](PagedCharacter.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchPersons**
> PagedPerson searchPersons(limit, offset, searchPersonsRequest)

人物搜索

## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动  目前支持的筛选条件包括: - `career`: 职业，可以多次出现。`且` 关系。  不同筛选条件之间为 `且` 

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数
final SearchPersonsRequest searchPersonsRequest = ; // SearchPersonsRequest | 

try {
    final response = api.searchPersons(limit, offset, searchPersonsRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->searchPersons: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| 分页参数 | [optional] 
 **offset** | **int**| 分页参数 | [optional] 
 **searchPersonsRequest** | [**SearchPersonsRequest**](SearchPersonsRequest.md)|  | [optional] 

### Return type

[**PagedPerson**](PagedPerson.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **searchSubjects**
> PagedSubject searchSubjects(limit, offset, searchSubjectsRequest)

条目搜索

## 实验性 API， 本 schema 和实际的 API 行为都可能随时发生改动  目前支持的筛选条件包括: - `type`: 条目类型，参照 `SubjectType` enum， `或`。 - `tag`: 标签，可以多次出现。`且` 关系。 - `airdate`: 播出日期/发售日期。`且` 关系。 - `rating`: 用于搜索指定评分的条目。`且` 关系。 - `rank`: 用于搜索指定排名的条目。`且` 关系。 - `nsfw`: 使用 `include` 包含NSFW搜索结果。默认排除搜索NSFW条目。无权限情况下忽略此选项，不会返回NSFW条目。  不同筛选条件之间为 `且` 

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int limit = 56; // int | 分页参数
final int offset = 56; // int | 分页参数
final SearchSubjectsRequest searchSubjectsRequest = ; // SearchSubjectsRequest | 

try {
    final response = api.searchSubjects(limit, offset, searchSubjectsRequest);
    print(response);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->searchSubjects: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **limit** | **int**| 分页参数 | [optional] 
 **offset** | **int**| 分页参数 | [optional] 
 **searchSubjectsRequest** | [**SearchSubjectsRequest**](SearchSubjectsRequest.md)|  | [optional] 

### Return type

[**PagedSubject**](PagedSubject.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uncollectCharacterByCharacterIdAndUserId**
> uncollectCharacterByCharacterIdAndUserId(characterId)

Uncollect character for current user

为当前用户取消收藏角色

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int characterId = 56; // int | 角色 ID

try {
    api.uncollectCharacterByCharacterIdAndUserId(characterId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->uncollectCharacterByCharacterIdAndUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **characterId** | **int**| 角色 ID | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uncollectIndexByIndexIdAndUserId**
> uncollectIndexByIndexIdAndUserId(indexId)

Uncollect index for current user

为当前用户取消收藏一条目录

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int indexId = 56; // int | 目录 ID

try {
    api.uncollectIndexByIndexIdAndUserId(indexId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->uncollectIndexByIndexIdAndUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **indexId** | **int**| 目录 ID | 

### Return type

void (empty response body)

### Authorization

[HTTPBearer](../README.md#HTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **uncollectPersonByPersonIdAndUserId**
> uncollectPersonByPersonIdAndUserId(personId)

Uncollect person for current user

为当前用户取消收藏人物

### Example
```dart
import 'package:bangumi_api/api.dart';

final api = BangumiApi().getDefaultApi();
final int personId = 56; // int | 人物 ID

try {
    api.uncollectPersonByPersonIdAndUserId(personId);
} catch on DioException (e) {
    print('Exception when calling DefaultApi->uncollectPersonByPersonIdAndUserId: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **personId** | **int**| 人物 ID | 

### Return type

void (empty response body)

### Authorization

[OptionalHTTPBearer](../README.md#OptionalHTTPBearer)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

