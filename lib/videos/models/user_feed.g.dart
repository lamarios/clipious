// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFeed _$UserFeedFromJson(Map<String, dynamic> json) => UserFeed(
      (json['notifications'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['videos'] as List<dynamic>?)
          ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserFeedToJson(UserFeed instance) => <String, dynamic>{
      'notifications': instance.notifications,
      'videos': instance.videos,
    };
