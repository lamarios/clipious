// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'video_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$VideoFilterState {
  List<VideoFilter> get filters => throw _privateConstructorUsedError;
  bool get hideFilteredVideos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VideoFilterStateCopyWith<VideoFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VideoFilterStateCopyWith<$Res> {
  factory $VideoFilterStateCopyWith(
          VideoFilterState value, $Res Function(VideoFilterState) then) =
      _$VideoFilterStateCopyWithImpl<$Res, VideoFilterState>;
  @useResult
  $Res call({List<VideoFilter> filters, bool hideFilteredVideos});
}

/// @nodoc
class _$VideoFilterStateCopyWithImpl<$Res, $Val extends VideoFilterState>
    implements $VideoFilterStateCopyWith<$Res> {
  _$VideoFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? hideFilteredVideos = null,
  }) {
    return _then(_value.copyWith(
      filters: null == filters
          ? _value.filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      hideFilteredVideos: null == hideFilteredVideos
          ? _value.hideFilteredVideos
          : hideFilteredVideos // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VideoFilterStateImplCopyWith<$Res>
    implements $VideoFilterStateCopyWith<$Res> {
  factory _$$VideoFilterStateImplCopyWith(_$VideoFilterStateImpl value,
          $Res Function(_$VideoFilterStateImpl) then) =
      __$$VideoFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<VideoFilter> filters, bool hideFilteredVideos});
}

/// @nodoc
class __$$VideoFilterStateImplCopyWithImpl<$Res>
    extends _$VideoFilterStateCopyWithImpl<$Res, _$VideoFilterStateImpl>
    implements _$$VideoFilterStateImplCopyWith<$Res> {
  __$$VideoFilterStateImplCopyWithImpl(_$VideoFilterStateImpl _value,
      $Res Function(_$VideoFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filters = null,
    Object? hideFilteredVideos = null,
  }) {
    return _then(_$VideoFilterStateImpl(
      filters: null == filters
          ? _value._filters
          : filters // ignore: cast_nullable_to_non_nullable
              as List<VideoFilter>,
      hideFilteredVideos: null == hideFilteredVideos
          ? _value.hideFilteredVideos
          : hideFilteredVideos // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$VideoFilterStateImpl implements _VideoFilterState {
  const _$VideoFilterStateImpl(
      {final List<VideoFilter> filters = const [],
      this.hideFilteredVideos = false})
      : _filters = filters;

  final List<VideoFilter> _filters;
  @override
  @JsonKey()
  List<VideoFilter> get filters {
    if (_filters is EqualUnmodifiableListView) return _filters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filters);
  }

  @override
  @JsonKey()
  final bool hideFilteredVideos;

  @override
  String toString() {
    return 'VideoFilterState(filters: $filters, hideFilteredVideos: $hideFilteredVideos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoFilterStateImpl &&
            const DeepCollectionEquality().equals(other._filters, _filters) &&
            (identical(other.hideFilteredVideos, hideFilteredVideos) ||
                other.hideFilteredVideos == hideFilteredVideos));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_filters), hideFilteredVideos);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoFilterStateImplCopyWith<_$VideoFilterStateImpl> get copyWith =>
      __$$VideoFilterStateImplCopyWithImpl<_$VideoFilterStateImpl>(
          this, _$identity);
}

abstract class _VideoFilterState implements VideoFilterState {
  const factory _VideoFilterState(
      {final List<VideoFilter> filters,
      final bool hideFilteredVideos}) = _$VideoFilterStateImpl;

  @override
  List<VideoFilter> get filters;
  @override
  bool get hideFilteredVideos;
  @override
  @JsonKey(ignore: true)
  _$$VideoFilterStateImplCopyWith<_$VideoFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
