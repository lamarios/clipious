// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_filter_channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoFilterChannelState {
  List<VideoFilter> get filters => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoFilterChannelStateCopyWith<VideoFilterChannelState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFilterChannelStateCopyWith<$Res> {
  factory $VideoFilterChannelStateCopyWith(VideoFilterChannelState value,
          $Res Function(VideoFilterChannelState) then) =
      _$VideoFilterChannelStateCopyWithImpl<$Res, VideoFilterChannelState>;
  @useResult
  $Res call({List<VideoFilter> filters, Channel? channel, bool loading});
}

/// @nodoc
class _$VideoFilterChannelStateCopyWithImpl<$Res,
        $Val extends VideoFilterChannelState>
    implements $VideoFilterChannelStateCopyWith<$Res> {
  _$VideoFilterChannelStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? channel = freezed,
    Object? loading = null,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoFilterChannelStateImplCopyWith<$Res>
    implements $VideoFilterChannelStateCopyWith<$Res> {
  factory _$$VideoFilterChannelStateImplCopyWith(
          _$VideoFilterChannelStateImpl value,
          $Res Function(_$VideoFilterChannelStateImpl) then) =
      __$$VideoFilterChannelStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VideoFilter> filters, Channel? channel, bool loading});
}

/// @nodoc
class __$$VideoFilterChannelStateImplCopyWithImpl<$Res>
    extends _$VideoFilterChannelStateCopyWithImpl<$Res,
        _$VideoFilterChannelStateImpl>
    implements _$$VideoFilterChannelStateImplCopyWith<$Res> {
  __$$VideoFilterChannelStateImplCopyWithImpl(
      _$VideoFilterChannelStateImpl _value,
      $Res Function(_$VideoFilterChannelStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? channel = freezed,
    Object? loading = null,
  }) {
    return _then(_$VideoFilterChannelStateImpl(
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VideoFilterChannelStateImpl implements _VideoFilterChannelState {
  const _$VideoFilterChannelStateImpl(
      {required final List<VideoFilter> filters,
      this.channel,
      this.loading = false})
      : _filters = filters;

  final List<VideoFilter> _filters;
  @override
  List<VideoFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  final Channel? channel;
  @override
  @JsonKey()
  final bool loading;

  @override
  String toString() {
    return 'VideoFilterChannelState(filters: $filters, channel: $channel, loading: $loading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoFilterChannelStateImpl &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.loading, loading) || other.loading == loading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filters), channel, loading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoFilterChannelStateImplCopyWith<_$VideoFilterChannelStateImpl>
      get copyWith => __$$VideoFilterChannelStateImplCopyWithImpl<
          _$VideoFilterChannelStateImpl>(this, _$identity);
}

abstract class _VideoFilterChannelState implements VideoFilterChannelState {
  const factory _VideoFilterChannelState(
      {required final List<VideoFilter> filters,
      final Channel? channel,
      final bool loading}) = _$VideoFilterChannelStateImpl;

  @override
  List<VideoFilter> get filters;
  @override
  Channel? get channel;
  @override
  bool get loading;
  @override
  @JsonKey(ignore: true)
  _$$VideoFilterChannelStateImplCopyWith<_$VideoFilterChannelStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
