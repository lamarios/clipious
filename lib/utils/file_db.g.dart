// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_db.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileDbGenericSettings _$FileDbGenericSettingsFromJson(
        Map<String, dynamic> json) =>
    FileDbGenericSettings()
      ..server = json['server'] == null
          ? null
          : Server.fromJson(json['server'] as Map<String, dynamic>)
      ..subscriptionNotifications = json['subscriptionNotifications'] as bool
      ..locale = json['locale'] as String?;

Map<String, dynamic> _$FileDbGenericSettingsToJson(
        FileDbGenericSettings instance) =>
    <String, dynamic>{
      'server': instance.server,
      'subscriptionNotifications': instance.subscriptionNotifications,
      'locale': instance.locale,
    };
