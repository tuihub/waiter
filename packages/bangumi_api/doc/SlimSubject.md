# bangumi_api.model.SlimSubject

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**type** | [**SubjectType**](SubjectType.md) |  | 
**name** | **String** |  | 
**nameCn** | **String** |  | 
**shortSummary** | **String** | 截短后的条目描述。 | 
**date** | **String** | air date in `YYYY-MM-DD` format | [optional] 
**images** | [**Images**](Images.md) |  | 
**volumes** | **int** | 书籍条目的册数，由旧服务端从wiki中解析 | 
**eps** | **int** | 由旧服务端从wiki中解析，对于书籍条目为`话数` | 
**collectionTotal** | **int** | 收藏人数 | 
**score** | **num** | 分数 | 
**rank** | **int** | 排名 | 
**tags** | [**List&lt;Tag&gt;**](Tag.md) | 前 10 个 tag | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


