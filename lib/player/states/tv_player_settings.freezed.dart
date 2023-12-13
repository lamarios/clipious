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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TvPlayerSettingsState {
  Tabs get selected => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TvPlayerSettingsStateCopyWith<TvPlayerSettingsState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvPlayerSettingsStateCopyWith<$Res> {
  factory $TvPlayerSettingsStateCopyWith(TvPlayerSettingsState value, $Res Function(TvPlayerSettingsState) then) =
      _$TvPlayerSettingsStateCopyWithImpl<$Res, TvPlayerSettingsState>;
  @useResult
  $Res call({Tabs selected});
}

/// @nodoc
class _$TvPlayerSettingsStateCopyWithImpl<$Res, $Val extends TvPlayerSettingsState>
    implements $TvPlayerSettingsStateCopyWith<$Res> {
  _$TvPlayerSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
  }) {
    return _then(_value.copyWith(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Tabs,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvPlayerSettingsStateImplCopyWith<$Res> implements $TvPlayerSettingsStateCopyWith<$Res> {
  factory _$$TvPlayerSettingsStateImplCopyWith(
          _$TvPlayerSettingsStateImpl value, $Res Function(_$TvPlayerSettingsStateImpl) then) =
      __$$TvPlayerSettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tabs selected});
}

/// @nodoc
class __$$TvPlayerSettingsStateImplCopyWithImpl<$Res>
    extends _$TvPlayerSettingsStateCopyWithImpl<$Res, _$TvPlayerSettingsStateImpl>
    implements _$$TvPlayerSettingsStateImplCopyWith<$Res> {
  __$$TvPlayerSettingsStateImplCopyWithImpl(
      _$TvPlayerSettingsStateImpl _value, $Res Function(_$TvPlayerSettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = null,
  }) {
    return _then(_$TvPlayerSettingsStateImpl(
      selected: null == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Tabs,
    ));
  }
}

/// @nodoc

class _$TvPlayerSettingsStateImpl implements _TvPlayerSettingsState {
  const _$TvPlayerSettingsStateImpl({this.selected = Tabs.video});

  @override
  @JsonKey()
  final Tabs selected;

  @override
  String toString() {
    return 'TvPlayerSettingsState(selected: $selected)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvPlayerSettingsStateImpl &&
            (identical(other.selected, selected) || other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selected);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvPlayerSettingsStateImplCopyWith<_$TvPlayerSettingsStateImpl> get copyWith =>
      __$$TvPlayerSettingsStateImplCopyWithImpl<_$TvPlayerSettingsStateImpl>(this, _$identity);
}

abstract class _TvPlayerSettingsState implements TvPlayerSettingsState {
  const factory _TvPlayerSettingsState({final Tabs selected}) = _$TvPlayerSettingsStateImpl;

  @override
  Tabs get selected;
  @override
  @JsonKey(ignore: true)
  _$$TvPlayerSettingsStateImplCopyWith<_$TvPlayerSettingsStateImpl> get copyWith => throw _privateConstructorUsedError;
}
