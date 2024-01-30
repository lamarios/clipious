// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_logs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppLog _$AppLogFromJson(Map<String, dynamic> json) => AppLog(
      level: json['level'] as String,
      logger: json['logger'] as String,
      time: DateTime.parse(json['time'] as String),
      message: json['message'] as String?,
      stacktrace: json['stacktrace'] as String?,
    );

Map<String, dynamic> _$AppLogToJson(AppLog instance) => <String, dynamic>{
      'level': instance.level,
      'logger': instance.logger,
      'time': instance.time.toIso8601String(),
      'stacktrace': instance.stacktrace,
      'message': instance.message,
    };
