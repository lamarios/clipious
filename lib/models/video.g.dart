// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['title'] as String,
      json['videoId'] as String,
      (json['videoThumbnails'] as List<dynamic>)
          .map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['description'] as String,
      json['descriptionHtml'] as String,
      json['published'] as int,
      json['publishedText'] as String,
      (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      json['viewCount'] as int,
      json['likeCount'] as int,
      json['dislikeCount'] as int,
      json['paid'] as bool,
      json['premium'] as bool,
      json['isFamilyFriendly'] as bool,
      (json['allowedRegions'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      json['genre'] as String,
      json['genreUrl'] as String,
      json['dashUrl'] as String,
      json['author'] as String?,
      json['authorUrl'] as String?,
      (json['authorThumbnails'] as List<dynamic>)
          .map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['subCountText'] as String,
      json['lengthSeconds'] as int,
      json['allowRatings'] as bool,
      (json['rating'] as num).toDouble(),
      json['isListed'] as bool,
      json['liveNow'] as bool,
      json['isUpcoming'] as bool,
      json['premiereTimestamp'] as int?,
      json['hlsUrl'] as String?,
      (json['adaptiveFormats'] as List<dynamic>)
          .map((e) => AdaptiveFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['formatStreams'] as List<dynamic>)
          .map((e) => FormatStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['authorId'] as String?,
      (json['captions'] as List<dynamic>)
          .map((e) => Caption.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['recommendedVideos'] as List<dynamic>)
          .map((e) => RecommendedVideo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
      'title': instance.title,
      'videoId': instance.videoId,
      'lengthSeconds': instance.lengthSeconds,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'videoThumbnails': instance.videoThumbnails,
      'dashUrl': instance.dashUrl,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'published': instance.published,
      'publishedText': instance.publishedText,
      'keywords': instance.keywords,
      'viewCount': instance.viewCount,
      'likeCount': instance.likeCount,
      'dislikeCount': instance.dislikeCount,
      'paid': instance.paid,
      'premium': instance.premium,
      'isFamilyFriendly': instance.isFamilyFriendly,
      'allowedRegions': instance.allowedRegions,
      'genre': instance.genre,
      'genreUrl': instance.genreUrl,
      'authorThumbnails': instance.authorThumbnails,
      'subCountText': instance.subCountText,
      'allowRatings': instance.allowRatings,
      'rating': instance.rating,
      'isListed': instance.isListed,
      'liveNow': instance.liveNow,
      'isUpcoming': instance.isUpcoming,
      'premiereTimestamp': instance.premiereTimestamp,
      'hlsUrl': instance.hlsUrl,
      'adaptiveFormats': instance.adaptiveFormats,
      'formatStreams': instance.formatStreams,
      'captions': instance.captions,
      'recommendedVideos': instance.recommendedVideos,
    };
