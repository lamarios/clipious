// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_filter_edit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VideoFilterEditState {
  VideoFilter? get filter => throw _privateConstructorUsedError;
  int get searchPage => throw _privateConstructorUsedError;
  Channel? get channel => throw _privateConstructorUsedError;
  List<Channel> get channelResults => throw _privateConstructorUsedError;
  dynamic get showDateSettings => throw _privateConstructorUsedError;

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VideoFilterEditStateCopyWith<VideoFilterEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFilterEditStateCopyWith<$Res> {
  factory $VideoFilterEditStateCopyWith(VideoFilterEditState value,
          $Res Function(VideoFilterEditState) then) =
      _$VideoFilterEditStateCopyWithImpl<$Res, VideoFilterEditState>;
  @useResult
  $Res call(
      {VideoFilter? filter,
      int searchPage,
      Channel? channel,
      List<Channel> channelResults,
      dynamic showDateSettings});
}

/// @nodoc
class _$VideoFilterEditStateCopyWithImpl<$Res,
        $Val extends VideoFilterEditState>
    implements $VideoFilterEditStateCopyWith<$Res> {
  _$VideoFilterEditStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? searchPage = null,
    Object? channel = freezed,
    Object? channelResults = null,
    Object? showDateSettings = freezed,
  }) {
    return _then(_value.copyWith(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as VideoFilter?,
      searchPage: null == searchPage
          ? _value.searchPage
          : searchPage // ignore: cast_nullable_to_non_nullable
              as int,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      channelResults: null == channelResults
          ? _value.channelResults
          : channelResults // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
      showDateSettings: freezed == showDateSettings
          ? _value.showDateSettings
          : showDateSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoFilterEditStateImplCopyWith<$Res>
    implements $VideoFilterEditStateCopyWith<$Res> {
  factory _$$VideoFilterEditStateImplCopyWith(_$VideoFilterEditStateImpl value,
          $Res Function(_$VideoFilterEditStateImpl) then) =
      __$$VideoFilterEditStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {VideoFilter? filter,
      int searchPage,
      Channel? channel,
      List<Channel> channelResults,
      dynamic showDateSettings});
}

/// @nodoc
class __$$VideoFilterEditStateImplCopyWithImpl<$Res>
    extends _$VideoFilterEditStateCopyWithImpl<$Res, _$VideoFilterEditStateImpl>
    implements _$$VideoFilterEditStateImplCopyWith<$Res> {
  __$$VideoFilterEditStateImplCopyWithImpl(_$VideoFilterEditStateImpl _value,
      $Res Function(_$VideoFilterEditStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filter = freezed,
    Object? searchPage = null,
    Object? channel = freezed,
    Object? channelResults = null,
    Object? showDateSettings = freezed,
  }) {
    return _then(_$VideoFilterEditStateImpl(
      filter: freezed == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as VideoFilter?,
      searchPage: null == searchPage
          ? _value.searchPage
          : searchPage // ignore: cast_nullable_to_non_nullable
              as int,
      channel: freezed == channel
          ? _value.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      channelResults: null == channelResults
          ? _value._channelResults
          : channelResults // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
      showDateSettings: freezed == showDateSettings
          ? _value.showDateSettings!
          : showDateSettings,
    ));
  }
}

/// @nodoc

class _$VideoFilterEditStateImpl implements _VideoFilterEditState {
  const _$VideoFilterEditStateImpl(
      {this.filter,
      this.searchPage = 1,
      this.channel,
      final List<Channel> channelResults = const [],
      this.showDateSettings = false})
      : _channelResults = channelResults;

  @override
  final VideoFilter? filter;
  @override
  @JsonKey()
  final int searchPage;
  @override
  final Channel? channel;
  final List<Channel> _channelResults;
  @override
  @JsonKey()
  List<Channel> get channelResults {
    if (_channelResults is EqualUnmodifiableListView) return _channelResults;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_channelResults);
  }

  @override
  @JsonKey()
  final dynamic showDateSettings;

  @override
  String toString() {
    return 'VideoFilterEditState(filter: $filter, searchPage: $searchPage, channel: $channel, channelResults: $channelResults, showDateSettings: $showDateSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoFilterEditStateImpl &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.searchPage, searchPage) ||
                other.searchPage == searchPage) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            const DeepCollectionEquality()
                .equals(other._channelResults, _channelResults) &&
            const DeepCollectionEquality()
                .equals(other.showDateSettings, showDateSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      filter,
      searchPage,
      channel,
      const DeepCollectionEquality().hash(_channelResults),
      const DeepCollectionEquality().hash(showDateSettings));

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoFilterEditStateImplCopyWith<_$VideoFilterEditStateImpl>
      get copyWith =>
          __$$VideoFilterEditStateImplCopyWithImpl<_$VideoFilterEditStateImpl>(
              this, _$identity);
}

abstract class _VideoFilterEditState implements VideoFilterEditState {
  const factory _VideoFilterEditState(
      {final VideoFilter? filter,
      final int searchPage,
      final Channel? channel,
      final List<Channel> channelResults,
      final dynamic showDateSettings}) = _$VideoFilterEditStateImpl;

  @override
  VideoFilter? get filter;
  @override
  int get searchPage;
  @override
  Channel? get channel;
  @override
  List<Channel> get channelResults;
  @override
  dynamic get showDateSettings;

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoFilterEditStateImplCopyWith<_$VideoFilterEditStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
