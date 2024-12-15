// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thumbnail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThumbnailState {
  List<String> get urls => throw _privateConstructorUsedError;
  String? get selected => throw _privateConstructorUsedError;

  /// Create a copy of ThumbnailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThumbnailStateCopyWith<ThumbnailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThumbnailStateCopyWith<$Res> {
  factory $ThumbnailStateCopyWith(
          ThumbnailState value, $Res Function(ThumbnailState) then) =
      _$ThumbnailStateCopyWithImpl<$Res, ThumbnailState>;
  @useResult
  $Res call({List<String> urls, String? selected});
}

/// @nodoc
class _$ThumbnailStateCopyWithImpl<$Res, $Val extends ThumbnailState>
    implements $ThumbnailStateCopyWith<$Res> {
  _$ThumbnailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThumbnailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      urls: null == urls
          ? _value.urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThumbnailStateImplCopyWith<$Res>
    implements $ThumbnailStateCopyWith<$Res> {
  factory _$$ThumbnailStateImplCopyWith(_$ThumbnailStateImpl value,
          $Res Function(_$ThumbnailStateImpl) then) =
      __$$ThumbnailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> urls, String? selected});
}

/// @nodoc
class __$$ThumbnailStateImplCopyWithImpl<$Res>
    extends _$ThumbnailStateCopyWithImpl<$Res, _$ThumbnailStateImpl>
    implements _$$ThumbnailStateImplCopyWith<$Res> {
  __$$ThumbnailStateImplCopyWithImpl(
      _$ThumbnailStateImpl _value, $Res Function(_$ThumbnailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThumbnailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? urls = null,
    Object? selected = freezed,
  }) {
    return _then(_$ThumbnailStateImpl(
      urls: null == urls
          ? _value._urls
          : urls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ThumbnailStateImpl implements _ThumbnailState {
  const _$ThumbnailStateImpl(
      {final List<String> urls = const [], this.selected})
      : _urls = urls;

  final List<String> _urls;
  @override
  @JsonKey()
  List<String> get urls {
    if (_urls is EqualUnmodifiableListView) return _urls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_urls);
  }

  @override
  final String? selected;

  @override
  String toString() {
    return 'ThumbnailState(urls: $urls, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThumbnailStateImpl &&
            const DeepCollectionEquality().equals(other._urls, _urls) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_urls), selected);

  /// Create a copy of ThumbnailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThumbnailStateImplCopyWith<_$ThumbnailStateImpl> get copyWith =>
      __$$ThumbnailStateImplCopyWithImpl<_$ThumbnailStateImpl>(
          this, _$identity);
}

abstract class _ThumbnailState implements ThumbnailState {
  const factory _ThumbnailState(
      {final List<String> urls, final String? selected}) = _$ThumbnailStateImpl;

  @override
  List<String> get urls;
  @override
  String? get selected;

  /// Create a copy of ThumbnailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThumbnailStateImplCopyWith<_$ThumbnailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
