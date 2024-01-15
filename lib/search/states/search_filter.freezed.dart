// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_filter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchFiltersState {
  dynamic get date => throw _privateConstructorUsedError;
  dynamic get duration => throw _privateConstructorUsedError;
  dynamic get sortBy => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchFiltersStateCopyWith<SearchFiltersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFiltersStateCopyWith<$Res> {
  factory $SearchFiltersStateCopyWith(
          SearchFiltersState value, $Res Function(SearchFiltersState) then) =
      _$SearchFiltersStateCopyWithImpl<$Res, SearchFiltersState>;
  @useResult
  $Res call({dynamic date, dynamic duration, dynamic sortBy});
}

/// @nodoc
class _$SearchFiltersStateCopyWithImpl<$Res, $Val extends SearchFiltersState>
    implements $SearchFiltersStateCopyWith<$Res> {
  _$SearchFiltersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? duration = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_value.copyWith(
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as dynamic,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as dynamic,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SearchFiltersStateImplCopyWith<$Res>
    implements $SearchFiltersStateCopyWith<$Res> {
  factory _$$SearchFiltersStateImplCopyWith(_$SearchFiltersStateImpl value,
          $Res Function(_$SearchFiltersStateImpl) then) =
      __$$SearchFiltersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic date, dynamic duration, dynamic sortBy});
}

/// @nodoc
class __$$SearchFiltersStateImplCopyWithImpl<$Res>
    extends _$SearchFiltersStateCopyWithImpl<$Res, _$SearchFiltersStateImpl>
    implements _$$SearchFiltersStateImplCopyWith<$Res> {
  __$$SearchFiltersStateImplCopyWithImpl(_$SearchFiltersStateImpl _value,
      $Res Function(_$SearchFiltersStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = freezed,
    Object? duration = freezed,
    Object? sortBy = freezed,
  }) {
    return _then(_$SearchFiltersStateImpl(
      date: freezed == date ? _value.date! : date,
      duration: freezed == duration ? _value.duration! : duration,
      sortBy: freezed == sortBy ? _value.sortBy! : sortBy,
    ));
  }
}

/// @nodoc

class _$SearchFiltersStateImpl implements _SearchFiltersState {
  const _$SearchFiltersStateImpl(
      {this.date = SearchDate.any,
      this.duration = SearchDuration.any,
      this.sortBy = SearchSortBy.relevance});

  @override
  @JsonKey()
  final dynamic date;
  @override
  @JsonKey()
  final dynamic duration;
  @override
  @JsonKey()
  final dynamic sortBy;

  @override
  String toString() {
    return 'SearchFiltersState(date: $date, duration: $duration, sortBy: $sortBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFiltersStateImpl &&
            const DeepCollectionEquality().equals(other.date, date) &&
            const DeepCollectionEquality().equals(other.duration, duration) &&
            const DeepCollectionEquality().equals(other.sortBy, sortBy));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(date),
      const DeepCollectionEquality().hash(duration),
      const DeepCollectionEquality().hash(sortBy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFiltersStateImplCopyWith<_$SearchFiltersStateImpl> get copyWith =>
      __$$SearchFiltersStateImplCopyWithImpl<_$SearchFiltersStateImpl>(
          this, _$identity);
}

abstract class _SearchFiltersState implements SearchFiltersState {
  const factory _SearchFiltersState(
      {final dynamic date,
      final dynamic duration,
      final dynamic sortBy}) = _$SearchFiltersStateImpl;

  @override
  dynamic get date;
  @override
  dynamic get duration;
  @override
  dynamic get sortBy;
  @override
  @JsonKey(ignore: true)
  _$$SearchFiltersStateImplCopyWith<_$SearchFiltersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
