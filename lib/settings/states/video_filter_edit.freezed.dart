// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_filter_edit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoFilterEditState {
  VideoFilter? get filter;
  int get searchPage;
  Channel? get channel;
  List<Channel> get channelResults;
  dynamic get showDateSettings;

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoFilterEditStateCopyWith<VideoFilterEditState> get copyWith =>
      _$VideoFilterEditStateCopyWithImpl<VideoFilterEditState>(
          this as VideoFilterEditState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoFilterEditState &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.searchPage, searchPage) ||
                other.searchPage == searchPage) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            const DeepCollectionEquality()
                .equals(other.channelResults, channelResults) &&
            const DeepCollectionEquality()
                .equals(other.showDateSettings, showDateSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      filter,
      searchPage,
      channel,
      const DeepCollectionEquality().hash(channelResults),
      const DeepCollectionEquality().hash(showDateSettings));

  @override
  String toString() {
    return 'VideoFilterEditState(filter: $filter, searchPage: $searchPage, channel: $channel, channelResults: $channelResults, showDateSettings: $showDateSettings)';
  }
}

/// @nodoc
abstract mixin class $VideoFilterEditStateCopyWith<$Res> {
  factory $VideoFilterEditStateCopyWith(VideoFilterEditState value,
          $Res Function(VideoFilterEditState) _then) =
      _$VideoFilterEditStateCopyWithImpl;
  @useResult
  $Res call(
      {VideoFilter? filter,
      int searchPage,
      Channel? channel,
      List<Channel> channelResults,
      dynamic showDateSettings});
}

/// @nodoc
class _$VideoFilterEditStateCopyWithImpl<$Res>
    implements $VideoFilterEditStateCopyWith<$Res> {
  _$VideoFilterEditStateCopyWithImpl(this._self, this._then);

  final VideoFilterEditState _self;
  final $Res Function(VideoFilterEditState) _then;

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
    return _then(_self.copyWith(
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as VideoFilter?,
      searchPage: null == searchPage
          ? _self.searchPage
          : searchPage // ignore: cast_nullable_to_non_nullable
              as int,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      channelResults: null == channelResults
          ? _self.channelResults
          : channelResults // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
      showDateSettings: freezed == showDateSettings
          ? _self.showDateSettings
          : showDateSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// Adds pattern-matching-related methods to [VideoFilterEditState].
extension VideoFilterEditStatePatterns on VideoFilterEditState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_VideoFilterEditState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoFilterEditState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_VideoFilterEditState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterEditState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_VideoFilterEditState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterEditState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(VideoFilter? filter, int searchPage, Channel? channel,
            List<Channel> channelResults, dynamic showDateSettings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoFilterEditState() when $default != null:
        return $default(_that.filter, _that.searchPage, _that.channel,
            _that.channelResults, _that.showDateSettings);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(VideoFilter? filter, int searchPage, Channel? channel,
            List<Channel> channelResults, dynamic showDateSettings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterEditState():
        return $default(_that.filter, _that.searchPage, _that.channel,
            _that.channelResults, _that.showDateSettings);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(VideoFilter? filter, int searchPage, Channel? channel,
            List<Channel> channelResults, dynamic showDateSettings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoFilterEditState() when $default != null:
        return $default(_that.filter, _that.searchPage, _that.channel,
            _that.channelResults, _that.showDateSettings);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoFilterEditState implements VideoFilterEditState {
  const _VideoFilterEditState(
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

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoFilterEditStateCopyWith<_VideoFilterEditState> get copyWith =>
      __$VideoFilterEditStateCopyWithImpl<_VideoFilterEditState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoFilterEditState &&
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

  @override
  String toString() {
    return 'VideoFilterEditState(filter: $filter, searchPage: $searchPage, channel: $channel, channelResults: $channelResults, showDateSettings: $showDateSettings)';
  }
}

/// @nodoc
abstract mixin class _$VideoFilterEditStateCopyWith<$Res>
    implements $VideoFilterEditStateCopyWith<$Res> {
  factory _$VideoFilterEditStateCopyWith(_VideoFilterEditState value,
          $Res Function(_VideoFilterEditState) _then) =
      __$VideoFilterEditStateCopyWithImpl;
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
class __$VideoFilterEditStateCopyWithImpl<$Res>
    implements _$VideoFilterEditStateCopyWith<$Res> {
  __$VideoFilterEditStateCopyWithImpl(this._self, this._then);

  final _VideoFilterEditState _self;
  final $Res Function(_VideoFilterEditState) _then;

  /// Create a copy of VideoFilterEditState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? filter = freezed,
    Object? searchPage = null,
    Object? channel = freezed,
    Object? channelResults = null,
    Object? showDateSettings = freezed,
  }) {
    return _then(_VideoFilterEditState(
      filter: freezed == filter
          ? _self.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as VideoFilter?,
      searchPage: null == searchPage
          ? _self.searchPage
          : searchPage // ignore: cast_nullable_to_non_nullable
              as int,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      channelResults: null == channelResults
          ? _self._channelResults
          : channelResults // ignore: cast_nullable_to_non_nullable
              as List<Channel>,
      showDateSettings: freezed == showDateSettings
          ? _self.showDateSettings
          : showDateSettings // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

// dart format on
