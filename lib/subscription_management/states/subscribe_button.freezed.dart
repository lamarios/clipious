// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subscribe_button.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SubscribeButtonState {
  String get channelId => throw _privateConstructorUsedError;
  bool get isOfflineSubscribed => throw _privateConstructorUsedError;
  bool get isAccountSubscribed => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get isLoggedIn => throw _privateConstructorUsedError;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubscribeButtonStateCopyWith<SubscribeButtonState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscribeButtonStateCopyWith<$Res> {
  factory $SubscribeButtonStateCopyWith(SubscribeButtonState value,
          $Res Function(SubscribeButtonState) then) =
      _$SubscribeButtonStateCopyWithImpl<$Res, SubscribeButtonState>;
  @useResult
  $Res call(
      {String channelId,
      bool isOfflineSubscribed,
      bool isAccountSubscribed,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class _$SubscribeButtonStateCopyWithImpl<$Res,
        $Val extends SubscribeButtonState>
    implements $SubscribeButtonStateCopyWith<$Res> {
  _$SubscribeButtonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isOfflineSubscribed = null,
    Object? isAccountSubscribed = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineSubscribed: null == isOfflineSubscribed
          ? _value.isOfflineSubscribed
          : isOfflineSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountSubscribed: null == isAccountSubscribed
          ? _value.isAccountSubscribed
          : isAccountSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscribeButtonStateImplCopyWith<$Res>
    implements $SubscribeButtonStateCopyWith<$Res> {
  factory _$$SubscribeButtonStateImplCopyWith(_$SubscribeButtonStateImpl value,
          $Res Function(_$SubscribeButtonStateImpl) then) =
      __$$SubscribeButtonStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelId,
      bool isOfflineSubscribed,
      bool isAccountSubscribed,
      bool loading,
      bool isLoggedIn});
}

/// @nodoc
class __$$SubscribeButtonStateImplCopyWithImpl<$Res>
    extends _$SubscribeButtonStateCopyWithImpl<$Res, _$SubscribeButtonStateImpl>
    implements _$$SubscribeButtonStateImplCopyWith<$Res> {
  __$$SubscribeButtonStateImplCopyWithImpl(_$SubscribeButtonStateImpl _value,
      $Res Function(_$SubscribeButtonStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isOfflineSubscribed = null,
    Object? isAccountSubscribed = null,
    Object? loading = null,
    Object? isLoggedIn = null,
  }) {
    return _then(_$SubscribeButtonStateImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isOfflineSubscribed: null == isOfflineSubscribed
          ? _value.isOfflineSubscribed
          : isOfflineSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      isAccountSubscribed: null == isAccountSubscribed
          ? _value.isAccountSubscribed
          : isAccountSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoggedIn: null == isLoggedIn
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SubscribeButtonStateImpl extends _SubscribeButtonState {
  const _$SubscribeButtonStateImpl(
      {required this.channelId,
      this.isOfflineSubscribed = false,
      this.isAccountSubscribed = false,
      this.loading = true,
      required this.isLoggedIn})
      : super._();

  @override
  final String channelId;
  @override
  @JsonKey()
  final bool isOfflineSubscribed;
  @override
  @JsonKey()
  final bool isAccountSubscribed;
  @override
  @JsonKey()
  final bool loading;
  @override
  final bool isLoggedIn;

  @override
  String toString() {
    return 'SubscribeButtonState(channelId: $channelId, isOfflineSubscribed: $isOfflineSubscribed, isAccountSubscribed: $isAccountSubscribed, loading: $loading, isLoggedIn: $isLoggedIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscribeButtonStateImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isOfflineSubscribed, isOfflineSubscribed) ||
                other.isOfflineSubscribed == isOfflineSubscribed) &&
            (identical(other.isAccountSubscribed, isAccountSubscribed) ||
                other.isAccountSubscribed == isAccountSubscribed) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                other.isLoggedIn == isLoggedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, isOfflineSubscribed,
      isAccountSubscribed, loading, isLoggedIn);

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscribeButtonStateImplCopyWith<_$SubscribeButtonStateImpl>
      get copyWith =>
          __$$SubscribeButtonStateImplCopyWithImpl<_$SubscribeButtonStateImpl>(
              this, _$identity);
}

abstract class _SubscribeButtonState extends SubscribeButtonState {
  const factory _SubscribeButtonState(
      {required final String channelId,
      final bool isOfflineSubscribed,
      final bool isAccountSubscribed,
      final bool loading,
      required final bool isLoggedIn}) = _$SubscribeButtonStateImpl;
  const _SubscribeButtonState._() : super._();

  @override
  String get channelId;
  @override
  bool get isOfflineSubscribed;
  @override
  bool get isAccountSubscribed;
  @override
  bool get loading;
  @override
  bool get isLoggedIn;

  /// Create a copy of SubscribeButtonState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubscribeButtonStateImplCopyWith<_$SubscribeButtonStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
