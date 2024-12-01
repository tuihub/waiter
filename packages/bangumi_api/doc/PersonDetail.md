# bangumi_api.model.PersonDetail

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
**summary** | **String** |  | 
**locked** | **bool** |  | 
**lastModified** | [**DateTime**](DateTime.md) | currently it's latest user comment time, it will be replaced by wiki modified date in the future | 
**infobox** | [**BuiltList&lt;JsonObject&gt;**](JsonObject.md) | server parsed infobox, a map from key to string or tuple null if server infobox is not valid | [optional] 
**gender** | **String** | parsed from wiki, maybe null | [optional] 
**bloodType** | [**BloodType**](BloodType.md) | parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O` | [optional] 
**birthYear** | **int** | parsed from wiki, maybe `null` | [optional] 
**birthMon** | **int** | parsed from wiki, maybe `null` | [optional] 
**birthDay** | **int** | parsed from wiki, maybe `null` | [optional] 
**stat** | [**Stat**](Stat.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


