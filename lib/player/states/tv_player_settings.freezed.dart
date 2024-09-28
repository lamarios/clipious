// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_player_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TvPlayerSettingsState {
  Tabs get selected => throw _privateConstructorUsedError;
  SleepTimer get sleepTimer => throw _privateConstructorUsedError;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TvPlayerSettingsStateCopyWith<TvPlayerSettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvPlayerSettingsStateCopyWith<$Res> {
  factory $TvPlayerSettingsStateCopyWith(TvPlayerSettingsState value,
          $Res Function(TvPlayerSettingsState) then) =
      _$TvPlayerSettingsStateCopyWithImpl<$Res, TvPlayerSettingsState>;
  @useResult
  $Res call({Tabs selected, SleepTimer sleepTimer});

  $SleepTimerCopyWith<$Res> get sleepTimer;
}

/// @nodoc
class _$TvPlayerSettingsStateCopyWithImpl<$Res,
        $Val extends TvPlayerSettingsState>
    implements $TvPlayerSettingsStateCopyWith<$Res> {
  _$TvPlayerSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? sleepTimer = null,
  }) {
    return _then(_value.copyWith(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Tabs,
      sleepTimer: null == sleepTimer
          ? _value.sleepTimer
          : sleepTimer // ignore: cast_nullable_to_non_nullable
              as SleepTimer,
    ) as $Val);
  }

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SleepTimerCopyWith<$Res> get sleepTimer {
    return $SleepTimerCopyWith<$Res>(_value.sleepTimer, (value) {
      return _then(_value.copyWith(sleepTimer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TvPlayerSettingsStateImplCopyWith<$Res>
    implements $TvPlayerSettingsStateCopyWith<$Res> {
  factory _$$TvPlayerSettingsStateImplCopyWith(
          _$TvPlayerSettingsStateImpl value,
          $Res Function(_$TvPlayerSettingsStateImpl) then) =
      __$$TvPlayerSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tabs selected, SleepTimer sleepTimer});

  @override
  $SleepTimerCopyWith<$Res> get sleepTimer;
}

/// @nodoc
class __$$TvPlayerSettingsStateImplCopyWithImpl<$Res>
    extends _$TvPlayerSettingsStateCopyWithImpl<$Res,
        _$TvPlayerSettingsStateImpl>
    implements _$$TvPlayerSettingsStateImplCopyWith<$Res> {
  __$$TvPlayerSettingsStateImplCopyWithImpl(_$TvPlayerSettingsStateImpl _value,
      $Res Function(_$TvPlayerSettingsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
    Object? sleepTimer = null,
  }) {
    return _then(_$TvPlayerSettingsStateImpl(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Tabs,
      sleepTimer: null == sleepTimer
          ? _value.sleepTimer
          : sleepTimer // ignore: cast_nullable_to_non_nullable
              as SleepTimer,
    ));
  }
}

/// @nodoc

class _$TvPlayerSettingsStateImpl implements _TvPlayerSettingsState {
  const _$TvPlayerSettingsStateImpl(
      {this.selected = Tabs.video, this.sleepTimer = const SleepTimer()});

  @override
  @JsonKey()
  final Tabs selected;
  @override
  @JsonKey()
  final SleepTimer sleepTimer;

  @override
  String toString() {
    return 'TvPlayerSettingsState(selected: $selected, sleepTimer: $sleepTimer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvPlayerSettingsStateImpl &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            (identical(other.sleepTimer, sleepTimer) ||
                other.sleepTimer == sleepTimer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selected, sleepTimer);

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TvPlayerSettingsStateImplCopyWith<_$TvPlayerSettingsStateImpl>
      get copyWith => __$$TvPlayerSettingsStateImplCopyWithImpl<
          _$TvPlayerSettingsStateImpl>(this, _$identity);
}

abstract class _TvPlayerSettingsState implements TvPlayerSettingsState {
  const factory _TvPlayerSettingsState(
      {final Tabs selected,
      final SleepTimer sleepTimer}) = _$TvPlayerSettingsStateImpl;

  @override
  Tabs get selected;
  @override
  SleepTimer get sleepTimer;

  /// Create a copy of TvPlayerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TvPlayerSettingsStateImplCopyWith<_$TvPlayerSettingsStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
