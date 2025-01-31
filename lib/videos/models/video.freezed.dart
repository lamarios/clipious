// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Video _$VideoFromJson(Map<String, dynamic> json) {
  return _Video.fromJson(json);
}

/// @nodoc
mixin _$Video {
  String get videoId => throw _privateConstructorUsedError;
  int? get viewCount => throw _privateConstructorUsedError;
  @JsonKey(fromJson: _parsePublished)
  int? get published => throw _privateConstructorUsedError;
  int? get index => throw _privateConstructorUsedError;
  String? get indexId => throw _privateConstructorUsedError;
  String? get publishedText => throw _privateConstructorUsedError;
  bool? get isUpcoming => throw _privateConstructorUsedError;
  int? get premiereTimestamp => throw _privateConstructorUsedError;
  String? get dashUrl => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get descriptionHtml => throw _privateConstructorUsedError;
  List<String> get keywords => throw _privateConstructorUsedError;
  int? get likeCount => throw _privateConstructorUsedError;
  int? get dislikeCount => throw _privateConstructorUsedError;
  bool? get paid => throw _privateConstructorUsedError;
  bool? get premium => throw _privateConstructorUsedError;
  bool? get isFamilyFriendly => throw _privateConstructorUsedError;
  List<String> get allowedRegions => throw _privateConstructorUsedError;
  String? get genre => throw _privateConstructorUsedError;
  String? get genreUrl => throw _privateConstructorUsedError;
  List<ImageObject> get authorThumbnails => throw _privateConstructorUsedError;
  String? get subCountText => throw _privateConstructorUsedError;
  bool get allowRatings => throw _privateConstructorUsedError;
  double? get rating => throw _privateConstructorUsedError;
  bool? get isListed => throw _privateConstructorUsedError;
  bool? get liveNow => throw _privateConstructorUsedError;
  String? get hlsUrl => throw _privateConstructorUsedError;
  List<AdaptiveFormat>? get adaptiveFormats =>
      throw _privateConstructorUsedError;
  List<FormatStream>? get formatStreams => throw _privateConstructorUsedError;
  List<Caption> get captions => throw _privateConstructorUsedError;
  List<Video> get recommendedVideos => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  int? get lengthSeconds => throw _privateConstructorUsedError;
  String? get author => throw _privateConstructorUsedError;
  String? get authorId => throw _privateConstructorUsedError;
  String? get authorUrl => throw _privateConstructorUsedError;
  List<ImageObject> get videoThumbnails => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get filtered => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<VideoFilter> get matchedFilters => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get filterHide => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get deArrowed => throw _privateConstructorUsedError;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get deArrowThumbnailUrl => throw _privateConstructorUsedError;
  String? get viewCountText => throw _privateConstructorUsedError;

  /// Serializes this Video to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoCopyWith<Video> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) then) =
      _$VideoCopyWithImpl<$Res, Video>;
  @useResult
  $Res call(
      {String videoId,
      int? viewCount,
      @JsonKey(fromJson: _parsePublished) int? published,
      int? index,
      String? indexId,
      String? publishedText,
      bool? isUpcoming,
      int? premiereTimestamp,
      String? dashUrl,
      String? description,
      String? descriptionHtml,
      List<String> keywords,
      int? likeCount,
      int? dislikeCount,
      bool? paid,
      bool? premium,
      bool? isFamilyFriendly,
      List<String> allowedRegions,
      String? genre,
      String? genreUrl,
      List<ImageObject> authorThumbnails,
      String? subCountText,
      bool allowRatings,
      double? rating,
      bool? isListed,
      bool? liveNow,
      String? hlsUrl,
      List<AdaptiveFormat>? adaptiveFormats,
      List<FormatStream>? formatStreams,
      List<Caption> captions,
      List<Video> recommendedVideos,
      String? title,
      int? lengthSeconds,
      String? author,
      String? authorId,
      String? authorUrl,
      List<ImageObject> videoThumbnails,
      @JsonKey(includeFromJson: false, includeToJson: false) bool filtered,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<VideoFilter> matchedFilters,
      @JsonKey(includeFromJson: false, includeToJson: false) bool filterHide,
      @JsonKey(includeFromJson: false, includeToJson: false) bool deArrowed,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? deArrowThumbnailUrl,
      String? viewCountText});
}

