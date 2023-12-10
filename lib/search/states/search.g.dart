// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchStateCWProxy {
  SearchState queryController(TextEditingController queryController);

  SearchState selectedIndex(int selectedIndex);

  SearchState searchNow(bool searchNow);

  SearchState suggestions(List<String> suggestions);

  SearchState filters(SearchFiltersState filters);

  SearchState showResults(bool showResults);

  SearchState videoPage(int videoPage);

  SearchState channelPage(int channelPage);

  SearchState playlistPage(int playlistPage);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchState call({
    TextEditingController? queryController,
    int? selectedIndex,
    bool? searchNow,
    List<String>? suggestions,
    SearchFiltersState? filters,
    bool? showResults,
    int? videoPage,
    int? channelPage,
    int? playlistPage,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchState.copyWith.fieldName(...)`
class _$SearchStateCWProxyImpl implements _$SearchStateCWProxy {
  const _$SearchStateCWProxyImpl(this._value);

  final SearchState _value;

  @override
  SearchState queryController(TextEditingController queryController) =>
      this(queryController: queryController);

  @override
  SearchState selectedIndex(int selectedIndex) =>
      this(selectedIndex: selectedIndex);

  @override
  SearchState searchNow(bool searchNow) => this(searchNow: searchNow);

  @override
  SearchState suggestions(List<String> suggestions) =>
      this(suggestions: suggestions);

  @override
  SearchState filters(SearchFiltersState filters) => this(filters: filters);

  @override
  SearchState showResults(bool showResults) => this(showResults: showResults);

  @override
  SearchState videoPage(int videoPage) => this(videoPage: videoPage);

  @override
  SearchState channelPage(int channelPage) => this(channelPage: channelPage);

  @override
  SearchState playlistPage(int playlistPage) =>
      this(playlistPage: playlistPage);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchState call({
    Object? queryController = const $CopyWithPlaceholder(),
    Object? selectedIndex = const $CopyWithPlaceholder(),
    Object? searchNow = const $CopyWithPlaceholder(),
    Object? suggestions = const $CopyWithPlaceholder(),
    Object? filters = const $CopyWithPlaceholder(),
    Object? showResults = const $CopyWithPlaceholder(),
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
      searchNow == const $CopyWithPlaceholder() || searchNow == null
          ? _value.searchNow
          // ignore: cast_nullable_to_non_nullable
          : searchNow as bool,
      suggestions == const $CopyWithPlaceholder() || suggestions == null
          ? _value.suggestions
          // ignore: cast_nullable_to_non_nullable
          : suggestions as List<String>,
      filters == const $CopyWithPlaceholder() || filters == null
          ? _value.filters
          // ignore: cast_nullable_to_non_nullable
          : filters as SearchFiltersState,
      showResults == const $CopyWithPlaceholder() || showResults == null
          ? _value.showResults
          // ignore: cast_nullable_to_non_nullable
          : showResults as bool,
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

extension $SearchStateCopyWith on SearchState {
  /// Returns a callable class that can be used as follows: `instanceOfSearchState.copyWith(...)` or like so:`instanceOfSearchState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchStateCWProxy get copyWith => _$SearchStateCWProxyImpl(this);
}
