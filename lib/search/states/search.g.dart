// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ClipiousSearchControllerCWProxy {
  SearchState queryController(
      TextEditingController queryController);

  SearchState selectedIndex(int selectedIndex);

  SearchState videos(List<VideoInList> videos);

  SearchState channels(List<Channel> channels);

  SearchState playlists(List<Playlist> playlists);

  SearchState useHistory(bool useHistory);

  SearchState searchNow(bool searchNow);

  SearchState suggestions(List<String> suggestions);

  SearchState sortBy(SearchSortBy sortBy);

  SearchState showResults(bool showResults);

  SearchState loading(bool loading);

  SearchState videoPage(int videoPage);

  SearchState channelPage(int channelPage);

  SearchState playlistPage(int playlistPage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClipiousSearchController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClipiousSearchController(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchState call({
    TextEditingController? queryController,
    int? selectedIndex,
    List<VideoInList>? videos,
    List<Channel>? channels,
    List<Playlist>? playlists,
    bool? useHistory,
    bool? searchNow,
    List<String>? suggestions,
    SearchSortBy? sortBy,
    bool? showResults,
    bool? loading,
    int? videoPage,
    int? channelPage,
    int? playlistPage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfClipiousSearchController.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfClipiousSearchController.copyWith.fieldName(...)`
class _$ClipiousSearchControllerCWProxyImpl
    implements _$ClipiousSearchControllerCWProxy {
  const _$ClipiousSearchControllerCWProxyImpl(this._value);

  final SearchState _value;

  @override
  SearchState queryController(
          TextEditingController queryController) =>
      this(queryController: queryController);

  @override
  SearchState selectedIndex(int selectedIndex) =>
      this(selectedIndex: selectedIndex);

  @override
  SearchState videos(List<VideoInList> videos) =>
      this(videos: videos);

  @override
  SearchState channels(List<Channel> channels) =>
      this(channels: channels);

  @override
  SearchState playlists(List<Playlist> playlists) =>
      this(playlists: playlists);

  @override
  SearchState useHistory(bool useHistory) =>
      this(useHistory: useHistory);

  @override
  SearchState searchNow(bool searchNow) =>
      this(searchNow: searchNow);

  @override
  SearchState suggestions(List<String> suggestions) =>
      this(suggestions: suggestions);

  @override
  SearchState sortBy(SearchSortBy sortBy) => this(sortBy: sortBy);

  @override
  SearchState showResults(bool showResults) =>
      this(showResults: showResults);

  @override
  SearchState loading(bool loading) => this(loading: loading);

  @override
  SearchState videoPage(int videoPage) =>
      this(videoPage: videoPage);

  @override
  SearchState channelPage(int channelPage) =>
      this(channelPage: channelPage);

  @override
  SearchState playlistPage(int playlistPage) =>
      this(playlistPage: playlistPage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ClipiousSearchController(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ClipiousSearchController(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchState call({
    Object? queryController = const $CopyWithPlaceholder(),
    Object? selectedIndex = const $CopyWithPlaceholder(),
    Object? videos = const $CopyWithPlaceholder(),
    Object? channels = const $CopyWithPlaceholder(),
    Object? playlists = const $CopyWithPlaceholder(),
    Object? useHistory = const $CopyWithPlaceholder(),
    Object? searchNow = const $CopyWithPlaceholder(),
    Object? suggestions = const $CopyWithPlaceholder(),
    Object? sortBy = const $CopyWithPlaceholder(),
    Object? showResults = const $CopyWithPlaceholder(),
    Object? loading = const $CopyWithPlaceholder(),
    Object? videoPage = const $CopyWithPlaceholder(),
    Object? channelPage = const $CopyWithPlaceholder(),
    Object? playlistPage = const $CopyWithPlaceholder(),
  }) {
    return SearchState.inLine(
      queryController == const $CopyWithPlaceholder() || queryController == null
          ? _value.queryController
          // ignore: cast_nullable_to_non_nullable
          : queryController as TextEditingController,
      selectedIndex == const $CopyWithPlaceholder() || selectedIndex == null
          ? _value.selectedIndex
          // ignore: cast_nullable_to_non_nullable
          : selectedIndex as int,
      videos == const $CopyWithPlaceholder() || videos == null
          ? _value.videos
          // ignore: cast_nullable_to_non_nullable
          : videos as List<VideoInList>,
      channels == const $CopyWithPlaceholder() || channels == null
          ? _value.channels
          // ignore: cast_nullable_to_non_nullable
          : channels as List<Channel>,
      playlists == const $CopyWithPlaceholder() || playlists == null
          ? _value.playlists
          // ignore: cast_nullable_to_non_nullable
          : playlists as List<Playlist>,
      useHistory == const $CopyWithPlaceholder() || useHistory == null
          ? _value.useHistory
          // ignore: cast_nullable_to_non_nullable
          : useHistory as bool,
      searchNow == const $CopyWithPlaceholder() || searchNow == null
          ? _value.searchNow
          // ignore: cast_nullable_to_non_nullable
          : searchNow as bool,
      suggestions == const $CopyWithPlaceholder() || suggestions == null
          ? _value.suggestions
          // ignore: cast_nullable_to_non_nullable
          : suggestions as List<String>,
      sortBy == const $CopyWithPlaceholder() || sortBy == null
          ? _value.sortBy
          // ignore: cast_nullable_to_non_nullable
          : sortBy as SearchSortBy,
      showResults == const $CopyWithPlaceholder() || showResults == null
          ? _value.showResults
          // ignore: cast_nullable_to_non_nullable
          : showResults as bool,
      loading == const $CopyWithPlaceholder() || loading == null
          ? _value.loading
          // ignore: cast_nullable_to_non_nullable
          : loading as bool,
      videoPage == const $CopyWithPlaceholder() || videoPage == null
          ? _value.videoPage
          // ignore: cast_nullable_to_non_nullable
          : videoPage as int,
      channelPage == const $CopyWithPlaceholder() || channelPage == null
          ? _value.channelPage
          // ignore: cast_nullable_to_non_nullable
          : channelPage as int,
      playlistPage == const $CopyWithPlaceholder() || playlistPage == null
          ? _value.playlistPage
          // ignore: cast_nullable_to_non_nullable
          : playlistPage as int,
    );
  }
}

extension $ClipiousSearchControllerCopyWith on SearchState {
  /// Returns a callable class that can be used as follows: `instanceOfClipiousSearchController.copyWith(...)` or like so:`instanceOfClipiousSearchController.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ClipiousSearchControllerCWProxy get copyWith =>
      _$ClipiousSearchControllerCWProxyImpl(this);
}
