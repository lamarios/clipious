// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Video {
  String get videoId;
  int? get viewCount;
  @JsonKey(fromJson: _parsePublished)
  int? get published;
  int? get index;
  String? get indexId;
  String? get publishedText;
  bool? get isUpcoming;
  int? get premiereTimestamp;
  String? get dashUrl;
  String? get description;
  String? get descriptionHtml;
  List<String> get keywords;
  int? get likeCount;
  int? get dislikeCount;
  bool? get paid;
  bool? get premium;
  bool? get isFamilyFriendly;
  List<String> get allowedRegions;
  String? get genre;
  String? get genreUrl;
  List<ImageObject> get authorThumbnails;
  String? get subCountText;
  bool get allowRatings;
  double? get rating;
  bool? get isListed;
  bool? get liveNow;
  String? get hlsUrl;
  List<AdaptiveFormat>? get adaptiveFormats;
  List<FormatStream>? get formatStreams;
  List<Caption> get captions;
  List<Video> get recommendedVideos;
  String? get title;
  int? get lengthSeconds;
  String? get author;
  String? get authorId;
  String? get authorUrl;
  List<ImageObject> get videoThumbnails;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get filtered;
  @JsonKey(includeFromJson: false, includeToJson: false)
  List<VideoFilter> get matchedFilters;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get filterHide;
  @JsonKey(includeFromJson: false, includeToJson: false)
  bool get deArrowed;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? get deArrowThumbnailUrl;
  String? get viewCountText;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoCopyWith<Video> get copyWith =>
      _$VideoCopyWithImpl<Video>(this as Video, _$identity);

  /// Serializes this Video to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Video &&
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
            const DeepCollectionEquality().equals(other.keywords, keywords) &&
            (identical(other.likeCount, likeCount) ||
                other.likeCount == likeCount) &&
            (identical(other.dislikeCount, dislikeCount) ||
                other.dislikeCount == dislikeCount) &&
            (identical(other.paid, paid) || other.paid == paid) &&
            (identical(other.premium, premium) || other.premium == premium) &&
            (identical(other.isFamilyFriendly, isFamilyFriendly) ||
                other.isFamilyFriendly == isFamilyFriendly) &&
            const DeepCollectionEquality()
                .equals(other.allowedRegions, allowedRegions) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.genreUrl, genreUrl) ||
                other.genreUrl == genreUrl) &&
            const DeepCollectionEquality()
                .equals(other.authorThumbnails, authorThumbnails) &&
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
                .equals(other.adaptiveFormats, adaptiveFormats) &&
            const DeepCollectionEquality()
                .equals(other.formatStreams, formatStreams) &&
            const DeepCollectionEquality().equals(other.captions, captions) &&
            const DeepCollectionEquality()
                .equals(other.recommendedVideos, recommendedVideos) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.lengthSeconds, lengthSeconds) ||
                other.lengthSeconds == lengthSeconds) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorUrl, authorUrl) ||
                other.authorUrl == authorUrl) &&
            const DeepCollectionEquality()
                .equals(other.videoThumbnails, videoThumbnails) &&
            (identical(other.filtered, filtered) ||
                other.filtered == filtered) &&
            const DeepCollectionEquality()
                .equals(other.matchedFilters, matchedFilters) &&
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
        const DeepCollectionEquality().hash(keywords),
        likeCount,
        dislikeCount,
        paid,
        premium,
        isFamilyFriendly,
        const DeepCollectionEquality().hash(allowedRegions),
        genre,
        genreUrl,
        const DeepCollectionEquality().hash(authorThumbnails),
        subCountText,
        allowRatings,
        rating,
        isListed,
        liveNow,
        hlsUrl,
        const DeepCollectionEquality().hash(adaptiveFormats),
        const DeepCollectionEquality().hash(formatStreams),
        const DeepCollectionEquality().hash(captions),
        const DeepCollectionEquality().hash(recommendedVideos),
        title,
        lengthSeconds,
        author,
        authorId,
        authorUrl,
        const DeepCollectionEquality().hash(videoThumbnails),
        filtered,
        const DeepCollectionEquality().hash(matchedFilters),
        filterHide,
        deArrowed,
        deArrowThumbnailUrl,
        viewCountText
      ]);

  @override
  String toString() {
    return 'Video(videoId: $videoId, viewCount: $viewCount, published: $published, index: $index, indexId: $indexId, publishedText: $publishedText, isUpcoming: $isUpcoming, premiereTimestamp: $premiereTimestamp, dashUrl: $dashUrl, description: $description, descriptionHtml: $descriptionHtml, keywords: $keywords, likeCount: $likeCount, dislikeCount: $dislikeCount, paid: $paid, premium: $premium, isFamilyFriendly: $isFamilyFriendly, allowedRegions: $allowedRegions, genre: $genre, genreUrl: $genreUrl, authorThumbnails: $authorThumbnails, subCountText: $subCountText, allowRatings: $allowRatings, rating: $rating, isListed: $isListed, liveNow: $liveNow, hlsUrl: $hlsUrl, adaptiveFormats: $adaptiveFormats, formatStreams: $formatStreams, captions: $captions, recommendedVideos: $recommendedVideos, title: $title, lengthSeconds: $lengthSeconds, author: $author, authorId: $authorId, authorUrl: $authorUrl, videoThumbnails: $videoThumbnails, filtered: $filtered, matchedFilters: $matchedFilters, filterHide: $filterHide, deArrowed: $deArrowed, deArrowThumbnailUrl: $deArrowThumbnailUrl, viewCountText: $viewCountText)';
  }
}

