// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_in_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoInListState {
  double get progress;
  Video? get video;
  DownloadedVideo? get offlineVideo;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoInListStateCopyWith<VideoInListState> get copyWith =>
      _$VideoInListStateCopyWithImpl<VideoInListState>(
          this as VideoInListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoInListState &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, video, offlineVideo);

  @override
  String toString() {
    return 'VideoInListState(progress: $progress, video: $video, offlineVideo: $offlineVideo)';
  }
}

/// @nodoc
abstract mixin class $VideoInListStateCopyWith<$Res> {
  factory $VideoInListStateCopyWith(
          VideoInListState value, $Res Function(VideoInListState) _then) =
      _$VideoInListStateCopyWithImpl;
  @useResult
  $Res call({double progress, Video? video, DownloadedVideo? offlineVideo});

  $VideoCopyWith<$Res>? get video;
  $DownloadedVideoCopyWith<$Res>? get offlineVideo;
}

/// @nodoc
class _$VideoInListStateCopyWithImpl<$Res>
    implements $VideoInListStateCopyWith<$Res> {
  _$VideoInListStateCopyWithImpl(this._self, this._then);

  final VideoInListState _self;
  final $Res Function(VideoInListState) _then;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? video = freezed,
    Object? offlineVideo = freezed,
  }) {
    return _then(_self.copyWith(
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineVideo: freezed == offlineVideo
          ? _self.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
    ));
  }

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $VideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get offlineVideo {
    if (_self.offlineVideo == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.offlineVideo!, (value) {
      return _then(_self.copyWith(offlineVideo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [VideoInListState].
extension VideoInListStatePatterns on VideoInListState {
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
    TResult Function(_VideoInListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoInListState() when $default != null:
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
    TResult Function(_VideoInListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoInListState():
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
    TResult? Function(_VideoInListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoInListState() when $default != null:
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
            double progress, Video? video, DownloadedVideo? offlineVideo)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoInListState() when $default != null:
        return $default(_that.progress, _that.video, _that.offlineVideo);
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
            double progress, Video? video, DownloadedVideo? offlineVideo)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoInListState():
        return $default(_that.progress, _that.video, _that.offlineVideo);
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
            double progress, Video? video, DownloadedVideo? offlineVideo)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoInListState() when $default != null:
        return $default(_that.progress, _that.video, _that.offlineVideo);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoInListState implements VideoInListState {
  const _VideoInListState({this.progress = 0, this.video, this.offlineVideo})
      : assert(video == null || offlineVideo == null,
            'cannot provide both video and offline video');

  @override
  @JsonKey()
  final double progress;
  @override
  final Video? video;
  @override
  final DownloadedVideo? offlineVideo;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoInListStateCopyWith<_VideoInListState> get copyWith =>
      __$VideoInListStateCopyWithImpl<_VideoInListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoInListState &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.offlineVideo, offlineVideo) ||
                other.offlineVideo == offlineVideo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, progress, video, offlineVideo);

  @override
  String toString() {
    return 'VideoInListState(progress: $progress, video: $video, offlineVideo: $offlineVideo)';
  }
}

/// @nodoc
abstract mixin class _$VideoInListStateCopyWith<$Res>
    implements $VideoInListStateCopyWith<$Res> {
  factory _$VideoInListStateCopyWith(
          _VideoInListState value, $Res Function(_VideoInListState) _then) =
      __$VideoInListStateCopyWithImpl;
  @override
  @useResult
  $Res call({double progress, Video? video, DownloadedVideo? offlineVideo});

  @override
  $VideoCopyWith<$Res>? get video;
  @override
  $DownloadedVideoCopyWith<$Res>? get offlineVideo;
}

/// @nodoc
class __$VideoInListStateCopyWithImpl<$Res>
    implements _$VideoInListStateCopyWith<$Res> {
  __$VideoInListStateCopyWithImpl(this._self, this._then);

  final _VideoInListState _self;
  final $Res Function(_VideoInListState) _then;

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? progress = null,
    Object? video = freezed,
    Object? offlineVideo = freezed,
  }) {
    return _then(_VideoInListState(
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineVideo: freezed == offlineVideo
          ? _self.offlineVideo
          : offlineVideo // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
    ));
  }

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $VideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }

  /// Create a copy of VideoInListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get offlineVideo {
    if (_self.offlineVideo == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.offlineVideo!, (value) {
      return _then(_self.copyWith(offlineVideo: value));
    });
  }
}

// dart format on
