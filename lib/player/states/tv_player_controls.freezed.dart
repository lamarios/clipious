// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_player_controls.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvPlayerControlsState {
  double get controlsOpacity => throw _privateConstructorUsedError;
  bool get showSettings => throw _privateConstructorUsedError;
  bool get showQueue => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get displayControls => throw _privateConstructorUsedError;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvPlayerControlsStateCopyWith<TvPlayerControlsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvPlayerControlsStateCopyWith<$Res> {
  factory $TvPlayerControlsStateCopyWith(TvPlayerControlsState value,
          $Res Function(TvPlayerControlsState) then) =
      _$TvPlayerControlsStateCopyWithImpl<$Res, TvPlayerControlsState>;
  @useResult
  $Res call(
      {double controlsOpacity,
      bool showSettings,
      bool showQueue,
      bool loading,
      bool displayControls});
}

/// @nodoc
class _$TvPlayerControlsStateCopyWithImpl<$Res,
        $Val extends TvPlayerControlsState>
    implements $TvPlayerControlsStateCopyWith<$Res> {
  _$TvPlayerControlsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controlsOpacity = null,
    Object? showSettings = null,
    Object? showQueue = null,
    Object? loading = null,
    Object? displayControls = null,
  }) {
    return _then(_value.copyWith(
      controlsOpacity: null == controlsOpacity
          ? _value.controlsOpacity
          : controlsOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      showSettings: null == showSettings
          ? _value.showSettings
          : showSettings // ignore: cast_nullable_to_non_nullable
              as bool,
      showQueue: null == showQueue
          ? _value.showQueue
          : showQueue // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayControls: null == displayControls
          ? _value.displayControls
          : displayControls // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvPlayerControlsStateImplCopyWith<$Res>
    implements $TvPlayerControlsStateCopyWith<$Res> {
  factory _$$TvPlayerControlsStateImplCopyWith(
          _$TvPlayerControlsStateImpl value,
          $Res Function(_$TvPlayerControlsStateImpl) then) =
      __$$TvPlayerControlsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double controlsOpacity,
      bool showSettings,
      bool showQueue,
      bool loading,
      bool displayControls});
}

/// @nodoc
class __$$TvPlayerControlsStateImplCopyWithImpl<$Res>
    extends _$TvPlayerControlsStateCopyWithImpl<$Res,
        _$TvPlayerControlsStateImpl>
    implements _$$TvPlayerControlsStateImplCopyWith<$Res> {
  __$$TvPlayerControlsStateImplCopyWithImpl(_$TvPlayerControlsStateImpl _value,
      $Res Function(_$TvPlayerControlsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controlsOpacity = null,
    Object? showSettings = null,
    Object? showQueue = null,
    Object? loading = null,
    Object? displayControls = null,
  }) {
    return _then(_$TvPlayerControlsStateImpl(
      controlsOpacity: null == controlsOpacity
          ? _value.controlsOpacity
          : controlsOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      showSettings: null == showSettings
          ? _value.showSettings
          : showSettings // ignore: cast_nullable_to_non_nullable
              as bool,
      showQueue: null == showQueue
          ? _value.showQueue
          : showQueue // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      displayControls: null == displayControls
          ? _value.displayControls
          : displayControls // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TvPlayerControlsStateImpl extends _TvPlayerControlsState {
  const _$TvPlayerControlsStateImpl(
      {this.controlsOpacity = 0,
      this.showSettings = false,
      this.showQueue = false,
      this.loading = false,
      this.displayControls = false})
      : super._();

  @override
  @JsonKey()
  final double controlsOpacity;
  @override
  @JsonKey()
  final bool showSettings;
  @override
  @JsonKey()
  final bool showQueue;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool displayControls;

  @override
  String toString() {
    return 'TvPlayerControlsState(controlsOpacity: $controlsOpacity, showSettings: $showSettings, showQueue: $showQueue, loading: $loading, displayControls: $displayControls)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvPlayerControlsStateImpl &&
            (identical(other.controlsOpacity, controlsOpacity) ||
                other.controlsOpacity == controlsOpacity) &&
            (identical(other.showSettings, showSettings) ||
                other.showSettings == showSettings) &&
            (identical(other.showQueue, showQueue) ||
                other.showQueue == showQueue) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.displayControls, displayControls) ||
                other.displayControls == displayControls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controlsOpacity, showSettings,
      showQueue, loading, displayControls);

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvPlayerControlsStateImplCopyWith<_$TvPlayerControlsStateImpl>
      get copyWith => __$$TvPlayerControlsStateImplCopyWithImpl<
          _$TvPlayerControlsStateImpl>(this, _$identity);
}

abstract class _TvPlayerControlsState extends TvPlayerControlsState {
  const factory _TvPlayerControlsState(
      {final double controlsOpacity,
      final bool showSettings,
      final bool showQueue,
      final bool loading,
      final bool displayControls}) = _$TvPlayerControlsStateImpl;
  const _TvPlayerControlsState._() : super._();

  @override
  double get controlsOpacity;
  @override
  bool get showSettings;
  @override
  bool get showQueue;
  @override
  bool get loading;
  @override
  bool get displayControls;

  /// Create a copy of TvPlayerControlsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvPlayerControlsStateImplCopyWith<_$TvPlayerControlsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
