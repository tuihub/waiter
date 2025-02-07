# bangumi_api.model.GetMyself200Response

## Load the model package
```dart
import 'package:bangumi_api/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** |  | 
**username** | **String** | 唯一用户名，初始与 UID 相同，可修改一次 | 
**nickname** | **String** |  | 
**userGroup** | [**UserGroup**](UserGroup.md) |  | 
**avatar** | [**Avatar**](Avatar.md) |  | 
**sign** | **String** | 个人签名 | 
**email** | **String** | 用户绑定的邮箱地址 | 
**regTime** | [**DateTime**](DateTime.md) | 用户注册时间。比如 2017-12-03T08:51:16+08:00 | 
**timeOffset** | **int** | 用户设置的时区偏移，以小时为单位。比如 GMT+8（shanghai/beijing）为 8 | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


