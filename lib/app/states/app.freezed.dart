// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppState {
  int get firstIndex;
  Server? get server;
  HomeLayout get homeLayout;
  bool get globalLoading;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AppStateCopyWith<AppState> get copyWith =>
      _$AppStateCopyWithImpl<AppState>(this as AppState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AppState &&
            (identical(other.firstIndex, firstIndex) ||
                other.firstIndex == firstIndex) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.homeLayout, homeLayout) ||
                other.homeLayout == homeLayout) &&
            (identical(other.globalLoading, globalLoading) ||
                other.globalLoading == globalLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstIndex, server, homeLayout, globalLoading);

  @override
  String toString() {
    return 'AppState(firstIndex: $firstIndex, server: $server, homeLayout: $homeLayout, globalLoading: $globalLoading)';
  }
}

/// @nodoc
abstract mixin class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) _then) =
      _$AppStateCopyWithImpl;
  @useResult
  $Res call(
      {int firstIndex,
      Server? server,
      HomeLayout homeLayout,
      bool globalLoading});

  $ServerCopyWith<$Res>? get server;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res> implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._self, this._then);

  final AppState _self;
  final $Res Function(AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstIndex = null,
    Object? server = freezed,
    Object? homeLayout = null,
    Object? globalLoading = null,
  }) {
    return _then(_self.copyWith(
      firstIndex: null == firstIndex
          ? _self.firstIndex
          : firstIndex // ignore: cast_nullable_to_non_nullable
              as int,
      server: freezed == server
          ? _self.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server?,
      homeLayout: null == homeLayout
          ? _self.homeLayout
          : homeLayout // ignore: cast_nullable_to_non_nullable
              as HomeLayout,
      globalLoading: null == globalLoading
          ? _self.globalLoading
          : globalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerCopyWith<$Res>? get server {
    if (_self.server == null) {
      return null;
    }

    return $ServerCopyWith<$Res>(_self.server!, (value) {
      return _then(_self.copyWith(server: value));
    });
  }
}

/// Adds pattern-matching-related methods to [AppState].
extension AppStatePatterns on AppState {
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
    TResult Function(_AppState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
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
    TResult Function(_AppState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState():
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
    TResult? Function(_AppState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
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
    TResult Function(int firstIndex, Server? server, HomeLayout homeLayout,
            bool globalLoading)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
        return $default(_that.firstIndex, _that.server, _that.homeLayout,
            _that.globalLoading);
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
    TResult Function(int firstIndex, Server? server, HomeLayout homeLayout,
            bool globalLoading)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState():
        return $default(_that.firstIndex, _that.server, _that.homeLayout,
            _that.globalLoading);
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
    TResult? Function(int firstIndex, Server? server, HomeLayout homeLayout,
            bool globalLoading)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AppState() when $default != null:
        return $default(_that.firstIndex, _that.server, _that.homeLayout,
            _that.globalLoading);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AppState implements AppState {
  const _AppState(this.firstIndex, this.server, this.homeLayout,
      {this.globalLoading = false});

  @override
  final int firstIndex;
  @override
  final Server? server;
  @override
  final HomeLayout homeLayout;
  @override
  @JsonKey()
  final bool globalLoading;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AppStateCopyWith<_AppState> get copyWith =>
      __$AppStateCopyWithImpl<_AppState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AppState &&
            (identical(other.firstIndex, firstIndex) ||
                other.firstIndex == firstIndex) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.homeLayout, homeLayout) ||
                other.homeLayout == homeLayout) &&
            (identical(other.globalLoading, globalLoading) ||
                other.globalLoading == globalLoading));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, firstIndex, server, homeLayout, globalLoading);

  @override
  String toString() {
    return 'AppState(firstIndex: $firstIndex, server: $server, homeLayout: $homeLayout, globalLoading: $globalLoading)';
  }
}

/// @nodoc
abstract mixin class _$AppStateCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$AppStateCopyWith(_AppState value, $Res Function(_AppState) _then) =
      __$AppStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int firstIndex,
      Server? server,
      HomeLayout homeLayout,
      bool globalLoading});

  @override
  $ServerCopyWith<$Res>? get server;
}

/// @nodoc
class __$AppStateCopyWithImpl<$Res> implements _$AppStateCopyWith<$Res> {
  __$AppStateCopyWithImpl(this._self, this._then);

  final _AppState _self;
  final $Res Function(_AppState) _then;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstIndex = null,
    Object? server = freezed,
    Object? homeLayout = null,
    Object? globalLoading = null,
  }) {
    return _then(_AppState(
      null == firstIndex
          ? _self.firstIndex
          : firstIndex // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == server
          ? _self.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server?,
      null == homeLayout
          ? _self.homeLayout
          : homeLayout // ignore: cast_nullable_to_non_nullable
              as HomeLayout,
      globalLoading: null == globalLoading
          ? _self.globalLoading
          : globalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerCopyWith<$Res>? get server {
    if (_self.server == null) {
      return null;
    }

    return $ServerCopyWith<$Res>(_self.server!, (value) {
      return _then(_self.copyWith(server: value));
    });
  }
}

// dart format on