/// @nodoc
class _$VideoCopyWithImpl<$Res, $Val extends Video>
    implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? viewCount = freezed,
    Object? published = freezed,
    Object? index = freezed,
    Object? indexId = freezed,
    Object? publishedText = freezed,
    Object? isUpcoming = freezed,
    Object? premiereTimestamp = freezed,
    Object? dashUrl = freezed,
    Object? description = freezed,
    Object? descriptionHtml = freezed,
    Object? keywords = null,
    Object? likeCount = freezed,
    Object? dislikeCount = freezed,
    Object? paid = freezed,
    Object? premium = freezed,
    Object? isFamilyFriendly = freezed,
    Object? allowedRegions = null,
    Object? genre = freezed,
    Object? genreUrl = freezed,
    Object? authorThumbnails = null,
    Object? subCountText = freezed,
    Object? allowRatings = null,
    Object? rating = freezed,
    Object? isListed = freezed,
    Object? liveNow = freezed,
    Object? hlsUrl = freezed,
    Object? adaptiveFormats = freezed,
    Object? formatStreams = freezed,
    Object? captions = null,
    Object? recommendedVideos = null,
    Object? title = freezed,
    Object? lengthSeconds = freezed,
    Object? author = freezed,
    Object? authorId = freezed,
    Object? authorUrl = freezed,
    Object? videoThumbnails = null,
    Object? filtered = null,
    Object? matchedFilters = null,
    Object? filterHide = null,
    Object? deArrowed = null,
    Object? deArrowThumbnailUrl = freezed,
    Object? viewCountText = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      published: freezed == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      indexId: freezed == indexId
          ? _value.indexId
          : indexId // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedText: freezed == publishedText
          ? _value.publishedText
          : publishedText // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      premiereTimestamp: freezed == premiereTimestamp
          ? _value.premiereTimestamp
          : premiereTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      dashUrl: freezed == dashUrl
          ? _value.dashUrl
          : dashUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionHtml: freezed == descriptionHtml
          ? _value.descriptionHtml
          : descriptionHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dislikeCount: freezed == dislikeCount
          ? _value.dislikeCount
          : dislikeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      premium: freezed == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFamilyFriendly: freezed == isFamilyFriendly
          ? _value.isFamilyFriendly
          : isFamilyFriendly // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowedRegions: null == allowedRegions
          ? _value.allowedRegions
          : allowedRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      genreUrl: freezed == genreUrl
          ? _value.genreUrl
          : genreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _value.authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      subCountText: freezed == subCountText
          ? _value.subCountText
          : subCountText // ignore: cast_nullable_to_non_nullable
              as String?,
      allowRatings: null == allowRatings
          ? _value.allowRatings
          : allowRatings // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      isListed: freezed == isListed
          ? _value.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      liveNow: freezed == liveNow
          ? _value.liveNow
          : liveNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      hlsUrl: freezed == hlsUrl
          ? _value.hlsUrl
          : hlsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      adaptiveFormats: freezed == adaptiveFormats
          ? _value.adaptiveFormats
          : adaptiveFormats // ignore: cast_nullable_to_non_nullable
              as List<AdaptiveFormat>?,
      formatStreams: freezed == formatStreams
          ? _value.formatStreams
          : formatStreams // ignore: cast_nullable_to_non_nullable
              as List<FormatStream>?,
      captions: null == captions
          ? _value.captions
          : captions // ignore: cast_nullable_to_non_nullable
              as List<Caption>,
      recommendedVideos: null == recommendedVideos
          ? _value.recommendedVideos
          : recommendedVideos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lengthSeconds: freezed == lengthSeconds
          ? _value.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoThumbnails: null == videoThumbnails
          ? _value.videoThumbnails
          : videoThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      filtered: null == filtered
          ? _value.filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as bool,
      matchedFilters: null == matchedFilters
          ? _value.matchedFilters
          : matchedFilters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      filterHide: null == filterHide
          ? _value.filterHide
          : filterHide // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowed: null == deArrowed
          ? _value.deArrowed
          : deArrowed // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowThumbnailUrl: freezed == deArrowThumbnailUrl
          ? _value.deArrowThumbnailUrl
          : deArrowThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCountText: freezed == viewCountText
          ? _value.viewCountText
          : viewCountText // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoImplCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$$VideoImplCopyWith(
          _$VideoImpl value, $Res Function(_$VideoImpl) then) =
      __$$VideoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String videoId,
      int? viewCount,
      @JsonKey(fromJson: _parsePublished) int? published,
      int? index,
      String? indexId,
      String? publishedText,
      bool? isUpcoming,
      int? premiereTimestamp,
      String? dashUrl,
      String? description,
      String? descriptionHtml,
      List<String> keywords,
      int? likeCount,
      int? dislikeCount,
      bool? paid,
      bool? premium,
      bool? isFamilyFriendly,
      List<String> allowedRegions,
      String? genre,
      String? genreUrl,
      List<ImageObject> authorThumbnails,
      String? subCountText,
      bool allowRatings,
      double? rating,
      bool? isListed,
      bool? liveNow,
      String? hlsUrl,
      List<AdaptiveFormat>? adaptiveFormats,
      List<FormatStream>? formatStreams,
      List<Caption> captions,
      List<Video> recommendedVideos,
      String? title,
      int? lengthSeconds,
      String? author,
      String? authorId,
      String? authorUrl,
      List<ImageObject> videoThumbnails,
      @JsonKey(includeFromJson: false, includeToJson: false) bool filtered,
      @JsonKey(includeFromJson: false, includeToJson: false)
      List<VideoFilter> matchedFilters,
      @JsonKey(includeFromJson: false, includeToJson: false) bool filterHide,
      @JsonKey(includeFromJson: false, includeToJson: false) bool deArrowed,
      @JsonKey(includeFromJson: false, includeToJson: false)
      String? deArrowThumbnailUrl,
      String? viewCountText});
}

