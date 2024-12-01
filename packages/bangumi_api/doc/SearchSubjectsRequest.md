# bangumi_api.model.SearchSubjectsRequest

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**keyword** | **String** |  | 
**sort** | **String** | 排序规则  - `match` meilisearch 的默认排序，按照匹配程度 - `heat` 收藏人数 - `rank` 排名由高到低 - `score` 评分  | [optional] [default to 'match']
**filter** | [**SearchSubjectsRequestFilter**](SearchSubjectsRequestFilter.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


