// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloaded_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadedVideoState {
  DownloadedVideo? get video;
  String? get thumbnailPath;
  double get progress;

  /// Create a copy of DownloadedVideoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadedVideoStateCopyWith<DownloadedVideoState> get copyWith =>
      _$DownloadedVideoStateCopyWithImpl<DownloadedVideoState>(
          this as DownloadedVideoState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadedVideoState &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, thumbnailPath, progress);

  @override
  String toString() {
    return 'DownloadedVideoState(video: $video, thumbnailPath: $thumbnailPath, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class $DownloadedVideoStateCopyWith<$Res> {
  factory $DownloadedVideoStateCopyWith(DownloadedVideoState value,
          $Res Function(DownloadedVideoState) _then) =
      _$DownloadedVideoStateCopyWithImpl;
  @useResult
  $Res call({DownloadedVideo? video, String? thumbnailPath, double progress});

  $DownloadedVideoCopyWith<$Res>? get video;
}

/// @nodoc
class _$DownloadedVideoStateCopyWithImpl<$Res>
    implements $DownloadedVideoStateCopyWith<$Res> {
  _$DownloadedVideoStateCopyWithImpl(this._self, this._then);

  final DownloadedVideoState _self;
  final $Res Function(DownloadedVideoState) _then;

  /// Create a copy of DownloadedVideoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? video = freezed,
    Object? thumbnailPath = freezed,
    Object? progress = null,
  }) {
    return _then(_self.copyWith(
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      thumbnailPath: freezed == thumbnailPath
          ? _self.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of DownloadedVideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

/// Adds pattern-matching-related methods to [DownloadedVideoState].
extension DownloadedVideoStatePatterns on DownloadedVideoState {
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
    TResult Function(_DownloadedVideoState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideoState() when $default != null:
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
    TResult Function(_DownloadedVideoState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideoState():
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
    TResult? Function(_DownloadedVideoState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideoState() when $default != null:
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
            DownloadedVideo? video, String? thumbnailPath, double progress)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideoState() when $default != null:
        return $default(_that.video, _that.thumbnailPath, _that.progress);
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
            DownloadedVideo? video, String? thumbnailPath, double progress)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideoState():
        return $default(_that.video, _that.thumbnailPath, _that.progress);
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
            DownloadedVideo? video, String? thumbnailPath, double progress)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadedVideoState() when $default != null:
        return $default(_that.video, _that.thumbnailPath, _that.progress);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DownloadedVideoState implements DownloadedVideoState {
  const _DownloadedVideoState(
      {this.video, this.thumbnailPath, this.progress = 0});

  @override
  final DownloadedVideo? video;
  @override
  final String? thumbnailPath;
  @override
  @JsonKey()
  final double progress;

  /// Create a copy of DownloadedVideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DownloadedVideoStateCopyWith<_DownloadedVideoState> get copyWith =>
      __$DownloadedVideoStateCopyWithImpl<_DownloadedVideoState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadedVideoState &&
            (identical(other.video, video) || other.video == video) &&
            (identical(other.thumbnailPath, thumbnailPath) ||
                other.thumbnailPath == thumbnailPath) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, video, thumbnailPath, progress);

  @override
  String toString() {
    return 'DownloadedVideoState(video: $video, thumbnailPath: $thumbnailPath, progress: $progress)';
  }
}

/// @nodoc
abstract mixin class _$DownloadedVideoStateCopyWith<$Res>
    implements $DownloadedVideoStateCopyWith<$Res> {
  factory _$DownloadedVideoStateCopyWith(_DownloadedVideoState value,
          $Res Function(_DownloadedVideoState) _then) =
      __$DownloadedVideoStateCopyWithImpl;
  @override
  @useResult
  $Res call({DownloadedVideo? video, String? thumbnailPath, double progress});

  @override
  $DownloadedVideoCopyWith<$Res>? get video;
}

/// @nodoc
class __$DownloadedVideoStateCopyWithImpl<$Res>
    implements _$DownloadedVideoStateCopyWith<$Res> {
  __$DownloadedVideoStateCopyWithImpl(this._self, this._then);

  final _DownloadedVideoState _self;
  final $Res Function(_DownloadedVideoState) _then;

  /// Create a copy of DownloadedVideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? video = freezed,
    Object? thumbnailPath = freezed,
    Object? progress = null,
  }) {
    return _then(_DownloadedVideoState(
      video: freezed == video
          ? _self.video
          : video // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      thumbnailPath: freezed == thumbnailPath
          ? _self.thumbnailPath
          : thumbnailPath // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: null == progress
          ? _self.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of DownloadedVideoState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get video {
    if (_self.video == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.video!, (value) {
      return _then(_self.copyWith(video: value));
    });
  }
}

// dart format on
