// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaylistListState {
  PaginatedList<Playlist> get paginatedList;
  List<Playlist> get playlists;
  bool get loading;
  String get error;

  /// Create a copy of PlaylistListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlaylistListStateCopyWith<PlaylistListState> get copyWith =>
      _$PlaylistListStateCopyWithImpl<PlaylistListState>(
          this as PlaylistListState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlaylistListState &&
            (identical(other.paginatedList, paginatedList) ||
                other.paginatedList == paginatedList) &&
            const DeepCollectionEquality().equals(other.playlists, playlists) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginatedList,
      const DeepCollectionEquality().hash(playlists), loading, error);

  @override
  String toString() {
    return 'PlaylistListState(paginatedList: $paginatedList, playlists: $playlists, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class $PlaylistListStateCopyWith<$Res> {
  factory $PlaylistListStateCopyWith(
          PlaylistListState value, $Res Function(PlaylistListState) _then) =
      _$PlaylistListStateCopyWithImpl;
  @useResult
  $Res call(
      {PaginatedList<Playlist> paginatedList,
      List<Playlist> playlists,
      bool loading,
      String error});
}

/// @nodoc
class _$PlaylistListStateCopyWithImpl<$Res>
    implements $PlaylistListStateCopyWith<$Res> {
  _$PlaylistListStateCopyWithImpl(this._self, this._then);

  final PlaylistListState _self;
  final $Res Function(PlaylistListState) _then;

  /// Create a copy of PlaylistListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginatedList = null,
    Object? playlists = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_self.copyWith(
      paginatedList: null == paginatedList
          ? _self.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<Playlist>,
      playlists: null == playlists
          ? _self.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PlaylistListState].
extension PlaylistListStatePatterns on PlaylistListState {
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
    TResult Function(_PlaylistListState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistListState() when $default != null:
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
    TResult Function(_PlaylistListState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistListState():
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
    TResult? Function(_PlaylistListState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistListState() when $default != null:
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
    TResult Function(PaginatedList<Playlist> paginatedList,
            List<Playlist> playlists, bool loading, String error)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlaylistListState() when $default != null:
        return $default(
            _that.paginatedList, _that.playlists, _that.loading, _that.error);
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
    TResult Function(PaginatedList<Playlist> paginatedList,
            List<Playlist> playlists, bool loading, String error)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistListState():
        return $default(
            _that.paginatedList, _that.playlists, _that.loading, _that.error);
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
    TResult? Function(PaginatedList<Playlist> paginatedList,
            List<Playlist> playlists, bool loading, String error)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlaylistListState() when $default != null:
        return $default(
            _that.paginatedList, _that.playlists, _that.loading, _that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlaylistListState implements PlaylistListState {
  const _PlaylistListState(
      {required this.paginatedList,
      final List<Playlist> playlists = const [],
      this.loading = true,
      this.error = ''})
      : _playlists = playlists;

  @override
  final PaginatedList<Playlist> paginatedList;
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
  final bool loading;
  @override
  @JsonKey()
  final String error;

  /// Create a copy of PlaylistListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlaylistListStateCopyWith<_PlaylistListState> get copyWith =>
      __$PlaylistListStateCopyWithImpl<_PlaylistListState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlaylistListState &&
            (identical(other.paginatedList, paginatedList) ||
                other.paginatedList == paginatedList) &&
            const DeepCollectionEquality()
                .equals(other._playlists, _playlists) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paginatedList,
      const DeepCollectionEquality().hash(_playlists), loading, error);

  @override
  String toString() {
    return 'PlaylistListState(paginatedList: $paginatedList, playlists: $playlists, loading: $loading, error: $error)';
  }
}

/// @nodoc
abstract mixin class _$PlaylistListStateCopyWith<$Res>
    implements $PlaylistListStateCopyWith<$Res> {
  factory _$PlaylistListStateCopyWith(
          _PlaylistListState value, $Res Function(_PlaylistListState) _then) =
      __$PlaylistListStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {PaginatedList<Playlist> paginatedList,
      List<Playlist> playlists,
      bool loading,
      String error});
}

/// @nodoc
class __$PlaylistListStateCopyWithImpl<$Res>
    implements _$PlaylistListStateCopyWith<$Res> {
  __$PlaylistListStateCopyWithImpl(this._self, this._then);

  final _PlaylistListState _self;
  final $Res Function(_PlaylistListState) _then;

  /// Create a copy of PlaylistListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? paginatedList = null,
    Object? playlists = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_PlaylistListState(
      paginatedList: null == paginatedList
          ? _self.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<Playlist>,
      playlists: null == playlists
          ? _self._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
