# bangumi_api.model.UserSubjectCollectionModifyPayload

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**type** | [**SubjectCollectionType**](SubjectCollectionType.md) | 修改条目收藏类型 | [optional] 
**rate** | **int** | 评分，`0` 表示删除评分 | [optional] 
**epStatus** | **int** | 只能用于修改书籍条目进度 | [optional] 
**volStatus** | **int** | 只能用于修改书籍条目进度 | [optional] 
**comment** | **String** | 评价 | [optional] 
**private** | **bool** | 仅自己可见 | [optional] 
**tags** | **List&lt;String&gt;** | 不传或者 `null` 都会被忽略，传 `[]` 则会删除所有 tag。 | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


