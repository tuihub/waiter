# bangumi_api.model.SearchSubjectsRequestFilter

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | [**List&lt;SubjectType&gt;**](SubjectType.md) | 条目类型，参照 `SubjectType` enum，多值之间为 `或` 的关系。 | [optional] 
**metaTags** | **List&lt;String&gt;** | 公共标签。多个值之间为 `且` 关系。可以用 `-` 排除标签。比如 `-科幻` 可以排除科幻标签。 | [optional] 
**tag** | **List&lt;String&gt;** | 标签，可以多次出现。多值之间为 `且` 关系。 | [optional] 
**airDate** | **List&lt;String&gt;** | 播出日期/发售日期，日期必需为 `YYYY-MM-DD` 格式。多值之间为 `且` 关系。 | [optional] 
**rating** | **List&lt;String&gt;** | 用于搜索指定评分的条目，多值之间为 `且` 关系。 | [optional] 
**rank** | **List&lt;String&gt;** | 用于搜索指定排名的条目，多值之间为 `且` 关系。 | [optional] 
**nsfw** | **bool** | 无权限的用户会直接忽略此字段，不会返回R18条目。  默认或者 `null` 会返回包含 R18 的所有搜索结果。  `true` 只会返回 R18 条目。  `false` 只会返回非 R18 条目。  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


