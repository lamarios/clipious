enum SearchSortBy {
  relevance("Relevance"),
  rating("Rating"),
  date("Upload date"),
  views("View count");

  final String label;

  const SearchSortBy(this.label);
}