/// @nodoc
class __$$VideoImplCopyWithImpl<$Res>
    extends _$VideoCopyWithImpl<$Res, _$VideoImpl>
    implements _$$VideoImplCopyWith<$Res> {
  __$$VideoImplCopyWithImpl(
      _$VideoImpl _value, $Res Function(_$VideoImpl) _then)
      : super(_value, _then);

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? viewCount = freezed,
    Object? published = freezed,
    Object? index = freezed,
    Object? indexId = freezed,
    Object? publishedText = freezed,
    Object? isUpcoming = freezed,
    Object? premiereTimestamp = freezed,
    Object? dashUrl = freezed,
    Object? description = freezed,
    Object? descriptionHtml = freezed,
    Object? keywords = null,
    Object? likeCount = freezed,
    Object? dislikeCount = freezed,
    Object? paid = freezed,
    Object? premium = freezed,
    Object? isFamilyFriendly = freezed,
    Object? allowedRegions = null,
    Object? genre = freezed,
    Object? genreUrl = freezed,
    Object? authorThumbnails = null,
    Object? subCountText = freezed,
    Object? allowRatings = null,
    Object? rating = freezed,
    Object? isListed = freezed,
    Object? liveNow = freezed,
    Object? hlsUrl = freezed,
    Object? adaptiveFormats = freezed,
    Object? formatStreams = freezed,
    Object? captions = null,
    Object? recommendedVideos = null,
    Object? title = freezed,
    Object? lengthSeconds = freezed,
    Object? author = freezed,
    Object? authorId = freezed,
    Object? authorUrl = freezed,
    Object? videoThumbnails = null,
    Object? filtered = null,
    Object? matchedFilters = null,
    Object? filterHide = null,
    Object? deArrowed = null,
    Object? deArrowThumbnailUrl = freezed,
    Object? viewCountText = freezed,
  }) {
    return _then(_$VideoImpl(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: freezed == viewCount
          ? _value.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      published: freezed == published
          ? _value.published
          : published // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      indexId: freezed == indexId
          ? _value.indexId
          : indexId // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedText: freezed == publishedText
          ? _value.publishedText
          : publishedText // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: freezed == isUpcoming
          ? _value.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      premiereTimestamp: freezed == premiereTimestamp
          ? _value.premiereTimestamp
          : premiereTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      dashUrl: freezed == dashUrl
          ? _value.dashUrl
          : dashUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionHtml: freezed == descriptionHtml
          ? _value.descriptionHtml
          : descriptionHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: null == keywords
          ? _value._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: freezed == likeCount
          ? _value.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dislikeCount: freezed == dislikeCount
          ? _value.dislikeCount
          : dislikeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _value.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      premium: freezed == premium
          ? _value.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFamilyFriendly: freezed == isFamilyFriendly
          ? _value.isFamilyFriendly
          : isFamilyFriendly // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowedRegions: null == allowedRegions
          ? _value._allowedRegions
          : allowedRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genre: freezed == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      genreUrl: freezed == genreUrl
          ? _value.genreUrl
          : genreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _value._authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      subCountText: freezed == subCountText
          ? _value.subCountText
          : subCountText // ignore: cast_nullable_to_non_nullable
              as String?,
      allowRatings: null == allowRatings
          ? _value.allowRatings
          : allowRatings // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      isListed: freezed == isListed
          ? _value.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      liveNow: freezed == liveNow
          ? _value.liveNow
          : liveNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      hlsUrl: freezed == hlsUrl
          ? _value.hlsUrl
          : hlsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      adaptiveFormats: freezed == adaptiveFormats
          ? _value._adaptiveFormats
          : adaptiveFormats // ignore: cast_nullable_to_non_nullable
              as List<AdaptiveFormat>?,
      formatStreams: freezed == formatStreams
          ? _value._formatStreams
          : formatStreams // ignore: cast_nullable_to_non_nullable
              as List<FormatStream>?,
      captions: null == captions
          ? _value._captions
          : captions // ignore: cast_nullable_to_non_nullable
              as List<Caption>,
      recommendedVideos: null == recommendedVideos
          ? _value._recommendedVideos
          : recommendedVideos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lengthSeconds: freezed == lengthSeconds
          ? _value.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _value.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoThumbnails: null == videoThumbnails
          ? _value._videoThumbnails
          : videoThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      filtered: null == filtered
          ? _value.filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as bool,
      matchedFilters: null == matchedFilters
          ? _value._matchedFilters
          : matchedFilters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      filterHide: null == filterHide
          ? _value.filterHide
          : filterHide // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowed: null == deArrowed
          ? _value.deArrowed
          : deArrowed // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowThumbnailUrl: freezed == deArrowThumbnailUrl
          ? _value.deArrowThumbnailUrl
          : deArrowThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCountText: freezed == viewCountText
          ? _value.viewCountText
          : viewCountText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoImpl extends _Video {
  const _$VideoImpl(
      {required this.videoId,
      this.viewCount,
      @JsonKey(fromJson: _parsePublished) this.published,
      this.index,
      this.indexId,
      this.publishedText,
      this.isUpcoming,
      this.premiereTimestamp,
      this.dashUrl,
      this.description,
      this.descriptionHtml,
      final List<String> keywords = const [],
      this.likeCount,
      this.dislikeCount,
      this.paid,
      this.premium,
      this.isFamilyFriendly,
      final List<String> allowedRegions = const [],
      this.genre,
      this.genreUrl,
      final List<ImageObject> authorThumbnails = const [],
      this.subCountText,
      this.allowRatings = false,
      this.rating,
      this.isListed,
      this.liveNow,
      this.hlsUrl,
      final List<AdaptiveFormat>? adaptiveFormats,
      final List<FormatStream>? formatStreams,
      final List<Caption> captions = const [],
      final List<Video> recommendedVideos = const [],
      this.title,
      this.lengthSeconds,
      this.author,
      this.authorId,
      this.authorUrl,
      final List<ImageObject> videoThumbnails = const [],
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.filtered = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<VideoFilter> matchedFilters = const [],
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.filterHide = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.deArrowed = false,
      @JsonKey(includeFromJson: false, includeToJson: false)
      this.deArrowThumbnailUrl,
      this.viewCountText})
      : _keywords = keywords,
        _allowedRegions = allowedRegions,
        _authorThumbnails = authorThumbnails,
        _adaptiveFormats = adaptiveFormats,
        _formatStreams = formatStreams,
        _captions = captions,
        _recommendedVideos = recommendedVideos,
        _videoThumbnails = videoThumbnails,
        _matchedFilters = matchedFilters,
        super._();

  factory _$VideoImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoImplFromJson(json);

  @override
  final String videoId;
  @override
  final int? viewCount;
  @override
  @JsonKey(fromJson: _parsePublished)
  final int? published;
  @override
  final int? index;
  @override
  final String? indexId;
  @override
  final String? publishedText;
  @override
  final bool? isUpcoming;
  @override
  final int? premiereTimestamp;
  @override
  final String? dashUrl;
  @override
  final String? description;
  @override
  final String? descriptionHtml;
  final List<String> _keywords;
  @override
  @JsonKey()
  List<String> get keywords {
    if (_keywords is EqualUnmodifiableListView) return _keywords;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keywords);
  }

  @override
  final int? likeCount;
  @override
  final int? dislikeCount;
  @override
  final bool? paid;
  @override
  final bool? premium;
  @override
  final bool? isFamilyFriendly;
  final List<String> _allowedRegions;
  @override
  @JsonKey()
  List<String> get allowedRegions {
    if (_allowedRegions is EqualUnmodifiableListView) return _allowedRegions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allowedRegions);
  }

  @override
  final String? genre;
  @override
  final String? genreUrl;
  final List<ImageObject> _authorThumbnails;
  @override
  @JsonKey()
  List<ImageObject> get authorThumbnails {
    if (_authorThumbnails is EqualUnmodifiableListView)
      return _authorThumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authorThumbnails);
  }

  @override
  final String? subCountText;
  @override
  @JsonKey()
  final bool allowRatings;
  @override
  final double? rating;
  @override
  final bool? isListed;
  @override
  final bool? liveNow;
  @override
  final String? hlsUrl;
  final List<AdaptiveFormat>? _adaptiveFormats;
  @override
  List<AdaptiveFormat>? get adaptiveFormats {
    final value = _adaptiveFormats;
    if (value == null) return null;
    if (_adaptiveFormats is EqualUnmodifiableListView) return _adaptiveFormats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<FormatStream>? _formatStreams;
  @override
  List<FormatStream>? get formatStreams {
    final value = _formatStreams;
    if (value == null) return null;
    if (_formatStreams is EqualUnmodifiableListView) return _formatStreams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Caption> _captions;
  @override
  @JsonKey()
  List<Caption> get captions {
    if (_captions is EqualUnmodifiableListView) return _captions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_captions);
  }

  final List<Video> _recommendedVideos;
  @override
  @JsonKey()
  List<Video> get recommendedVideos {
    if (_recommendedVideos is EqualUnmodifiableListView)
      return _recommendedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recommendedVideos);
  }

  @override
  final String? title;
  @override
  final int? lengthSeconds;
  @override
  final String? author;
  @override
  final String? authorId;
  @override
  final String? authorUrl;
  final List<ImageObject> _videoThumbnails;
  @override
  @JsonKey()
  List<ImageObject> get videoThumbnails {
    if (_videoThumbnails is EqualUnmodifiableListView) return _videoThumbnails;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoThumbnails);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool filtered;
  final List<VideoFilter> _matchedFilters;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<VideoFilter> get matchedFilters {
    if (_matchedFilters is EqualUnmodifiableListView) return _matchedFilters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedFilters);
  }

  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool filterHide;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final bool deArrowed;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? deArrowThumbnailUrl;
  @override
  final String? viewCountText;

  @override
  String toString() {
    return 'Video(videoId: $videoId, viewCount: $viewCount, published: $published, index: $index, indexId: $indexId, publishedText: $publishedText, isUpcoming: $isUpcoming, premiereTimestamp: $premiereTimestamp, dashUrl: $dashUrl, description: $description, descriptionHtml: $descriptionHtml, keywords: $keywords, likeCount: $likeCount, dislikeCount: $dislikeCount, paid: $paid, premium: $premium, isFamilyFriendly: $isFamilyFriendly, allowedRegions: $allowedRegions, genre: $genre, genreUrl: $genreUrl, authorThumbnails: $authorThumbnails, subCountText: $subCountText, allowRatings: $allowRatings, rating: $rating, isListed: $isListed, liveNow: $liveNow, hlsUrl: $hlsUrl, adaptiveFormats: $adaptiveFormats, formatStreams: $formatStreams, captions: $captions, recommendedVideos: $recommendedVideos, title: $title, lengthSeconds: $lengthSeconds, author: $author, authorId: $authorId, authorUrl: $authorUrl, videoThumbnails: $videoThumbnails, filtered: $filtered, matchedFilters: $matchedFilters, filterHide: $filterHide, deArrowed: $deArrowed, deArrowThumbnailUrl: $deArrowThumbnailUrl, viewCountText: $viewCountText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.viewCount, viewCount) ||
                other.viewCount == viewCount) &&
            (identical(other.published, published) ||
                other.published == published) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.indexId, indexId) || other.indexId == indexId) &&
            (identical(other.publishedText, publishedText) ||
                other.publishedText == publishedText) &&
            (identical(other.isUpcoming, isUpcoming) ||
                other.isUpcoming == isUpcoming) &&
            (identical(other.premiereTimestamp, premiereTimestamp) ||
                other.premiereTimestamp == premiereTimestamp) &&
            (identical(other.dashUrl, dashUrl) || other.dashUrl == dashUrl) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.descriptionHtml, descriptionHtml) ||
                other.descriptionHtml == descriptionHtml) &&
            const DeepCollectionEquality().equals(other._keywords, _keywords) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.dislikeCount, dislikeCount) ||
                other.dislikeCount == dislikeCount) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.isFamilyFriendly, isFamilyFriendly) ||
                other.isFamilyFriendly == isFamilyFriendly) &&
            const DeepCollectionEquality()
                .equals(other._allowedRegions, _allowedRegions) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.genreUrl, genreUrl) ||
                other.genreUrl == genreUrl) &&
            const DeepCollectionEquality()
                .equals(other._authorThumbnails, _authorThumbnails) &&
            (identical(other.subCountText, subCountText) ||
                other.subCountText == subCountText) &&
            (identical(other.allowRatings, allowRatings) ||
                other.allowRatings == allowRatings) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.isListed, isListed) ||
                other.isListed == isListed) &&
            (identical(other.liveNow, liveNow) || other.liveNow == liveNow) &&
            (identical(other.hlsUrl, hlsUrl) || other.hlsUrl == hlsUrl) &&
            const DeepCollectionEquality()
                .equals(other._adaptiveFormats, _adaptiveFormats) &&
            const DeepCollectionEquality()
                .equals(other._formatStreams, _formatStreams) &&
            const DeepCollectionEquality().equals(other._captions, _captions) &&
            const DeepCollectionEquality()
                .equals(other._recommendedVideos, _recommendedVideos) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lengthSeconds, lengthSeconds) ||
                other.lengthSeconds == lengthSeconds) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            const DeepCollectionEquality()
                .equals(other._videoThumbnails, _videoThumbnails) &&
            (identical(other.filtered, filtered) ||
                other.filtered == filtered) &&
            const DeepCollectionEquality()
                .equals(other._matchedFilters, _matchedFilters) &&
            (identical(other.filterHide, filterHide) ||
                other.filterHide == filterHide) &&
            (identical(other.deArrowed, deArrowed) ||
                other.deArrowed == deArrowed) &&
            (identical(other.deArrowThumbnailUrl, deArrowThumbnailUrl) ||
                other.deArrowThumbnailUrl == deArrowThumbnailUrl) &&
            (identical(other.viewCountText, viewCountText) ||
                other.viewCountText == viewCountText));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        videoId,
        viewCount,
        published,
        index,
        indexId,
        publishedText,
        isUpcoming,
        premiereTimestamp,
        dashUrl,
        description,
        descriptionHtml,
        const DeepCollectionEquality().hash(_keywords),
        likeCount,
        dislikeCount,
        paid,
        premium,
        isFamilyFriendly,
        const DeepCollectionEquality().hash(_allowedRegions),
        genre,
        genreUrl,
        const DeepCollectionEquality().hash(_authorThumbnails),
        subCountText,
        allowRatings,
        rating,
        isListed,
        liveNow,
        hlsUrl,
        const DeepCollectionEquality().hash(_adaptiveFormats),
        const DeepCollectionEquality().hash(_formatStreams),
        const DeepCollectionEquality().hash(_captions),
        const DeepCollectionEquality().hash(_recommendedVideos),
        title,
        lengthSeconds,
        author,
        authorId,
        authorUrl,
        const DeepCollectionEquality().hash(_videoThumbnails),
        filtered,
        const DeepCollectionEquality().hash(_matchedFilters),
        filterHide,
        deArrowed,
        deArrowThumbnailUrl,
        viewCountText
      ]);

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoImplCopyWith<_$VideoImpl> get copyWith =>
      __$$VideoImplCopyWithImpl<_$VideoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoImplToJson(
      this,
    );
  }
}