/// @nodoc
abstract mixin class $VideoCopyWith<$Res> {
  factory $VideoCopyWith(Video value, $Res Function(Video) _then) =
      _$VideoCopyWithImpl;
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
class _$VideoCopyWithImpl<$Res> implements $VideoCopyWith<$Res> {
  _$VideoCopyWithImpl(this._self, this._then);

  final Video _self;
  final $Res Function(Video) _then;

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
    return _then(_self.copyWith(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: freezed == viewCount
          ? _self.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      published: freezed == published
          ? _self.published
          : published // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      indexId: freezed == indexId
          ? _self.indexId
          : indexId // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedText: freezed == publishedText
          ? _self.publishedText
          : publishedText // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: freezed == isUpcoming
          ? _self.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      premiereTimestamp: freezed == premiereTimestamp
          ? _self.premiereTimestamp
          : premiereTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      dashUrl: freezed == dashUrl
          ? _self.dashUrl
          : dashUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionHtml: freezed == descriptionHtml
          ? _self.descriptionHtml
          : descriptionHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: null == keywords
          ? _self.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: freezed == likeCount
          ? _self.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dislikeCount: freezed == dislikeCount
          ? _self.dislikeCount
          : dislikeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _self.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      premium: freezed == premium
          ? _self.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFamilyFriendly: freezed == isFamilyFriendly
          ? _self.isFamilyFriendly
          : isFamilyFriendly // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowedRegions: null == allowedRegions
          ? _self.allowedRegions
          : allowedRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genre: freezed == genre
          ? _self.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      genreUrl: freezed == genreUrl
          ? _self.genreUrl
          : genreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _self.authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      subCountText: freezed == subCountText
          ? _self.subCountText
          : subCountText // ignore: cast_nullable_to_non_nullable
              as String?,
      allowRatings: null == allowRatings
          ? _self.allowRatings
          : allowRatings // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      isListed: freezed == isListed
          ? _self.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      liveNow: freezed == liveNow
          ? _self.liveNow
          : liveNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      hlsUrl: freezed == hlsUrl
          ? _self.hlsUrl
          : hlsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      adaptiveFormats: freezed == adaptiveFormats
          ? _self.adaptiveFormats
          : adaptiveFormats // ignore: cast_nullable_to_non_nullable
              as List<AdaptiveFormat>?,
      formatStreams: freezed == formatStreams
          ? _self.formatStreams
          : formatStreams // ignore: cast_nullable_to_non_nullable
              as List<FormatStream>?,
      captions: null == captions
          ? _self.captions
          : captions // ignore: cast_nullable_to_non_nullable
              as List<Caption>,
      recommendedVideos: null == recommendedVideos
          ? _self.recommendedVideos
          : recommendedVideos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lengthSeconds: freezed == lengthSeconds
          ? _self.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _self.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoThumbnails: null == videoThumbnails
          ? _self.videoThumbnails
          : videoThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      filtered: null == filtered
          ? _self.filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as bool,
      matchedFilters: null == matchedFilters
          ? _self.matchedFilters
          : matchedFilters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      filterHide: null == filterHide
          ? _self.filterHide
          : filterHide // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowed: null == deArrowed
          ? _self.deArrowed
          : deArrowed // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowThumbnailUrl: freezed == deArrowThumbnailUrl
          ? _self.deArrowThumbnailUrl
          : deArrowThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCountText: freezed == viewCountText
          ? _self.viewCountText
          : viewCountText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [Video].
extension VideoPatterns on Video {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Video value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Video() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Video value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Video():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Video value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Video() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String videoId,
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
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool filtered,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<VideoFilter> matchedFilters,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool filterHide,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool deArrowed,
            @JsonKey(includeFromJson: false, includeToJson: false)
            String? deArrowThumbnailUrl,
            String? viewCountText)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Video() when $default != null:
        return $default(
            _that.videoId,
            _that.viewCount,
            _that.published,
            _that.index,
            _that.indexId,
            _that.publishedText,
            _that.isUpcoming,
            _that.premiereTimestamp,
            _that.dashUrl,
            _that.description,
            _that.descriptionHtml,
            _that.keywords,
            _that.likeCount,
            _that.dislikeCount,
            _that.paid,
            _that.premium,
            _that.isFamilyFriendly,
            _that.allowedRegions,
            _that.genre,
            _that.genreUrl,
            _that.authorThumbnails,
            _that.subCountText,
            _that.allowRatings,
            _that.rating,
            _that.isListed,
            _that.liveNow,
            _that.hlsUrl,
            _that.adaptiveFormats,
            _that.formatStreams,
            _that.captions,
            _that.recommendedVideos,
            _that.title,
            _that.lengthSeconds,
            _that.author,
            _that.authorId,
            _that.authorUrl,
            _that.videoThumbnails,
            _that.filtered,
            _that.matchedFilters,
            _that.filterHide,
            _that.deArrowed,
            _that.deArrowThumbnailUrl,
            _that.viewCountText);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String videoId,
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
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool filtered,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<VideoFilter> matchedFilters,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool filterHide,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool deArrowed,
            @JsonKey(includeFromJson: false, includeToJson: false)
            String? deArrowThumbnailUrl,
            String? viewCountText)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Video():
        return $default(
            _that.videoId,
            _that.viewCount,
            _that.published,
            _that.index,
            _that.indexId,
            _that.publishedText,
            _that.isUpcoming,
            _that.premiereTimestamp,
            _that.dashUrl,
            _that.description,
            _that.descriptionHtml,
            _that.keywords,
            _that.likeCount,
            _that.dislikeCount,
            _that.paid,
            _that.premium,
            _that.isFamilyFriendly,
            _that.allowedRegions,
            _that.genre,
            _that.genreUrl,
            _that.authorThumbnails,
            _that.subCountText,
            _that.allowRatings,
            _that.rating,
            _that.isListed,
            _that.liveNow,
            _that.hlsUrl,
            _that.adaptiveFormats,
            _that.formatStreams,
            _that.captions,
            _that.recommendedVideos,
            _that.title,
            _that.lengthSeconds,
            _that.author,
            _that.authorId,
            _that.authorUrl,
            _that.videoThumbnails,
            _that.filtered,
            _that.matchedFilters,
            _that.filterHide,
            _that.deArrowed,
            _that.deArrowThumbnailUrl,
            _that.viewCountText);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String videoId,
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
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool filtered,
            @JsonKey(includeFromJson: false, includeToJson: false)
            List<VideoFilter> matchedFilters,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool filterHide,
            @JsonKey(includeFromJson: false, includeToJson: false)
            bool deArrowed,
            @JsonKey(includeFromJson: false, includeToJson: false)
            String? deArrowThumbnailUrl,
            String? viewCountText)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Video() when $default != null:
        return $default(
            _that.videoId,
            _that.viewCount,
            _that.published,
            _that.index,
            _that.indexId,
            _that.publishedText,
            _that.isUpcoming,
            _that.premiereTimestamp,
            _that.dashUrl,
            _that.description,
            _that.descriptionHtml,
            _that.keywords,
            _that.likeCount,
            _that.dislikeCount,
            _that.paid,
            _that.premium,
            _that.isFamilyFriendly,
            _that.allowedRegions,
            _that.genre,
            _that.genreUrl,
            _that.authorThumbnails,
            _that.subCountText,
            _that.allowRatings,
            _that.rating,
            _that.isListed,
            _that.liveNow,
            _that.hlsUrl,
            _that.adaptiveFormats,
            _that.formatStreams,
            _that.captions,
            _that.recommendedVideos,
            _that.title,
            _that.lengthSeconds,
            _that.author,
            _that.authorId,
            _that.authorUrl,
            _that.videoThumbnails,
            _that.filtered,
            _that.matchedFilters,
            _that.filterHide,
            _that.deArrowed,
            _that.deArrowThumbnailUrl,
            _that.viewCountText);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Video extends Video implements ShareLinks, IdedVideo {
  const _Video(
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
  factory _Video.fromJson(Map<String, dynamic> json) => _$VideoFromJson(json);

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

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoCopyWith<_Video> get copyWith =>
      __$VideoCopyWithImpl<_Video>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VideoToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Video &&
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

  @override
  String toString() {
    return 'Video(videoId: $videoId, viewCount: $viewCount, published: $published, index: $index, indexId: $indexId, publishedText: $publishedText, isUpcoming: $isUpcoming, premiereTimestamp: $premiereTimestamp, dashUrl: $dashUrl, description: $description, descriptionHtml: $descriptionHtml, keywords: $keywords, likeCount: $likeCount, dislikeCount: $dislikeCount, paid: $paid, premium: $premium, isFamilyFriendly: $isFamilyFriendly, allowedRegions: $allowedRegions, genre: $genre, genreUrl: $genreUrl, authorThumbnails: $authorThumbnails, subCountText: $subCountText, allowRatings: $allowRatings, rating: $rating, isListed: $isListed, liveNow: $liveNow, hlsUrl: $hlsUrl, adaptiveFormats: $adaptiveFormats, formatStreams: $formatStreams, captions: $captions, recommendedVideos: $recommendedVideos, title: $title, lengthSeconds: $lengthSeconds, author: $author, authorId: $authorId, authorUrl: $authorUrl, videoThumbnails: $videoThumbnails, filtered: $filtered, matchedFilters: $matchedFilters, filterHide: $filterHide, deArrowed: $deArrowed, deArrowThumbnailUrl: $deArrowThumbnailUrl, viewCountText: $viewCountText)';
  }
}

/// @nodoc
abstract mixin class _$VideoCopyWith<$Res> implements $VideoCopyWith<$Res> {
  factory _$VideoCopyWith(_Video value, $Res Function(_Video) _then) =
      __$VideoCopyWithImpl;
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
class __$VideoCopyWithImpl<$Res> implements _$VideoCopyWith<$Res> {
  __$VideoCopyWithImpl(this._self, this._then);

  final _Video _self;
  final $Res Function(_Video) _then;

  /// Create a copy of Video
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_Video(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      viewCount: freezed == viewCount
          ? _self.viewCount
          : viewCount // ignore: cast_nullable_to_non_nullable
              as int?,
      published: freezed == published
          ? _self.published
          : published // ignore: cast_nullable_to_non_nullable
              as int?,
      index: freezed == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      indexId: freezed == indexId
          ? _self.indexId
          : indexId // ignore: cast_nullable_to_non_nullable
              as String?,
      publishedText: freezed == publishedText
          ? _self.publishedText
          : publishedText // ignore: cast_nullable_to_non_nullable
              as String?,
      isUpcoming: freezed == isUpcoming
          ? _self.isUpcoming
          : isUpcoming // ignore: cast_nullable_to_non_nullable
              as bool?,
      premiereTimestamp: freezed == premiereTimestamp
          ? _self.premiereTimestamp
          : premiereTimestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      dashUrl: freezed == dashUrl
          ? _self.dashUrl
          : dashUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      descriptionHtml: freezed == descriptionHtml
          ? _self.descriptionHtml
          : descriptionHtml // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: null == keywords
          ? _self._keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as List<String>,
      likeCount: freezed == likeCount
          ? _self.likeCount
          : likeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      dislikeCount: freezed == dislikeCount
          ? _self.dislikeCount
          : dislikeCount // ignore: cast_nullable_to_non_nullable
              as int?,
      paid: freezed == paid
          ? _self.paid
          : paid // ignore: cast_nullable_to_non_nullable
              as bool?,
      premium: freezed == premium
          ? _self.premium
          : premium // ignore: cast_nullable_to_non_nullable
              as bool?,
      isFamilyFriendly: freezed == isFamilyFriendly
          ? _self.isFamilyFriendly
          : isFamilyFriendly // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowedRegions: null == allowedRegions
          ? _self._allowedRegions
          : allowedRegions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genre: freezed == genre
          ? _self.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String?,
      genreUrl: freezed == genreUrl
          ? _self.genreUrl
          : genreUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      authorThumbnails: null == authorThumbnails
          ? _self._authorThumbnails
          : authorThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      subCountText: freezed == subCountText
          ? _self.subCountText
          : subCountText // ignore: cast_nullable_to_non_nullable
              as String?,
      allowRatings: null == allowRatings
          ? _self.allowRatings
          : allowRatings // ignore: cast_nullable_to_non_nullable
              as bool,
      rating: freezed == rating
          ? _self.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
      isListed: freezed == isListed
          ? _self.isListed
          : isListed // ignore: cast_nullable_to_non_nullable
              as bool?,
      liveNow: freezed == liveNow
          ? _self.liveNow
          : liveNow // ignore: cast_nullable_to_non_nullable
              as bool?,
      hlsUrl: freezed == hlsUrl
          ? _self.hlsUrl
          : hlsUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      adaptiveFormats: freezed == adaptiveFormats
          ? _self._adaptiveFormats
          : adaptiveFormats // ignore: cast_nullable_to_non_nullable
              as List<AdaptiveFormat>?,
      formatStreams: freezed == formatStreams
          ? _self._formatStreams
          : formatStreams // ignore: cast_nullable_to_non_nullable
              as List<FormatStream>?,
      captions: null == captions
          ? _self._captions
          : captions // ignore: cast_nullable_to_non_nullable
              as List<Caption>,
      recommendedVideos: null == recommendedVideos
          ? _self._recommendedVideos
          : recommendedVideos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      lengthSeconds: freezed == lengthSeconds
          ? _self.lengthSeconds
          : lengthSeconds // ignore: cast_nullable_to_non_nullable
              as int?,
      author: freezed == author
          ? _self.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      authorId: freezed == authorId
          ? _self.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorUrl: freezed == authorUrl
          ? _self.authorUrl
          : authorUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      videoThumbnails: null == videoThumbnails
          ? _self._videoThumbnails
          : videoThumbnails // ignore: cast_nullable_to_non_nullable
              as List<ImageObject>,
      filtered: null == filtered
          ? _self.filtered
          : filtered // ignore: cast_nullable_to_non_nullable
              as bool,
      matchedFilters: null == matchedFilters
          ? _self._matchedFilters
          : matchedFilters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      filterHide: null == filterHide
          ? _self.filterHide
          : filterHide // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowed: null == deArrowed
          ? _self.deArrowed
          : deArrowed // ignore: cast_nullable_to_non_nullable
              as bool,
      deArrowThumbnailUrl: freezed == deArrowThumbnailUrl
          ? _self.deArrowThumbnailUrl
          : deArrowThumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      viewCountText: freezed == viewCountText
          ? _self.viewCountText
          : viewCountText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
