# bangumi_api.model.RelatedPerson

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**name** | **String** |  | 
**type** | [**PersonType**](PersonType.md) | `1`, `2`, `3` 表示 `个人`, `公司`, `组合` | 
**career** | [**BuiltList&lt;PersonCareer&gt;**](PersonCareer.md) |  | 
**images** | [**PersonImages**](PersonImages.md) | object with some size of images, this object maybe `null` | [optional] 
**relation** | **String** |  | 
**eps** | **String** | 参与章节/曲目 | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