abstract class _Video extends Video implements ShareLinks, IdedVideo {
  const factory _Video(
      {required final String videoId,
      final int? viewCount,
      @JsonKey(fromJson: _parsePublished) final int? published,
      final int? index,
      final String? indexId,
      final String? publishedText,
      final bool? isUpcoming,
      final int? premiereTimestamp,
      final String? dashUrl,
      final String? description,
      final String? descriptionHtml,
      final List<String> keywords,
      final int? likeCount,
      final int? dislikeCount,
      final bool? paid,
      final bool? premium,
      final bool? isFamilyFriendly,
      final List<String> allowedRegions,
      final String? genre,
      final String? genreUrl,
      final List<ImageObject> authorThumbnails,
      final String? subCountText,
      final bool allowRatings,
      final double? rating,
      final bool? isListed,
      final bool? liveNow,
      final String? hlsUrl,
      final List<AdaptiveFormat>? adaptiveFormats,
      final List<FormatStream>? formatStreams,
      final List<Caption> captions,
      final List<Video> recommendedVideos,
      final String? title,
      final int? lengthSeconds,
      final String? author,
      final String? authorId,
      final String? authorUrl,
      final List<ImageObject> videoThumbnails,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool filtered,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final List<VideoFilter> matchedFilters,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool filterHide,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final bool deArrowed,
      @JsonKey(includeFromJson: false, includeToJson: false)
      final String? deArrowThumbnailUrl,
      final String? viewCountText}) = _$VideoImpl;
  const _Video._() : super._();

