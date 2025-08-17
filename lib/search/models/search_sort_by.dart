import 'package:clipious/l10n/generated/app_localizations.dart';

enum SearchSortBy {
  relevance,
  rating,
  date,
  views;

  String getLabel(AppLocalizations locals) {
    return switch (this) {
      (SearchSortBy.relevance) => locals.searchSortRelevance,
      (SearchSortBy.rating) => locals.searchSortRating,
      (SearchSortBy.date) => locals.searchSortUploadDate,
      (SearchSortBy.views) => locals.searchSortViewCount,
    };
  }
}
