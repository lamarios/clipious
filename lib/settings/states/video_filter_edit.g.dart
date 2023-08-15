// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_filter_edit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterEditModelCWProxy {
  VideoFilterEditModel filter(VideoFilter? filter);

  VideoFilterEditModel searchPage(int searchPage);

  VideoFilterEditModel channel(Channel? channel);

  VideoFilterEditModel channelResults(List<Channel>? channelResults);

  VideoFilterEditModel valueController(TextEditingController? valueController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterEditModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterEditModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterEditModel call({
    VideoFilter? filter,
    int? searchPage,
    Channel? channel,
    List<Channel>? channelResults,
    TextEditingController? valueController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterEditModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterEditModel.copyWith.fieldName(...)`
class _$VideoFilterEditModelCWProxyImpl
    implements _$VideoFilterEditModelCWProxy {
  const _$VideoFilterEditModelCWProxyImpl(this._value);

  final VideoFilterEditModel _value;

  @override
  VideoFilterEditModel filter(VideoFilter? filter) => this(filter: filter);

  @override
  VideoFilterEditModel searchPage(int searchPage) =>
      this(searchPage: searchPage);

  @override
  VideoFilterEditModel channel(Channel? channel) => this(channel: channel);

  @override
  VideoFilterEditModel channelResults(List<Channel>? channelResults) =>
      this(channelResults: channelResults);

  @override
  VideoFilterEditModel valueController(
          TextEditingController? valueController) =>
      this(valueController: valueController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterEditModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterEditModel(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterEditModel call({
    Object? filter = const $CopyWithPlaceholder(),
    Object? searchPage = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? channelResults = const $CopyWithPlaceholder(),
    Object? valueController = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterEditModel(
      filter: filter == const $CopyWithPlaceholder()
          ? _value.filter
          // ignore: cast_nullable_to_non_nullable
          : filter as VideoFilter?,
      searchPage:
          searchPage == const $CopyWithPlaceholder() || searchPage == null
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

extension $VideoFilterEditModelCopyWith on VideoFilterEditModel {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterEditModel.copyWith(...)` or like so:`instanceOfVideoFilterEditModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterEditModelCWProxy get copyWith =>
      _$VideoFilterEditModelCWProxyImpl(this);
}
