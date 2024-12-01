# bangumi_api.model.Index

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**title** | **String** |  | 
**desc** | **String** |  | 
**total** | **int** | 收录条目总数 | [optional] [default to 0]
**stat** | [**Stat**](Stat.md) | 目录评论及收藏数 | 
**createdAt** | [**DateTime**](DateTime.md) |  | 
**updatedAt** | [**DateTime**](DateTime.md) |  | 
**creator** | [**Creator**](Creator.md) |  | 
**ban** | **bool** | deprecated, always false. | 
**nsfw** | **bool** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


