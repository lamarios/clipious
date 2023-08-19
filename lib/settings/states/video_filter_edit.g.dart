// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_filter_edit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterEditStateCWProxy {
  VideoFilterEditState filter(VideoFilter? filter);

  VideoFilterEditState searchPage(int searchPage);

  VideoFilterEditState channel(Channel? channel);

  VideoFilterEditState channelResults(List<Channel>? channelResults);

  VideoFilterEditState valueController(TextEditingController? valueController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterEditState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterEditState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterEditState call({
    VideoFilter? filter,
    int? searchPage,
    Channel? channel,
    List<Channel>? channelResults,
    TextEditingController? valueController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterEditState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterEditState.copyWith.fieldName(...)`
class _$VideoFilterEditStateCWProxyImpl implements _$VideoFilterEditStateCWProxy {
  const _$VideoFilterEditStateCWProxyImpl(this._value);

  final VideoFilterEditState _value;

  @override
  VideoFilterEditState filter(VideoFilter? filter) => this(filter: filter);

  @override
  VideoFilterEditState searchPage(int searchPage) => this(searchPage: searchPage);

  @override
  VideoFilterEditState channel(Channel? channel) => this(channel: channel);

  @override
  VideoFilterEditState channelResults(List<Channel>? channelResults) => this(channelResults: channelResults);

  @override
  VideoFilterEditState valueController(TextEditingController? valueController) => this(valueController: valueController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterEditState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterEditState(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterEditState call({
    Object? filter = const $CopyWithPlaceholder(),
    Object? searchPage = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? channelResults = const $CopyWithPlaceholder(),
    Object? valueController = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterEditState(
      filter: filter == const $CopyWithPlaceholder()
          ? _value.filter
          // ignore: cast_nullable_to_non_nullable
          : filter as VideoFilter?,
      searchPage: searchPage == const $CopyWithPlaceholder() || searchPage == null
          ? _value.searchPage
          // ignore: cast_nullable_to_non_nullable
          : searchPage as int,
      channel: channel == const $CopyWithPlaceholder()
          ? _value.channel
          // ignore: cast_nullable_to_non_nullable
          : channel as Channel?,
      channelResults: channelResults == const $CopyWithPlaceholder()
          ? _value.channelResults
          // ignore: cast_nullable_to_non_nullable
          : channelResults as List<Channel>?,
      valueController: valueController == const $CopyWithPlaceholder()
          ? _value.valueController
          // ignore: cast_nullable_to_non_nullable
          : valueController as TextEditingController?,
    );
  }
}

extension $VideoFilterEditStateCopyWith on VideoFilterEditState {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterEditState.copyWith(...)` or like so:`instanceOfVideoFilterEditState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterEditStateCWProxy get copyWith => _$VideoFilterEditStateCWProxyImpl(this);
}
