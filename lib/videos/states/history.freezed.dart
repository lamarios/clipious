// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HistoryItemState {
  String get videoId => throw _privateConstructorUsedError;
  bool get loading => throw _privateConstructorUsedError;
  HistoryVideoCache? get cachedVid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HistoryItemStateCopyWith<HistoryItemState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryItemStateCopyWith<$Res> {
  factory $HistoryItemStateCopyWith(
          HistoryItemState value, $Res Function(HistoryItemState) then) =
      _$HistoryItemStateCopyWithImpl<$Res, HistoryItemState>;
  @useResult
  $Res call({String videoId, bool loading, HistoryVideoCache? cachedVid});
}

/// @nodoc
class _$HistoryItemStateCopyWithImpl<$Res, $Val extends HistoryItemState>
    implements $HistoryItemStateCopyWith<$Res> {
  _$HistoryItemStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? loading = null,
    Object? cachedVid = freezed,
  }) {
    return _then(_value.copyWith(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cachedVid: freezed == cachedVid
          ? _value.cachedVid
          : cachedVid // ignore: cast_nullable_to_non_nullable
              as HistoryVideoCache?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryItemStateImplCopyWith<$Res>
    implements $HistoryItemStateCopyWith<$Res> {
  factory _$$HistoryItemStateImplCopyWith(_$HistoryItemStateImpl value,
          $Res Function(_$HistoryItemStateImpl) then) =
      __$$HistoryItemStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String videoId, bool loading, HistoryVideoCache? cachedVid});
}

/// @nodoc
class __$$HistoryItemStateImplCopyWithImpl<$Res>
    extends _$HistoryItemStateCopyWithImpl<$Res, _$HistoryItemStateImpl>
    implements _$$HistoryItemStateImplCopyWith<$Res> {
  __$$HistoryItemStateImplCopyWithImpl(_$HistoryItemStateImpl _value,
      $Res Function(_$HistoryItemStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? videoId = null,
    Object? loading = null,
    Object? cachedVid = freezed,
  }) {
    return _then(_$HistoryItemStateImpl(
      videoId: null == videoId
          ? _value.videoId
          : videoId // ignore: cast_nullable_to_non_nullable
              as String,
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      cachedVid: freezed == cachedVid
          ? _value.cachedVid
          : cachedVid // ignore: cast_nullable_to_non_nullable
              as HistoryVideoCache?,
    ));
  }
}

/// @nodoc

class _$HistoryItemStateImpl implements _HistoryItemState {
  const _$HistoryItemStateImpl(
      {required this.videoId, this.loading = true, this.cachedVid});

  @override
  final String videoId;
  @override
  @JsonKey()
  final bool loading;
  @override
  final HistoryVideoCache? cachedVid;

  @override
  String toString() {
    return 'HistoryItemState(videoId: $videoId, loading: $loading, cachedVid: $cachedVid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryItemStateImpl &&
            (identical(other.videoId, videoId) || other.videoId == videoId) &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.cachedVid, cachedVid) ||
                other.cachedVid == cachedVid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, videoId, loading, cachedVid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryItemStateImplCopyWith<_$HistoryItemStateImpl> get copyWith =>
      __$$HistoryItemStateImplCopyWithImpl<_$HistoryItemStateImpl>(
          this, _$identity);
}

abstract class _HistoryItemState implements HistoryItemState {
  const factory _HistoryItemState(
      {required final String videoId,
      final bool loading,
      final HistoryVideoCache? cachedVid}) = _$HistoryItemStateImpl;

  @override
  String get videoId;
  @override
  bool get loading;
  @override
  HistoryVideoCache? get cachedVid;
  @override
  @JsonKey(ignore: true)
  _$$HistoryItemStateImplCopyWith<_$HistoryItemStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
