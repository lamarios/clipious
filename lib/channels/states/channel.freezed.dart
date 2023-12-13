// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ChannelController {
  String get channelId => throw _privateConstructorUsedError;
  bool get isSubscribed => throw _privateConstructorUsedError;
  dynamic get selectedIndex => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  bool get smallHeader => throw _privateConstructorUsedError;
  double get barHeight => throw _privateConstructorUsedError;
  double get barOpacity => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ChannelControllerCopyWith<ChannelController> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChannelControllerCopyWith<$Res> {
  factory $ChannelControllerCopyWith(ChannelController value, $Res Function(ChannelController) then) =
      _$ChannelControllerCopyWithImpl<$Res, ChannelController>;
  @useResult
  $Res call(
      {String channelId,
      bool isSubscribed,
      dynamic selectedIndex,
      Channel? channel,
      bool loading,
      bool smallHeader,
      double barHeight,
      double barOpacity});
}

/// @nodoc
class _$ChannelControllerCopyWithImpl<$Res, $Val extends ChannelController>
    implements $ChannelControllerCopyWith<$Res> {
  _$ChannelControllerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isSubscribed = null,
    Object? selectedIndex = freezed,
    Object? channel = freezed,
    Object? loading = null,
    Object? smallHeader = null,
    Object? barHeight = null,
    Object? barOpacity = null,
  }) {
    return _then(_value.copyWith(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: freezed == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as dynamic,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      smallHeader: null == smallHeader
          ? _value.smallHeader
          : smallHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      barHeight: null == barHeight
          ? _value.barHeight
          : barHeight // ignore: cast_nullable_to_non_nullable
              as double,
      barOpacity: null == barOpacity
          ? _value.barOpacity
          : barOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChannelControllerImplCopyWith<$Res> implements $ChannelControllerCopyWith<$Res> {
  factory _$$ChannelControllerImplCopyWith(_$ChannelControllerImpl value, $Res Function(_$ChannelControllerImpl) then) =
      __$$ChannelControllerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String channelId,
      bool isSubscribed,
      dynamic selectedIndex,
      Channel? channel,
      bool loading,
      bool smallHeader,
      double barHeight,
      double barOpacity});
}

/// @nodoc
class __$$ChannelControllerImplCopyWithImpl<$Res> extends _$ChannelControllerCopyWithImpl<$Res, _$ChannelControllerImpl>
    implements _$$ChannelControllerImplCopyWith<$Res> {
  __$$ChannelControllerImplCopyWithImpl(_$ChannelControllerImpl _value, $Res Function(_$ChannelControllerImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isSubscribed = null,
    Object? selectedIndex = freezed,
    Object? channel = freezed,
    Object? loading = null,
    Object? smallHeader = null,
    Object? barHeight = null,
    Object? barOpacity = null,
  }) {
    return _then(_$ChannelControllerImpl(
      channelId: null == channelId
          ? _value.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribed: null == isSubscribed
          ? _value.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedIndex: freezed == selectedIndex ? _value.selectedIndex! : selectedIndex,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      smallHeader: null == smallHeader
          ? _value.smallHeader
          : smallHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      barHeight: null == barHeight
          ? _value.barHeight
          : barHeight // ignore: cast_nullable_to_non_nullable
              as double,
      barOpacity: null == barOpacity
          ? _value.barOpacity
          : barOpacity // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$ChannelControllerImpl implements _ChannelController {
  const _$ChannelControllerImpl(
      {required this.channelId,
      this.isSubscribed = false,
      this.selectedIndex = 0,
      this.channel,
      this.loading = true,
      this.smallHeader = false,
      this.barHeight = 200,
      this.barOpacity = 1});

  @override
  final String channelId;
  @override
  @JsonKey()
  final bool isSubscribed;
  @override
  @JsonKey()
  final dynamic selectedIndex;
  @override
  final Channel? channel;
  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool smallHeader;
  @override
  @JsonKey()
  final double barHeight;
  @override
  @JsonKey()
  final double barOpacity;

  @override
  String toString() {
    return 'ChannelController(channelId: $channelId, isSubscribed: $isSubscribed, selectedIndex: $selectedIndex, channel: $channel, loading: $loading, smallHeader: $smallHeader, barHeight: $barHeight, barOpacity: $barOpacity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChannelControllerImpl &&
            (identical(other.channelId, channelId) || other.channelId == channelId) &&
            (identical(other.isSubscribed, isSubscribed) || other.isSubscribed == isSubscribed) &&
            const DeepCollectionEquality().equals(other.selectedIndex, selectedIndex) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.smallHeader, smallHeader) || other.smallHeader == smallHeader) &&
            (identical(other.barHeight, barHeight) || other.barHeight == barHeight) &&
            (identical(other.barOpacity, barOpacity) || other.barOpacity == barOpacity));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, isSubscribed,
      const DeepCollectionEquality().hash(selectedIndex), channel, loading, smallHeader, barHeight, barOpacity);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChannelControllerImplCopyWith<_$ChannelControllerImpl> get copyWith =>
      __$$ChannelControllerImplCopyWithImpl<_$ChannelControllerImpl>(this, _$identity);
}

abstract class _ChannelController implements ChannelController {
  const factory _ChannelController(
      {required final String channelId,
      final bool isSubscribed,
      final dynamic selectedIndex,
      final Channel? channel,
      final bool loading,
      final bool smallHeader,
      final double barHeight,
      final double barOpacity}) = _$ChannelControllerImpl;

  @override
  String get channelId;
  @override
  bool get isSubscribed;
  @override
  dynamic get selectedIndex;
  @override
  Channel? get channel;
  @override
  bool get loading;
  @override
  bool get smallHeader;
  @override
  double get barHeight;
  @override
  double get barOpacity;
  @override
  @JsonKey(ignore: true)
  _$$ChannelControllerImplCopyWith<_$ChannelControllerImpl> get copyWith => throw _privateConstructorUsedError;
}
