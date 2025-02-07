# bangumi_api.model.UserSubjectCollection

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**subjectId** | **int** |  | 
**subjectType** | [**SubjectType**](SubjectType.md) |  | 
**rate** | **int** |  | 
**type** | [**SubjectCollectionType**](SubjectCollectionType.md) |  | 
**comment** | **String** |  | [optional] 
**tags** | **List&lt;String&gt;** |  | 
**epStatus** | **int** |  | 
**volStatus** | **int** |  | 
**updatedAt** | [**DateTime**](DateTime.md) | 本时间并不代表条目的收藏时间。修改评分，评价，章节观看状态等收藏信息时未更新此时间是一个 bug。请不要依赖此特性 | 
**private** | **bool** |  | 
**subject** | [**SlimSubject**](SlimSubject.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


