// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'channel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChannelController {
  String get channelId;
  bool get isSubscribed;
  Channel? get channel;
  bool get loading;
  bool get smallHeader;
  double get barHeight;
  double get barOpacity;
  ChannelSortBy get sortBy;

  /// Create a copy of ChannelController
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChannelControllerCopyWith<ChannelController> get copyWith =>
      _$ChannelControllerCopyWithImpl<ChannelController>(
          this as ChannelController, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChannelController &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.smallHeader, smallHeader) ||
                other.smallHeader == smallHeader) &&
            (identical(other.barHeight, barHeight) ||
                other.barHeight == barHeight) &&
            (identical(other.barOpacity, barOpacity) ||
                other.barOpacity == barOpacity) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, isSubscribed, channel,
      loading, smallHeader, barHeight, barOpacity, sortBy);

  @override
  String toString() {
    return 'ChannelController(channelId: $channelId, isSubscribed: $isSubscribed, channel: $channel, loading: $loading, smallHeader: $smallHeader, barHeight: $barHeight, barOpacity: $barOpacity, sortBy: $sortBy)';
  }
}

/// @nodoc
abstract mixin class $ChannelControllerCopyWith<$Res> {
  factory $ChannelControllerCopyWith(
          ChannelController value, $Res Function(ChannelController) _then) =
      _$ChannelControllerCopyWithImpl;
  @useResult
  $Res call(
      {String channelId,
      bool isSubscribed,
      Channel? channel,
      bool loading,
      bool smallHeader,
      double barHeight,
      double barOpacity,
      ChannelSortBy sortBy});
}

/// @nodoc
class _$ChannelControllerCopyWithImpl<$Res>
    implements $ChannelControllerCopyWith<$Res> {
  _$ChannelControllerCopyWithImpl(this._self, this._then);

  final ChannelController _self;
  final $Res Function(ChannelController) _then;

  /// Create a copy of ChannelController
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? isSubscribed = null,
    Object? channel = freezed,
    Object? loading = null,
    Object? smallHeader = null,
    Object? barHeight = null,
    Object? barOpacity = null,
    Object? sortBy = null,
  }) {
    return _then(_self.copyWith(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribed: null == isSubscribed
          ? _self.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      smallHeader: null == smallHeader
          ? _self.smallHeader
          : smallHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      barHeight: null == barHeight
          ? _self.barHeight
          : barHeight // ignore: cast_nullable_to_non_nullable
              as double,
      barOpacity: null == barOpacity
          ? _self.barOpacity
          : barOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as ChannelSortBy,
    ));
  }
}

