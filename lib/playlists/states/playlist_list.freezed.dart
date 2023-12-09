// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playlist_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaylistListState {
  PaginatedList<Playlist> get paginatedList =>
      throw _privateConstructorUsedError;
  List<Playlist> get playlists => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaylistListStateCopyWith<PlaylistListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaylistListStateCopyWith<$Res> {
  factory $PlaylistListStateCopyWith(
          PlaylistListState value, $Res Function(PlaylistListState) then) =
      _$PlaylistListStateCopyWithImpl<$Res, PlaylistListState>;
  @useResult
  $Res call(
      {PaginatedList<Playlist> paginatedList,
      List<Playlist> playlists,
      bool loading,
      String error});
}

/// @nodoc
class _$PlaylistListStateCopyWithImpl<$Res, $Val extends PlaylistListState>
    implements $PlaylistListStateCopyWith<$Res> {
  _$PlaylistListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginatedList = null,
    Object? playlists = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      paginatedList: null == paginatedList
          ? _value.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<Playlist>,
      playlists: null == playlists
          ? _value.playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaylistListStateImplCopyWith<$Res>
    implements $PlaylistListStateCopyWith<$Res> {
  factory _$$PlaylistListStateImplCopyWith(_$PlaylistListStateImpl value,
          $Res Function(_$PlaylistListStateImpl) then) =
      __$$PlaylistListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginatedList<Playlist> paginatedList,
      List<Playlist> playlists,
      bool loading,
      String error});
}

/// @nodoc
class __$$PlaylistListStateImplCopyWithImpl<$Res>
    extends _$PlaylistListStateCopyWithImpl<$Res, _$PlaylistListStateImpl>
    implements _$$PlaylistListStateImplCopyWith<$Res> {
  __$$PlaylistListStateImplCopyWithImpl(_$PlaylistListStateImpl _value,
      $Res Function(_$PlaylistListStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paginatedList = null,
    Object? playlists = null,
    Object? loading = null,
    Object? error = null,
  }) {
    return _then(_$PlaylistListStateImpl(
      paginatedList: null == paginatedList
          ? _value.paginatedList
          : paginatedList // ignore: cast_nullable_to_non_nullable
              as PaginatedList<Playlist>,
      playlists: null == playlists
          ? _value._playlists
          : playlists // ignore: cast_nullable_to_non_nullable
              as List<Playlist>,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PlaylistListStateImpl implements _PlaylistListState {
  const _$PlaylistListStateImpl(
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

  @override
  String toString() {
    return 'PlaylistListState(paginatedList: $paginatedList, playlists: $playlists, loading: $loading, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaylistListStateImpl &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaylistListStateImplCopyWith<_$PlaylistListStateImpl> get copyWith =>
      __$$PlaylistListStateImplCopyWithImpl<_$PlaylistListStateImpl>(
          this, _$identity);
}

abstract class _PlaylistListState implements PlaylistListState {
  const factory _PlaylistListState(
      {required final PaginatedList<Playlist> paginatedList,
      final List<Playlist> playlists,
      final bool loading,
      final String error}) = _$PlaylistListStateImpl;

  @override
  PaginatedList<Playlist> get paginatedList;
  @override
  List<Playlist> get playlists;
  @override
  bool get loading;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$PlaylistListStateImplCopyWith<_$PlaylistListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
