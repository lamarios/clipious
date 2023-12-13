// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tv_video.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TvVideoState {
  bool get showImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TvVideoStateCopyWith<TvVideoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TvVideoStateCopyWith<$Res> {
  factory $TvVideoStateCopyWith(
          TvVideoState value, $Res Function(TvVideoState) then) =
      _$TvVideoStateCopyWithImpl<$Res, TvVideoState>;
  @useResult
  $Res call({bool showImage});
}

/// @nodoc
class _$TvVideoStateCopyWithImpl<$Res, $Val extends TvVideoState>
    implements $TvVideoStateCopyWith<$Res> {
  _$TvVideoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showImage = null,
  }) {
    return _then(_value.copyWith(
      showImage: null == showImage
          ? _value.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TvVideoStateImplCopyWith<$Res>
    implements $TvVideoStateCopyWith<$Res> {
  factory _$$TvVideoStateImplCopyWith(
          _$TvVideoStateImpl value, $Res Function(_$TvVideoStateImpl) then) =
      __$$TvVideoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool showImage});
}

/// @nodoc
class __$$TvVideoStateImplCopyWithImpl<$Res>
    extends _$TvVideoStateCopyWithImpl<$Res, _$TvVideoStateImpl>
    implements _$$TvVideoStateImplCopyWith<$Res> {
  __$$TvVideoStateImplCopyWithImpl(
      _$TvVideoStateImpl _value, $Res Function(_$TvVideoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showImage = null,
  }) {
    return _then(_$TvVideoStateImpl(
      showImage: null == showImage
          ? _value.showImage
          : showImage // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TvVideoStateImpl implements _TvVideoState {
  const _$TvVideoStateImpl({this.showImage = true});

  @override
  @JsonKey()
  final bool showImage;

  @override
  String toString() {
    return 'TvVideoState(showImage: $showImage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TvVideoStateImpl &&
            (identical(other.showImage, showImage) ||
                other.showImage == showImage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TvVideoStateImplCopyWith<_$TvVideoStateImpl> get copyWith =>
      __$$TvVideoStateImplCopyWithImpl<_$TvVideoStateImpl>(this, _$identity);
}

abstract class _TvVideoState implements TvVideoState {
  const factory _TvVideoState({final bool showImage}) = _$TvVideoStateImpl;

  @override
  bool get showImage;
  @override
  @JsonKey(ignore: true)
  _$$TvVideoStateImplCopyWith<_$TvVideoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
