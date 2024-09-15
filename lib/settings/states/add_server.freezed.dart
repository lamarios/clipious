// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_server.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddServerState {
  bool get loading => throw _privateConstructorUsedError;
  bool get valid => throw _privateConstructorUsedError;
  bool get showAdvanced => throw _privateConstructorUsedError;
  bool get advancedTest => throw _privateConstructorUsedError;
  Map<String, String> get headers => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddServerStateCopyWith<AddServerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddServerStateCopyWith<$Res> {
  factory $AddServerStateCopyWith(
          AddServerState value, $Res Function(AddServerState) then) =
      _$AddServerStateCopyWithImpl<$Res, AddServerState>;
  @useResult
  $Res call(
      {bool loading,
      bool valid,
      bool showAdvanced,
      bool advancedTest,
      Map<String, String> headers});
}

/// @nodoc
class _$AddServerStateCopyWithImpl<$Res, $Val extends AddServerState>
    implements $AddServerStateCopyWith<$Res> {
  _$AddServerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? valid = null,
    Object? showAdvanced = null,
    Object? advancedTest = null,
    Object? headers = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      showAdvanced: null == showAdvanced
          ? _value.showAdvanced
          : showAdvanced // ignore: cast_nullable_to_non_nullable
              as bool,
      advancedTest: null == advancedTest
          ? _value.advancedTest
          : advancedTest // ignore: cast_nullable_to_non_nullable
              as bool,
      headers: null == headers
          ? _value.headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddServerStateImplCopyWith<$Res>
    implements $AddServerStateCopyWith<$Res> {
  factory _$$AddServerStateImplCopyWith(_$AddServerStateImpl value,
          $Res Function(_$AddServerStateImpl) then) =
      __$$AddServerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      bool valid,
      bool showAdvanced,
      bool advancedTest,
      Map<String, String> headers});
}

/// @nodoc
class __$$AddServerStateImplCopyWithImpl<$Res>
    extends _$AddServerStateCopyWithImpl<$Res, _$AddServerStateImpl>
    implements _$$AddServerStateImplCopyWith<$Res> {
  __$$AddServerStateImplCopyWithImpl(
      _$AddServerStateImpl _value, $Res Function(_$AddServerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? valid = null,
    Object? showAdvanced = null,
    Object? advancedTest = null,
    Object? headers = null,
  }) {
    return _then(_$AddServerStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      valid: null == valid
          ? _value.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as bool,
      showAdvanced: null == showAdvanced
          ? _value.showAdvanced
          : showAdvanced // ignore: cast_nullable_to_non_nullable
              as bool,
      advancedTest: null == advancedTest
          ? _value.advancedTest
          : advancedTest // ignore: cast_nullable_to_non_nullable
              as bool,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$AddServerStateImpl implements _AddServerState {
  const _$AddServerStateImpl(
      {this.loading = false,
      this.valid = false,
      this.showAdvanced = false,
      this.advancedTest = true,
      final Map<String, String> headers = const {}})
      : _headers = headers;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool valid;
  @override
  @JsonKey()
  final bool showAdvanced;
  @override
  @JsonKey()
  final bool advancedTest;
  final Map<String, String> _headers;
  @override
  @JsonKey()
  Map<String, String> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @override
  String toString() {
    return 'AddServerState(loading: $loading, valid: $valid, showAdvanced: $showAdvanced, advancedTest: $advancedTest, headers: $headers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddServerStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.showAdvanced, showAdvanced) ||
                other.showAdvanced == showAdvanced) &&
            (identical(other.advancedTest, advancedTest) ||
                other.advancedTest == advancedTest) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, valid, showAdvanced,
      advancedTest, const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddServerStateImplCopyWith<_$AddServerStateImpl> get copyWith =>
      __$$AddServerStateImplCopyWithImpl<_$AddServerStateImpl>(
          this, _$identity);
}

abstract class _AddServerState implements AddServerState {
  const factory _AddServerState(
      {final bool loading,
      final bool valid,
      final bool showAdvanced,
      final bool advancedTest,
      final Map<String, String> headers}) = _$AddServerStateImpl;

  @override
  bool get loading;
  @override
  bool get valid;
  @override
  bool get showAdvanced;
  @override
  bool get advancedTest;
  @override
  Map<String, String> get headers;
  @override
  @JsonKey(ignore: true)
  _$$AddServerStateImplCopyWith<_$AddServerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
