// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppState {
  int get firstIndex => throw _privateConstructorUsedError;
  Server? get server => throw _privateConstructorUsedError;
  HomeLayout get homeLayout => throw _privateConstructorUsedError;
  bool get globalLoading => throw _privateConstructorUsedError;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppStateCopyWith<AppState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppStateCopyWith<$Res> {
  factory $AppStateCopyWith(AppState value, $Res Function(AppState) then) =
      _$AppStateCopyWithImpl<$Res, AppState>;
  @useResult
  $Res call(
      {int firstIndex,
      Server? server,
      HomeLayout homeLayout,
      bool globalLoading});

  $ServerCopyWith<$Res>? get server;
}

/// @nodoc
class _$AppStateCopyWithImpl<$Res, $Val extends AppState>
    implements $AppStateCopyWith<$Res> {
  _$AppStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      firstIndex: null == firstIndex
          ? _value.firstIndex
          : firstIndex // ignore: cast_nullable_to_non_nullable
              as int,
      server: freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server?,
      homeLayout: null == homeLayout
          ? _value.homeLayout
          : homeLayout // ignore: cast_nullable_to_non_nullable
              as HomeLayout,
      globalLoading: null == globalLoading
          ? _value.globalLoading
          : globalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ServerCopyWith<$Res>? get server {
    if (_value.server == null) {
      return null;
    }

    return $ServerCopyWith<$Res>(_value.server!, (value) {
      return _then(_value.copyWith(server: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppStateImplCopyWith<$Res>
    implements $AppStateCopyWith<$Res> {
  factory _$$AppStateImplCopyWith(
          _$AppStateImpl value, $Res Function(_$AppStateImpl) then) =
      __$$AppStateImplCopyWithImpl<$Res>;
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
class __$$AppStateImplCopyWithImpl<$Res>
    extends _$AppStateCopyWithImpl<$Res, _$AppStateImpl>
    implements _$$AppStateImplCopyWith<$Res> {
  __$$AppStateImplCopyWithImpl(
      _$AppStateImpl _value, $Res Function(_$AppStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$AppStateImpl(
      null == firstIndex
          ? _value.firstIndex
          : firstIndex // ignore: cast_nullable_to_non_nullable
              as int,
      freezed == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as Server?,
      null == homeLayout
          ? _value.homeLayout
          : homeLayout // ignore: cast_nullable_to_non_nullable
              as HomeLayout,
      globalLoading: null == globalLoading
          ? _value.globalLoading
          : globalLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AppStateImpl implements _AppState {
  const _$AppStateImpl(this.firstIndex, this.server, this.homeLayout,
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

  @override
  String toString() {
    return 'AppState(firstIndex: $firstIndex, server: $server, homeLayout: $homeLayout, globalLoading: $globalLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppStateImpl &&
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

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      __$$AppStateImplCopyWithImpl<_$AppStateImpl>(this, _$identity);
}

abstract class _AppState implements AppState {
  const factory _AppState(
      final int firstIndex, final Server? server, final HomeLayout homeLayout,
      {final bool globalLoading}) = _$AppStateImpl;

  @override
  int get firstIndex;
  @override
  Server? get server;
  @override
  HomeLayout get homeLayout;
  @override
  bool get globalLoading;

  /// Create a copy of AppState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppStateImplCopyWith<_$AppStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