/// Adds pattern-matching-related methods to [ChannelController].
extension ChannelControllerPatterns on ChannelController {
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
    TResult Function(_ChannelController value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelController() when $default != null:
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
    TResult Function(_ChannelController value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelController():
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
    TResult? Function(_ChannelController value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelController() when $default != null:
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
    TResult Function(
            String channelId,
            bool isSubscribed,
            Channel? channel,
            bool loading,
            bool smallHeader,
            double barHeight,
            double barOpacity,
            ChannelSortBy sortBy)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChannelController() when $default != null:
        return $default(
            _that.channelId,
            _that.isSubscribed,
            _that.channel,
            _that.loading,
            _that.smallHeader,
            _that.barHeight,
            _that.barOpacity,
            _that.sortBy);
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
    TResult Function(
            String channelId,
            bool isSubscribed,
            Channel? channel,
            bool loading,
            bool smallHeader,
            double barHeight,
            double barOpacity,
            ChannelSortBy sortBy)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelController():
        return $default(
            _that.channelId,
            _that.isSubscribed,
            _that.channel,
            _that.loading,
            _that.smallHeader,
            _that.barHeight,
            _that.barOpacity,
            _that.sortBy);
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
    TResult? Function(
            String channelId,
            bool isSubscribed,
            Channel? channel,
            bool loading,
            bool smallHeader,
            double barHeight,
            double barOpacity,
            ChannelSortBy sortBy)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChannelController() when $default != null:
        return $default(
            _that.channelId,
            _that.isSubscribed,
            _that.channel,
            _that.loading,
            _that.smallHeader,
            _that.barHeight,
            _that.barOpacity,
            _that.sortBy);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChannelController implements ChannelController {
  const _ChannelController(
      {required this.channelId,
      this.isSubscribed = false,
      this.channel,
      this.loading = true,
      this.smallHeader = false,
      this.barHeight = 200,
      this.barOpacity = 1,
      this.sortBy = ChannelSortBy.newest});

  @override
  final String channelId;
  @override
  @JsonKey()
  final bool isSubscribed;
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
  @JsonKey()
  final ChannelSortBy sortBy;

  /// Create a copy of ChannelController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChannelControllerCopyWith<_ChannelController> get copyWith =>
      __$ChannelControllerCopyWithImpl<_ChannelController>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChannelController &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.isSubscribed, isSubscribed) ||
                other.isSubscribed == isSubscribed) &&
            (identical(other.channel, channel) || other.channel == channel) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.smallHeader, smallHeader) ||
                other.smallHeader == smallHeader) &&
            (identical(other.barHeight, barHeight) ||
                other.barHeight == barHeight) &&
            (identical(other.barOpacity, barOpacity) ||
                other.barOpacity == barOpacity) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, channelId, isSubscribed, channel,
      loading, smallHeader, barHeight, barOpacity, sortBy);

  @override
  String toString() {
    return 'ChannelController(channelId: $channelId, isSubscribed: $isSubscribed, channel: $channel, loading: $loading, smallHeader: $smallHeader, barHeight: $barHeight, barOpacity: $barOpacity, sortBy: $sortBy)';
  }
}

/// @nodoc
abstract mixin class _$ChannelControllerCopyWith<$Res>
    implements $ChannelControllerCopyWith<$Res> {
  factory _$ChannelControllerCopyWith(
          _ChannelController value, $Res Function(_ChannelController) _then) =
      __$ChannelControllerCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String channelId,
      bool isSubscribed,
      Channel? channel,
      bool loading,
      bool smallHeader,
      double barHeight,
      double barOpacity,
      ChannelSortBy sortBy});
}

/// @nodoc
class __$ChannelControllerCopyWithImpl<$Res>
    implements _$ChannelControllerCopyWith<$Res> {
  __$ChannelControllerCopyWithImpl(this._self, this._then);

  final _ChannelController _self;
  final $Res Function(_ChannelController) _then;

  /// Create a copy of ChannelController
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? isSubscribed = null,
    Object? channel = freezed,
    Object? loading = null,
    Object? smallHeader = null,
    Object? barHeight = null,
    Object? barOpacity = null,
    Object? sortBy = null,
  }) {
    return _then(_ChannelController(
      channelId: null == channelId
          ? _self.channelId
          : channelId // ignore: cast_nullable_to_non_nullable
              as String,
      isSubscribed: null == isSubscribed
          ? _self.isSubscribed
          : isSubscribed // ignore: cast_nullable_to_non_nullable
              as bool,
      channel: freezed == channel
          ? _self.channel
          : channel // ignore: cast_nullable_to_non_nullable
              as Channel?,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      smallHeader: null == smallHeader
          ? _self.smallHeader
          : smallHeader // ignore: cast_nullable_to_non_nullable
              as bool,
      barHeight: null == barHeight
          ? _self.barHeight
          : barHeight // ignore: cast_nullable_to_non_nullable
              as double,
      barOpacity: null == barOpacity
          ? _self.barOpacity
          : barOpacity // ignore: cast_nullable_to_non_nullable
              as double,
      sortBy: null == sortBy
          ? _self.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as ChannelSortBy,
    ));
  }
}

// dart format on
