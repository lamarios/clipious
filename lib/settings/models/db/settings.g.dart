// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SettingsValue _$SettingsValueFromJson(Map<String, dynamic> json) =>
    SettingsValue(
      json['name'] as String,
      json['value'] as String,
    )..id = json['id'] as int;

Map<String, dynamic> _$SettingsValueToJson(SettingsValue instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
    };
