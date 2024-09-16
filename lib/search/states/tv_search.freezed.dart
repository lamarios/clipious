// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_search.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvSearchState {
  bool get hasVideos => throw _privateConstructorUsedError;
  bool get hasChannels => throw _privateConstructorUsedError;
  bool get hasPlaylists => throw _privateConstructorUsedError;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvSearchStateCopyWith<TvSearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvSearchStateCopyWith<$Res> {
  factory $TvSearchStateCopyWith(
          TvSearchState value, $Res Function(TvSearchState) then) =
      _$TvSearchStateCopyWithImpl<$Res, TvSearchState>;
  @useResult
  $Res call({bool hasVideos, bool hasChannels, bool hasPlaylists});
}

/// @nodoc
class _$TvSearchStateCopyWithImpl<$Res, $Val extends TvSearchState>
    implements $TvSearchStateCopyWith<$Res> {
  _$TvSearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasVideos = null,
    Object? hasChannels = null,
    Object? hasPlaylists = null,
  }) {
    return _then(_value.copyWith(
      hasVideos: null == hasVideos
          ? _value.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChannels: null == hasChannels
          ? _value.hasChannels
          : hasChannels // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylists: null == hasPlaylists
          ? _value.hasPlaylists
          : hasPlaylists // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvSearchStateImplCopyWith<$Res>
    implements $TvSearchStateCopyWith<$Res> {
  factory _$$TvSearchStateImplCopyWith(
          _$TvSearchStateImpl value, $Res Function(_$TvSearchStateImpl) then) =
      __$$TvSearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasVideos, bool hasChannels, bool hasPlaylists});
}

/// @nodoc
class __$$TvSearchStateImplCopyWithImpl<$Res>
    extends _$TvSearchStateCopyWithImpl<$Res, _$TvSearchStateImpl>
    implements _$$TvSearchStateImplCopyWith<$Res> {
  __$$TvSearchStateImplCopyWithImpl(
      _$TvSearchStateImpl _value, $Res Function(_$TvSearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasVideos = null,
    Object? hasChannels = null,
    Object? hasPlaylists = null,
  }) {
    return _then(_$TvSearchStateImpl(
      hasVideos: null == hasVideos
          ? _value.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasChannels: null == hasChannels
          ? _value.hasChannels
          : hasChannels // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylists: null == hasPlaylists
          ? _value.hasPlaylists
          : hasPlaylists // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TvSearchStateImpl implements _TvSearchState {
  const _$TvSearchStateImpl(
      {this.hasVideos = false,
      this.hasChannels = false,
      this.hasPlaylists = false});

  @override
  @JsonKey()
  final bool hasVideos;
  @override
  @JsonKey()
  final bool hasChannels;
  @override
  @JsonKey()
  final bool hasPlaylists;

  @override
  String toString() {
    return 'TvSearchState(hasVideos: $hasVideos, hasChannels: $hasChannels, hasPlaylists: $hasPlaylists)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvSearchStateImpl &&
            (identical(other.hasVideos, hasVideos) ||
                other.hasVideos == hasVideos) &&
            (identical(other.hasChannels, hasChannels) ||
                other.hasChannels == hasChannels) &&
            (identical(other.hasPlaylists, hasPlaylists) ||
                other.hasPlaylists == hasPlaylists));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, hasVideos, hasChannels, hasPlaylists);

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvSearchStateImplCopyWith<_$TvSearchStateImpl> get copyWith =>
      __$$TvSearchStateImplCopyWithImpl<_$TvSearchStateImpl>(this, _$identity);
}

abstract class _TvSearchState implements TvSearchState {
  const factory _TvSearchState(
      {final bool hasVideos,
      final bool hasChannels,
      final bool hasPlaylists}) = _$TvSearchStateImpl;

  @override
  bool get hasVideos;
  @override
  bool get hasChannels;
  @override
  bool get hasPlaylists;

  /// Create a copy of TvSearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvSearchStateImplCopyWith<_$TvSearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
