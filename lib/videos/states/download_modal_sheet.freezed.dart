// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'download_modal_sheet.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadModalSheetState {
  bool get audioOnly => throw _privateConstructorUsedError;
  String get quality => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadModalSheetStateCopyWith<DownloadModalSheetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadModalSheetStateCopyWith<$Res> {
  factory $DownloadModalSheetStateCopyWith(DownloadModalSheetState value,
          $Res Function(DownloadModalSheetState) then) =
      _$DownloadModalSheetStateCopyWithImpl<$Res, DownloadModalSheetState>;
  @useResult
  $Res call({bool audioOnly, String quality});
}

/// @nodoc
class _$DownloadModalSheetStateCopyWithImpl<$Res,
        $Val extends DownloadModalSheetState>
    implements $DownloadModalSheetStateCopyWith<$Res> {
  _$DownloadModalSheetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = null,
    Object? quality = null,
  }) {
    return _then(_value.copyWith(
      audioOnly: null == audioOnly
          ? _value.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadModalSheetStateImplCopyWith<$Res>
    implements $DownloadModalSheetStateCopyWith<$Res> {
  factory _$$DownloadModalSheetStateImplCopyWith(
          _$DownloadModalSheetStateImpl value,
          $Res Function(_$DownloadModalSheetStateImpl) then) =
      __$$DownloadModalSheetStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool audioOnly, String quality});
}

/// @nodoc
class __$$DownloadModalSheetStateImplCopyWithImpl<$Res>
    extends _$DownloadModalSheetStateCopyWithImpl<$Res,
        _$DownloadModalSheetStateImpl>
    implements _$$DownloadModalSheetStateImplCopyWith<$Res> {
  __$$DownloadModalSheetStateImplCopyWithImpl(
      _$DownloadModalSheetStateImpl _value,
      $Res Function(_$DownloadModalSheetStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audioOnly = null,
    Object? quality = null,
  }) {
    return _then(_$DownloadModalSheetStateImpl(
      audioOnly: null == audioOnly
          ? _value.audioOnly
          : audioOnly // ignore: cast_nullable_to_non_nullable
              as bool,
      quality: null == quality
          ? _value.quality
          : quality // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DownloadModalSheetStateImpl implements _DownloadModalSheetState {
  const _$DownloadModalSheetStateImpl(
      {this.audioOnly = false, this.quality = '720p'});

  @override
  @JsonKey()
  final bool audioOnly;
  @override
  @JsonKey()
  final String quality;

  @override
  String toString() {
    return 'DownloadModalSheetState(audioOnly: $audioOnly, quality: $quality)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadModalSheetStateImpl &&
            (identical(other.audioOnly, audioOnly) ||
                other.audioOnly == audioOnly) &&
            (identical(other.quality, quality) || other.quality == quality));
  }

  @override
  int get hashCode => Object.hash(runtimeType, audioOnly, quality);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadModalSheetStateImplCopyWith<_$DownloadModalSheetStateImpl>
      get copyWith => __$$DownloadModalSheetStateImplCopyWithImpl<
          _$DownloadModalSheetStateImpl>(this, _$identity);
}

abstract class _DownloadModalSheetState implements DownloadModalSheetState {
  const factory _DownloadModalSheetState(
      {final bool audioOnly,
      final String quality}) = _$DownloadModalSheetStateImpl;

  @override
  bool get audioOnly;
  @override
  String get quality;
  @override
  @JsonKey(ignore: true)
  _$$DownloadModalSheetStateImplCopyWith<_$DownloadModalSheetStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
