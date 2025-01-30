// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      videoId: json['videoId'] as String,
      viewCount: (json['viewCount'] as num?)?.toInt(),
      published: _parsePublished(json['published']),
      index: (json['index'] as num?)?.toInt(),
      indexId: json['indexId'] as String?,
      publishedText: json['publishedText'] as String?,
      isUpcoming: json['isUpcoming'] as bool?,
      premiereTimestamp: (json['premiereTimestamp'] as num?)?.toInt(),
      dashUrl: json['dashUrl'] as String?,
      description: json['description'] as String?,
      descriptionHtml: json['descriptionHtml'] as String?,
      keywords: (json['keywords'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      likeCount: (json['likeCount'] as num?)?.toInt(),
      dislikeCount: (json['dislikeCount'] as num?)?.toInt(),
      paid: json['paid'] as bool?,
      premium: json['premium'] as bool?,
      isFamilyFriendly: json['isFamilyFriendly'] as bool?,
      allowedRegions: (json['allowedRegions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      genre: json['genre'] as String?,
      genreUrl: json['genreUrl'] as String?,
      authorThumbnails: (json['authorThumbnails'] as List<dynamic>?)
              ?.map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      subCountText: json['subCountText'] as String?,
      allowRatings: json['allowRatings'] as bool? ?? false,
      rating: (json['rating'] as num?)?.toDouble(),
      isListed: json['isListed'] as bool?,
      liveNow: json['liveNow'] as bool?,
      hlsUrl: json['hlsUrl'] as String?,
      adaptiveFormats: (json['adaptiveFormats'] as List<dynamic>?)
          ?.map((e) => AdaptiveFormat.fromJson(e as Map<String, dynamic>))
          .toList(),
      formatStreams: (json['formatStreams'] as List<dynamic>?)
          ?.map((e) => FormatStream.fromJson(e as Map<String, dynamic>))
          .toList(),
      captions: (json['captions'] as List<dynamic>?)
              ?.map((e) => Caption.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recommendedVideos: (json['recommendedVideos'] as List<dynamic>?)
              ?.map((e) => Video.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      title: json['title'] as String?,
      lengthSeconds: (json['lengthSeconds'] as num?)?.toInt(),
      author: json['author'] as String?,
      authorId: json['authorId'] as String?,
      authorUrl: json['authorUrl'] as String?,
      videoThumbnails: (json['videoThumbnails'] as List<dynamic>?)
              ?.map((e) => ImageObject.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      viewCountText: json['viewCountText'] as String?,
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'videoId': instance.videoId,
      'viewCount': instance.viewCount,
      'published': instance.published,
      'index': instance.index,
      'indexId': instance.indexId,
      'publishedText': instance.publishedText,
      'isUpcoming': instance.isUpcoming,
      'premiereTimestamp': instance.premiereTimestamp,
      'dashUrl': instance.dashUrl,
      'description': instance.description,
      'descriptionHtml': instance.descriptionHtml,
      'keywords': instance.keywords,
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
      'hlsUrl': instance.hlsUrl,
      'adaptiveFormats': instance.adaptiveFormats,
      'formatStreams': instance.formatStreams,
      'captions': instance.captions,
      'recommendedVideos': instance.recommendedVideos,
      'title': instance.title,
      'lengthSeconds': instance.lengthSeconds,
      'author': instance.author,
      'authorId': instance.authorId,
      'authorUrl': instance.authorUrl,
      'videoThumbnails': instance.videoThumbnails,
      'viewCountText': instance.viewCountText,
    };
