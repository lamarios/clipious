// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offline_subscription.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

OfflineSubscription _$OfflineSubscriptionFromJson(Map<String, dynamic> json) {
  return _OfflineSubscription.fromJson(json);
}

/// @nodoc
mixin _$OfflineSubscription {
  String get channelId => throw _privateConstructorUsedError;
  String get channelName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OfflineSubscriptionCopyWith<OfflineSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OfflineSubscriptionCopyWith<$Res> {
  factory $OfflineSubscriptionCopyWith(
          OfflineSubscription value, $Res Function(OfflineSubscription) then) =
      _$OfflineSubscriptionCopyWithImpl<$Res, OfflineSubscription>;
  @useResult
  $Res call({String channelId, String channelName});
}

/// @nodoc
class _$OfflineSubscriptionCopyWithImpl<$Res, $Val extends OfflineSubscription>
    implements $OfflineSubscriptionCopyWith<$Res> {
  _$OfflineSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OfflineSubscriptionImplCopyWith<$Res>
    implements $OfflineSubscriptionCopyWith<$Res> {
  factory _$$OfflineSubscriptionImplCopyWith(_$OfflineSubscriptionImpl value,
          $Res Function(_$OfflineSubscriptionImpl) then) =
      __$$OfflineSubscriptionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String channelId, String channelName});
}

/// @nodoc
class __$$OfflineSubscriptionImplCopyWithImpl<$Res>
    extends _$OfflineSubscriptionCopyWithImpl<$Res, _$OfflineSubscriptionImpl>
    implements _$$OfflineSubscriptionImplCopyWith<$Res> {
  __$$OfflineSubscriptionImplCopyWithImpl(_$OfflineSubscriptionImpl _value,
      $Res Function(_$OfflineSubscriptionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
  }) {
    return _then(_$OfflineSubscriptionImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      channelName: null == channelName
          ? _value.channelName
          : channelName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OfflineSubscriptionImpl implements _OfflineSubscription {
  const _$OfflineSubscriptionImpl(
      {required this.channelId, required this.channelName});

  factory _$OfflineSubscriptionImpl.fromJson(Map<String, dynamic> json) =>
      _$$OfflineSubscriptionImplFromJson(json);

  @override
  final String channelId;
  @override
  final String channelName;

  @override
  String toString() {
    return 'OfflineSubscription(channelId: $channelId, channelName: $channelName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OfflineSubscriptionImpl &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, channelId, channelName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OfflineSubscriptionImplCopyWith<_$OfflineSubscriptionImpl> get copyWith =>
      __$$OfflineSubscriptionImplCopyWithImpl<_$OfflineSubscriptionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OfflineSubscriptionImplToJson(
      this,
    );
  }
}

abstract class _OfflineSubscription implements OfflineSubscription {
  const factory _OfflineSubscription(
      {required final String channelId,
      required final String channelName}) = _$OfflineSubscriptionImpl;

  factory _OfflineSubscription.fromJson(Map<String, dynamic> json) =
      _$OfflineSubscriptionImpl.fromJson;

  @override
  String get channelId;
  @override
  String get channelName;
  @override
  @JsonKey(ignore: true)
  _$$OfflineSubscriptionImplCopyWith<_$OfflineSubscriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
