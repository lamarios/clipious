// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistState {
  double get loadingProgress;
  Playlist get playlist;
  bool get loading;
  double get playlistItemHeight;
  bool get showImage;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistStateCopyWith<PlaylistState> get copyWith =>
      _$PlaylistStateCopyWithImpl<PlaylistState>(
          this as PlaylistState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistState &&
            (identical(other.loadingProgress, loadingProgress) ||
                other.loadingProgress == loadingProgress) &&
            (identical(other.playlist, playlist) ||
                other.playlist == playlist) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.playlistItemHeight, playlistItemHeight) ||
                other.playlistItemHeight == playlistItemHeight) &&
            (identical(other.showImage, showImage) ||
                other.showImage == showImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingProgress, playlist,
      loading, playlistItemHeight, showImage);

  @override
  String toString() {
    return 'PlaylistState(loadingProgress: $loadingProgress, playlist: $playlist, loading: $loading, playlistItemHeight: $playlistItemHeight, showImage: $showImage)';
  }
}

/// @nodoc
abstract mixin class $PlaylistStateCopyWith<$Res> {
  factory $PlaylistStateCopyWith(
          PlaylistState value, $Res Function(PlaylistState) _then) =
      _$PlaylistStateCopyWithImpl;
  @useResult
  $Res call(
      {double loadingProgress,
      Playlist playlist,
      bool loading,
      double playlistItemHeight,
      bool showImage});

  $PlaylistCopyWith<$Res> get playlist;
}

/// @nodoc
class _$PlaylistStateCopyWithImpl<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  _$PlaylistStateCopyWithImpl(this._self, this._then);

  final PlaylistState _self;
  final $Res Function(PlaylistState) _then;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingProgress = null,
    Object? playlist = null,
    Object? loading = null,
    Object? playlistItemHeight = null,
    Object? showImage = null,
  }) {
    return _then(_self.copyWith(
      loadingProgress: null == loadingProgress
          ? _self.loadingProgress
          : loadingProgress // ignore: cast_nullable_to_non_nullable
              as double,
      playlist: null == playlist
          ? _self.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as Playlist,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      playlistItemHeight: null == playlistItemHeight
          ? _self.playlistItemHeight
          : playlistItemHeight // ignore: cast_nullable_to_non_nullable
              as double,
      showImage: null == showImage
          ? _self.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaylistCopyWith<$Res> get playlist {
    return $PlaylistCopyWith<$Res>(_self.playlist, (value) {
      return _then(_self.copyWith(playlist: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlaylistState].
extension PlaylistStatePatterns on PlaylistState {
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
    TResult Function(_PlaylistState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
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
    TResult Function(_PlaylistState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState():
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
    TResult? Function(_PlaylistState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
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
    TResult Function(double loadingProgress, Playlist playlist, bool loading,
            double playlistItemHeight, bool showImage)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
        return $default(_that.loadingProgress, _that.playlist, _that.loading,
            _that.playlistItemHeight, _that.showImage);
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
    TResult Function(double loadingProgress, Playlist playlist, bool loading,
            double playlistItemHeight, bool showImage)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState():
        return $default(_that.loadingProgress, _that.playlist, _that.loading,
            _that.playlistItemHeight, _that.showImage);
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
    TResult? Function(double loadingProgress, Playlist playlist, bool loading,
            double playlistItemHeight, bool showImage)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistState() when $default != null:
        return $default(_that.loadingProgress, _that.playlist, _that.loading,
            _that.playlistItemHeight, _that.showImage);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaylistState implements PlaylistState {
  const _PlaylistState(
      {this.loadingProgress = 0,
      required this.playlist,
      this.loading = true,
      required this.playlistItemHeight,
      this.showImage = true});

  @override
  @JsonKey()
  final double loadingProgress;
  @override
  final Playlist playlist;
  @override
  @JsonKey()
  final bool loading;
  @override
  final double playlistItemHeight;
  @override
  @JsonKey()
  final bool showImage;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistStateCopyWith<_PlaylistState> get copyWith =>
      __$PlaylistStateCopyWithImpl<_PlaylistState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaylistState &&
            (identical(other.loadingProgress, loadingProgress) ||
                other.loadingProgress == loadingProgress) &&
            (identical(other.playlist, playlist) ||
                other.playlist == playlist) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.playlistItemHeight, playlistItemHeight) ||
                other.playlistItemHeight == playlistItemHeight) &&
            (identical(other.showImage, showImage) ||
                other.showImage == showImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loadingProgress, playlist,
      loading, playlistItemHeight, showImage);

  @override
  String toString() {
    return 'PlaylistState(loadingProgress: $loadingProgress, playlist: $playlist, loading: $loading, playlistItemHeight: $playlistItemHeight, showImage: $showImage)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistStateCopyWith<$Res>
    implements $PlaylistStateCopyWith<$Res> {
  factory _$PlaylistStateCopyWith(
          _PlaylistState value, $Res Function(_PlaylistState) _then) =
      __$PlaylistStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {double loadingProgress,
      Playlist playlist,
      bool loading,
      double playlistItemHeight,
      bool showImage});

  @override
  $PlaylistCopyWith<$Res> get playlist;
}

/// @nodoc
class __$PlaylistStateCopyWithImpl<$Res>
    implements _$PlaylistStateCopyWith<$Res> {
  __$PlaylistStateCopyWithImpl(this._self, this._then);

  final _PlaylistState _self;
  final $Res Function(_PlaylistState) _then;

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadingProgress = null,
    Object? playlist = null,
    Object? loading = null,
    Object? playlistItemHeight = null,
    Object? showImage = null,
  }) {
    return _then(_PlaylistState(
      loadingProgress: null == loadingProgress
          ? _self.loadingProgress
          : loadingProgress // ignore: cast_nullable_to_non_nullable
              as double,
      playlist: null == playlist
          ? _self.playlist
          : playlist // ignore: cast_nullable_to_non_nullable
              as Playlist,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      playlistItemHeight: null == playlistItemHeight
          ? _self.playlistItemHeight
          : playlistItemHeight // ignore: cast_nullable_to_non_nullable
              as double,
      showImage: null == showImage
          ? _self.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of PlaylistState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlaylistCopyWith<$Res> get playlist {
    return $PlaylistCopyWith<$Res>(_self.playlist, (value) {
      return _then(_self.copyWith(playlist: value));
    });
  }
}

// dart format on