  factory _Video.fromJson(Map<String, dynamic> json) = _$VideoImpl.fromJson;

  @override
  String get videoId;
  @override
  int? get viewCount;
  @override
  @JsonKey(fromJson: _parsePublished)
  int? get published;
  @override
  int? get index;
  @override
  String? get indexId;
  @override
  String? get publishedText;
  @override
  bool? get isUpcoming;
  @override
  int? get premiereTimestamp;
  @override
  String? get dashUrl;
  @override
  String? get description;
  @override
  String? get descriptionHtml;
  @override
  List<String> get keywords;
  @override
  int? get likeCount;
  @override
  int? get dislikeCount;
  @override
  bool? get paid;
  @override
  bool? get premium;
  @override
  bool? get isFamilyFriendly;
  @override
  List<String> get allowedRegions;
  @override
  String? get genre;
  @override
  String? get genreUrl;
  @override
  List<ImageObject> get authorThumbnails;
  @override
  String? get subCountText;
  @override
  bool get allowRatings;
  @override
  double? get rating;
  @override
  bool? get isListed;
  @override
  bool? get liveNow;
  @override
  String? get hlsUrl;
  @override
  List<AdaptiveFormat>? get adaptiveFormats;
  @override
  List<FormatStream>? get formatStreams;
  @override
  List<Caption> get captions;
  @override
  List<Video> get recommendedVideos;
  @override
  String? get title;
  @override
  int? get lengthSeconds;
  @override
  String? get author;
  @override
  String? get authorId;
  @override
  String? get authorUrl;
  @override
  List<ImageObject> get videoThumbnails;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get filtered;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<VideoFilter> get matchedFilters;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get filterHide;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get deArrowed;
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get deArrowThumbnailUrl;
  @override
  String? get viewCountText;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoImplCopyWith<_$VideoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
