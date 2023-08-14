// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videoFilterEditController.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$VideoFilterEditControllerCWProxy {
  VideoFilterEditController filter(VideoFilter? filter);

  VideoFilterEditController searchPage(int searchPage);

  VideoFilterEditController channel(Channel? channel);

  VideoFilterEditController channelResults(List<Channel>? channelResults);

  VideoFilterEditController valueController(
      TextEditingController? valueController);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterEditController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterEditController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterEditController call({
    VideoFilter? filter,
    int? searchPage,
    Channel? channel,
    List<Channel>? channelResults,
    TextEditingController? valueController,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfVideoFilterEditController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfVideoFilterEditController.copyWith.fieldName(...)`
class _$VideoFilterEditControllerCWProxyImpl
    implements _$VideoFilterEditControllerCWProxy {
  const _$VideoFilterEditControllerCWProxyImpl(this._value);

  final VideoFilterEditController _value;

  @override
  VideoFilterEditController filter(VideoFilter? filter) => this(filter: filter);

  @override
  VideoFilterEditController searchPage(int searchPage) =>
      this(searchPage: searchPage);

  @override
  VideoFilterEditController channel(Channel? channel) => this(channel: channel);

  @override
  VideoFilterEditController channelResults(List<Channel>? channelResults) =>
      this(channelResults: channelResults);

  @override
  VideoFilterEditController valueController(
          TextEditingController? valueController) =>
      this(valueController: valueController);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `VideoFilterEditController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// VideoFilterEditController(...).copyWith(id: 12, name: "My name")
  /// ````
  VideoFilterEditController call({
    Object? filter = const $CopyWithPlaceholder(),
    Object? searchPage = const $CopyWithPlaceholder(),
    Object? channel = const $CopyWithPlaceholder(),
    Object? channelResults = const $CopyWithPlaceholder(),
    Object? valueController = const $CopyWithPlaceholder(),
  }) {
    return VideoFilterEditController(
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

extension $VideoFilterEditControllerCopyWith on VideoFilterEditController {
  /// Returns a callable class that can be used as follows: `instanceOfVideoFilterEditController.copyWith(...)` or like so:`instanceOfVideoFilterEditController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$VideoFilterEditControllerCWProxy get copyWith =>
      _$VideoFilterEditControllerCWProxyImpl(this);
}
