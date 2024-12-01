# bangumi_api.model.Episode

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**type** | **int** | `0` 本篇，`1` SP，`2` OP，`3` ED | 
**name** | **String** |  | 
**nameCn** | **String** |  | 
**sort** | **num** | 同类条目的排序和集数 | 
**ep** | **num** | 条目内的集数, 从`1`开始。非本篇剧集的此字段无意义 | [optional] 
**airdate** | **String** |  | 
**comment** | **int** |  | 
**duration** | **String** | 维基人填写的原始时长 | 
**desc** | **String** | 简介 | 
**disc** | **int** | 音乐曲目的碟片数 | 
**durationSeconds** | **int** | 服务器解析的时长，无法解析时为 `0` | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


