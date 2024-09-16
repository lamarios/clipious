// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvChannelController {
  bool get showBackground => throw _privateConstructorUsedError;
  bool get hasShorts => throw _privateConstructorUsedError;
  bool get hasVideos => throw _privateConstructorUsedError;
  bool get hasStreams => throw _privateConstructorUsedError;
  bool get hasPlaylist => throw _privateConstructorUsedError;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvChannelControllerCopyWith<TvChannelController> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvChannelControllerCopyWith<$Res> {
  factory $TvChannelControllerCopyWith(
          TvChannelController value, $Res Function(TvChannelController) then) =
      _$TvChannelControllerCopyWithImpl<$Res, TvChannelController>;
  @useResult
  $Res call(
      {bool showBackground,
      bool hasShorts,
      bool hasVideos,
      bool hasStreams,
      bool hasPlaylist});
}

/// @nodoc
class _$TvChannelControllerCopyWithImpl<$Res, $Val extends TvChannelController>
    implements $TvChannelControllerCopyWith<$Res> {
  _$TvChannelControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showBackground = null,
    Object? hasShorts = null,
    Object? hasVideos = null,
    Object? hasStreams = null,
    Object? hasPlaylist = null,
  }) {
    return _then(_value.copyWith(
      showBackground: null == showBackground
          ? _value.showBackground
          : showBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      hasShorts: null == hasShorts
          ? _value.hasShorts
          : hasShorts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasVideos: null == hasVideos
          ? _value.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasStreams: null == hasStreams
          ? _value.hasStreams
          : hasStreams // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylist: null == hasPlaylist
          ? _value.hasPlaylist
          : hasPlaylist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvChannelControllerImplCopyWith<$Res>
    implements $TvChannelControllerCopyWith<$Res> {
  factory _$$TvChannelControllerImplCopyWith(_$TvChannelControllerImpl value,
          $Res Function(_$TvChannelControllerImpl) then) =
      __$$TvChannelControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool showBackground,
      bool hasShorts,
      bool hasVideos,
      bool hasStreams,
      bool hasPlaylist});
}

/// @nodoc
class __$$TvChannelControllerImplCopyWithImpl<$Res>
    extends _$TvChannelControllerCopyWithImpl<$Res, _$TvChannelControllerImpl>
    implements _$$TvChannelControllerImplCopyWith<$Res> {
  __$$TvChannelControllerImplCopyWithImpl(_$TvChannelControllerImpl _value,
      $Res Function(_$TvChannelControllerImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showBackground = null,
    Object? hasShorts = null,
    Object? hasVideos = null,
    Object? hasStreams = null,
    Object? hasPlaylist = null,
  }) {
    return _then(_$TvChannelControllerImpl(
      showBackground: null == showBackground
          ? _value.showBackground
          : showBackground // ignore: cast_nullable_to_non_nullable
              as bool,
      hasShorts: null == hasShorts
          ? _value.hasShorts
          : hasShorts // ignore: cast_nullable_to_non_nullable
              as bool,
      hasVideos: null == hasVideos
          ? _value.hasVideos
          : hasVideos // ignore: cast_nullable_to_non_nullable
              as bool,
      hasStreams: null == hasStreams
          ? _value.hasStreams
          : hasStreams // ignore: cast_nullable_to_non_nullable
              as bool,
      hasPlaylist: null == hasPlaylist
          ? _value.hasPlaylist
          : hasPlaylist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TvChannelControllerImpl implements _TvChannelController {
  const _$TvChannelControllerImpl(
      {this.showBackground = false,
      this.hasShorts = false,
      this.hasVideos = false,
      this.hasStreams = false,
      this.hasPlaylist = false});

  @override
  @JsonKey()
  final bool showBackground;
  @override
  @JsonKey()
  final bool hasShorts;
  @override
  @JsonKey()
  final bool hasVideos;
  @override
  @JsonKey()
  final bool hasStreams;
  @override
  @JsonKey()
  final bool hasPlaylist;

  @override
  String toString() {
    return 'TvChannelController(showBackground: $showBackground, hasShorts: $hasShorts, hasVideos: $hasVideos, hasStreams: $hasStreams, hasPlaylist: $hasPlaylist)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvChannelControllerImpl &&
            (identical(other.showBackground, showBackground) ||
                other.showBackground == showBackground) &&
            (identical(other.hasShorts, hasShorts) ||
                other.hasShorts == hasShorts) &&
            (identical(other.hasVideos, hasVideos) ||
                other.hasVideos == hasVideos) &&
            (identical(other.hasStreams, hasStreams) ||
                other.hasStreams == hasStreams) &&
            (identical(other.hasPlaylist, hasPlaylist) ||
                other.hasPlaylist == hasPlaylist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showBackground, hasShorts,
      hasVideos, hasStreams, hasPlaylist);

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvChannelControllerImplCopyWith<_$TvChannelControllerImpl> get copyWith =>
      __$$TvChannelControllerImplCopyWithImpl<_$TvChannelControllerImpl>(
          this, _$identity);
}

abstract class _TvChannelController implements TvChannelController {
  const factory _TvChannelController(
      {final bool showBackground,
      final bool hasShorts,
      final bool hasVideos,
      final bool hasStreams,
      final bool hasPlaylist}) = _$TvChannelControllerImpl;

  @override
  bool get showBackground;
  @override
  bool get hasShorts;
  @override
  bool get hasVideos;
  @override
  bool get hasStreams;
  @override
  bool get hasPlaylist;

  /// Create a copy of TvChannelController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvChannelControllerImplCopyWith<_$TvChannelControllerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
