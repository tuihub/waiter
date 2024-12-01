# bangumi_api.model.EpisodeDetail

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**type** | [**EpType**](EpType.md) |  | 
**name** | **String** |  | 
**nameCn** | **String** |  | 
**sort** | **num** | 同类条目的排序和集数 | 
**ep** | **num** | 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义 | [optional] 
**airdate** | **String** |  | 
**comment** | **int** |  | 
**duration** | **String** |  | 
**desc** | **String** | 简介 | 
**disc** | **int** | 音乐曲目的碟片数 | 
**subjectId** | **int** |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


