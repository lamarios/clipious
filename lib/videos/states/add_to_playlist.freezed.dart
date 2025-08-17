// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_to_playlist.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddToPlaylistController {
  String get videoId;
  List<Playlist> get playlists;
  int get playListCount;
  bool get isVideoLiked;
  bool get loading;
  bool get isLoggedIn;

  /// Create a copy of AddToPlaylistController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AddToPlaylistControllerCopyWith<AddToPlaylistController> get copyWith =>
      _$AddToPlaylistControllerCopyWithImpl<AddToPlaylistController>(
          this as AddToPlaylistController, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AddToPlaylistController &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            const DeepCollectionEquality().equals(other.playlists, playlists) &&
            (identical(other.playListCount, playListCount) ||
                other.playListCount == playListCount) &&
            (identical(other.isVideoLiked, isVideoLiked) ||
                other.isVideoLiked == isVideoLiked) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      const DeepCollectionEquality().hash(playlists),
      playListCount,
      isVideoLiked,
      loading,
      isLoggedIn);

  @override
  String toString() {
    return 'AddToPlaylistController(videoId: $videoId, playlists: $playlists, playListCount: $playListCount, isVideoLiked: $isVideoLiked, loading: $loading, isLoggedIn: $isLoggedIn)';
  }
}

/// @nodoc
abstract mixin class $AddToPlaylistControllerCopyWith<$Res> {
  factory $AddToPlaylistControllerCopyWith(AddToPlaylistController value,
          $Res Function(AddToPlaylistController) _then) =
      _$AddToPlaylistControllerCopyWithImpl;
  @useResult
  $Res call(
      {String videoId,
      List<Playlist> playlists,
      int playListCount,
      bool isVideoLiked,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class _$AddToPlaylistControllerCopyWithImpl<$Res>
    implements $AddToPlaylistControllerCopyWith<$Res> {
  _$AddToPlaylistControllerCopyWithImpl(this._self, this._then);

  final AddToPlaylistController _self;
  final $Res Function(AddToPlaylistController) _then;

  /// Create a copy of AddToPlaylistController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? playlists = null,
    Object? playListCount = null,
    Object? isVideoLiked = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_self.copyWith(
      videoId: null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      playlists: null == playlists
          ? _self.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      playListCount: null == playListCount
          ? _self.playListCount
          : playListCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVideoLiked: null == isVideoLiked
          ? _self.isVideoLiked
          : isVideoLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [AddToPlaylistController].
extension AddToPlaylistControllerPatterns on AddToPlaylistController {
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
    TResult Function(_AddToPlaylistController value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddToPlaylistController() when $default != null:
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
    TResult Function(_AddToPlaylistController value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddToPlaylistController():
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
    TResult? Function(_AddToPlaylistController value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddToPlaylistController() when $default != null:
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
            List<Playlist> playlists,
            int playListCount,
            bool isVideoLiked,
            bool loading,
            bool isLoggedIn)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddToPlaylistController() when $default != null:
        return $default(_that.videoId, _that.playlists, _that.playListCount,
            _that.isVideoLiked, _that.loading, _that.isLoggedIn);
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
    TResult Function(String videoId, List<Playlist> playlists,
            int playListCount, bool isVideoLiked, bool loading, bool isLoggedIn)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddToPlaylistController():
        return $default(_that.videoId, _that.playlists, _that.playListCount,
            _that.isVideoLiked, _that.loading, _that.isLoggedIn);
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
            List<Playlist> playlists,
            int playListCount,
            bool isVideoLiked,
            bool loading,
            bool isLoggedIn)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AddToPlaylistController() when $default != null:
        return $default(_that.videoId, _that.playlists, _that.playListCount,
            _that.isVideoLiked, _that.loading, _that.isLoggedIn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddToPlaylistController implements AddToPlaylistController {
  const _AddToPlaylistController(this.videoId,
      {final List<Playlist> playlists = const [],
      this.playListCount = 0,
      this.isVideoLiked = false,
      this.loading = true,
      this.isLoggedIn = false})
      : _playlists = playlists;

  @override
  final String videoId;
  final List<Playlist> _playlists;
  @override
  @JsonKey()
  List<Playlist> get playlists {
    if (_playlists is EqualUnmodifiableListView) return _playlists;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playlists);
  }

  @override
  @JsonKey()
  final int playListCount;
  @override
  @JsonKey()
  final bool isVideoLiked;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isLoggedIn;

  /// Create a copy of AddToPlaylistController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddToPlaylistControllerCopyWith<_AddToPlaylistController> get copyWith =>
      __$AddToPlaylistControllerCopyWithImpl<_AddToPlaylistController>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddToPlaylistController &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.playListCount, playListCount) ||
                other.playListCount == playListCount) &&
            (identical(other.isVideoLiked, isVideoLiked) ||
                other.isVideoLiked == isVideoLiked) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      videoId,
      const DeepCollectionEquality().hash(_playlists),
      playListCount,
      isVideoLiked,
      loading,
      isLoggedIn);

  @override
  String toString() {
    return 'AddToPlaylistController(videoId: $videoId, playlists: $playlists, playListCount: $playListCount, isVideoLiked: $isVideoLiked, loading: $loading, isLoggedIn: $isLoggedIn)';
  }
}

/// @nodoc
abstract mixin class _$AddToPlaylistControllerCopyWith<$Res>
    implements $AddToPlaylistControllerCopyWith<$Res> {
  factory _$AddToPlaylistControllerCopyWith(_AddToPlaylistController value,
          $Res Function(_AddToPlaylistController) _then) =
      __$AddToPlaylistControllerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String videoId,
      List<Playlist> playlists,
      int playListCount,
      bool isVideoLiked,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class __$AddToPlaylistControllerCopyWithImpl<$Res>
    implements _$AddToPlaylistControllerCopyWith<$Res> {
  __$AddToPlaylistControllerCopyWithImpl(this._self, this._then);

  final _AddToPlaylistController _self;
  final $Res Function(_AddToPlaylistController) _then;

  /// Create a copy of AddToPlaylistController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? videoId = null,
    Object? playlists = null,
    Object? playListCount = null,
    Object? isVideoLiked = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_AddToPlaylistController(
      null == videoId
          ? _self.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      playlists: null == playlists
          ? _self._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      playListCount: null == playListCount
          ? _self.playListCount
          : playListCount // ignore: cast_nullable_to_non_nullable
              as int,
      isVideoLiked: null == isVideoLiked
          ? _self.isVideoLiked
          : isVideoLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _self.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
