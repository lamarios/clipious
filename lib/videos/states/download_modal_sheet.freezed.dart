// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_modal_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DownloadModalSheetState {
  bool get audioOnly;
  bool get loading;
  List<AdaptiveFormat> get availableQualities;
  String get quality;

  /// Create a copy of DownloadModalSheetState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DownloadModalSheetStateCopyWith<DownloadModalSheetState> get copyWith =>
      _$DownloadModalSheetStateCopyWithImpl<DownloadModalSheetState>(
          this as DownloadModalSheetState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DownloadModalSheetState &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other.availableQualities, availableQualities) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioOnly, loading,
      const DeepCollectionEquality().hash(availableQualities), quality);

  @override
  String toString() {
    return 'DownloadModalSheetState(audioOnly: $audioOnly, loading: $loading, availableQualities: $availableQualities, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class $DownloadModalSheetStateCopyWith<$Res> {
  factory $DownloadModalSheetStateCopyWith(DownloadModalSheetState value,
          $Res Function(DownloadModalSheetState) _then) =
      _$DownloadModalSheetStateCopyWithImpl;
  @useResult
  $Res call(
      {bool audioOnly,
      bool loading,
      List<AdaptiveFormat> availableQualities,
      String quality});
}

/// @nodoc
class _$DownloadModalSheetStateCopyWithImpl<$Res>
    implements $DownloadModalSheetStateCopyWith<$Res> {
  _$DownloadModalSheetStateCopyWithImpl(this._self, this._then);

  final DownloadModalSheetState _self;
  final $Res Function(DownloadModalSheetState) _then;

  /// Create a copy of DownloadModalSheetState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = null,
    Object? loading = null,
    Object? availableQualities = null,
    Object? quality = null,
  }) {
    return _then(_self.copyWith(
      audioOnly: null == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      availableQualities: null == availableQualities
          ? _self.availableQualities
          : availableQualities // ignore: cast_nullable_to_non_nullable
              as List<AdaptiveFormat>,
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [DownloadModalSheetState].
extension DownloadModalSheetStatePatterns on DownloadModalSheetState {
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
    TResult Function(_DownloadModalSheetState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadModalSheetState() when $default != null:
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
    TResult Function(_DownloadModalSheetState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadModalSheetState():
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
    TResult? Function(_DownloadModalSheetState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadModalSheetState() when $default != null:
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
    TResult Function(bool audioOnly, bool loading,
            List<AdaptiveFormat> availableQualities, String quality)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _DownloadModalSheetState() when $default != null:
        return $default(_that.audioOnly, _that.loading,
            _that.availableQualities, _that.quality);
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
    TResult Function(bool audioOnly, bool loading,
            List<AdaptiveFormat> availableQualities, String quality)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadModalSheetState():
        return $default(_that.audioOnly, _that.loading,
            _that.availableQualities, _that.quality);
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
    TResult? Function(bool audioOnly, bool loading,
            List<AdaptiveFormat> availableQualities, String quality)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _DownloadModalSheetState() when $default != null:
        return $default(_that.audioOnly, _that.loading,
            _that.availableQualities, _that.quality);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _DownloadModalSheetState implements DownloadModalSheetState {
  const _DownloadModalSheetState(
      {this.audioOnly = false,
      this.loading = false,
      final List<AdaptiveFormat> availableQualities = const [],
      this.quality = '720p'})
      : _availableQualities = availableQualities;

  @override
  @JsonKey()
  final bool audioOnly;
  @override
  @JsonKey()
  final bool loading;
  final List<AdaptiveFormat> _availableQualities;
  @override
  @JsonKey()
  List<AdaptiveFormat> get availableQualities {
    if (_availableQualities is EqualUnmodifiableListView)
      return _availableQualities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableQualities);
  }

  @override
  @JsonKey()
  final String quality;

  /// Create a copy of DownloadModalSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DownloadModalSheetStateCopyWith<_DownloadModalSheetState> get copyWith =>
      __$DownloadModalSheetStateCopyWithImpl<_DownloadModalSheetState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DownloadModalSheetState &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            const DeepCollectionEquality()
                .equals(other._availableQualities, _availableQualities) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioOnly, loading,
      const DeepCollectionEquality().hash(_availableQualities), quality);

  @override
  String toString() {
    return 'DownloadModalSheetState(audioOnly: $audioOnly, loading: $loading, availableQualities: $availableQualities, quality: $quality)';
  }
}

/// @nodoc
abstract mixin class _$DownloadModalSheetStateCopyWith<$Res>
    implements $DownloadModalSheetStateCopyWith<$Res> {
  factory _$DownloadModalSheetStateCopyWith(_DownloadModalSheetState value,
          $Res Function(_DownloadModalSheetState) _then) =
      __$DownloadModalSheetStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool audioOnly,
      bool loading,
      List<AdaptiveFormat> availableQualities,
      String quality});
}

/// @nodoc
class __$DownloadModalSheetStateCopyWithImpl<$Res>
    implements _$DownloadModalSheetStateCopyWith<$Res> {
  __$DownloadModalSheetStateCopyWithImpl(this._self, this._then);

  final _DownloadModalSheetState _self;
  final $Res Function(_DownloadModalSheetState) _then;

  /// Create a copy of DownloadModalSheetState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? audioOnly = null,
    Object? loading = null,
    Object? availableQualities = null,
    Object? quality = null,
  }) {
    return _then(_DownloadModalSheetState(
      audioOnly: null == audioOnly
          ? _self.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      loading: null == loading
          ? _self.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      availableQualities: null == availableQualities
          ? _self._availableQualities
          : availableQualities // ignore: cast_nullable_to_non_nullable
              as List<AdaptiveFormat>,
      quality: null == quality
          ? _self.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
