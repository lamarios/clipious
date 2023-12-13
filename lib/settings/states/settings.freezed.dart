// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SettingsState {
  Map<String, SettingsValue> get settings => throw _privateConstructorUsedError;
  PackageInfo get packageInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res, SettingsState>;
  @useResult
  $Res call({Map<String, SettingsValue> settings, PackageInfo packageInfo});
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res, $Val extends SettingsState> implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? packageInfo = null,
  }) {
    return _then(_value.copyWith(
      settings: null == settings
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, SettingsValue>,
      packageInfo: null == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettingsStateImplCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$$SettingsStateImplCopyWith(_$SettingsStateImpl value, $Res Function(_$SettingsStateImpl) then) =
      __$$SettingsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, SettingsValue> settings, PackageInfo packageInfo});
}

/// @nodoc
class __$$SettingsStateImplCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res, _$SettingsStateImpl>
    implements _$$SettingsStateImplCopyWith<$Res> {
  __$$SettingsStateImplCopyWithImpl(_$SettingsStateImpl _value, $Res Function(_$SettingsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? settings = null,
    Object? packageInfo = null,
  }) {
    return _then(_$SettingsStateImpl(
      settings: null == settings
          ? _value._settings
          : settings // ignore: cast_nullable_to_non_nullable
              as Map<String, SettingsValue>,
      packageInfo: null == packageInfo
          ? _value.packageInfo
          : packageInfo // ignore: cast_nullable_to_non_nullable
              as PackageInfo,
    ));
  }
}

/// @nodoc

class _$SettingsStateImpl extends _SettingsState {
  const _$SettingsStateImpl({required final Map<String, SettingsValue> settings, required this.packageInfo})
      : _settings = settings,
        super._();

  final Map<String, SettingsValue> _settings;
  @override
  Map<String, SettingsValue> get settings {
    if (_settings is EqualUnmodifiableMapView) return _settings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_settings);
  }

  @override
  final PackageInfo packageInfo;

  @override
  String toString() {
    return 'SettingsState(settings: $settings, packageInfo: $packageInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettingsStateImpl &&
            const DeepCollectionEquality().equals(other._settings, _settings) &&
            (identical(other.packageInfo, packageInfo) || other.packageInfo == packageInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(_settings), packageInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith =>
      __$$SettingsStateImplCopyWithImpl<_$SettingsStateImpl>(this, _$identity);
}

abstract class _SettingsState extends SettingsState {
  const factory _SettingsState(
      {required final Map<String, SettingsValue> settings,
      required final PackageInfo packageInfo}) = _$SettingsStateImpl;
  const _SettingsState._() : super._();

  @override
  Map<String, SettingsValue> get settings;
  @override
  PackageInfo get packageInfo;
  @override
  @JsonKey(ignore: true)
  _$$SettingsStateImplCopyWith<_$SettingsStateImpl> get copyWith => throw _privateConstructorUsedError;
}
