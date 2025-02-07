# bangumi_api.model.Character

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**name** | **String** |  | 
**type** | [**CharacterType**](CharacterType.md) | 角色，机体，舰船，组织... | 
**images** | [**PersonImages**](PersonImages.md) | object with some size of images, this object maybe `null` | [optional] 
**summary** | **String** |  | 
**locked** | **bool** |  | 
**infobox** | **List&lt;Object&gt;** | server parsed infobox, a map from key to string or tuple null if server infobox is not valid | [optional] 
**gender** | **String** | parsed from wiki, maybe null | [optional] 
**bloodType** | [**BloodType**](BloodType.md) | parsed from wiki, maybe null, `1, 2, 3, 4` for `A, B, AB, O` | [optional] 
**birthYear** | **int** | parsed from wiki, maybe `null` | [optional] 
**birthMon** | **int** | parsed from wiki, maybe `null` | [optional] 
**birthDay** | **int** | parsed from wiki, maybe `null` | [optional] 
**stat** | [**Stat**](Stat.md) |  | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


