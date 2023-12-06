import 'package:flutter/material.dart';
import 'package:invidious/search/models/search_sort_by.dart';

const defaultSearchSortBy = SearchSortBy.relevance;

class SearchFiltersButton extends StatelessWidget {
  final SearchSortBy initialSearchSortBy;
  final Function(SearchSortBy) callback;

  const SearchFiltersButton({
    super.key,
    required this.initialSearchSortBy,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            SearchSortBy selectedSearchSortBy = initialSearchSortBy;
            return AlertDialog(
              content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        const Text('Sort by'),
                        ...SearchSortBy.values.map((value) {
                          return ListTile(
                            title: Text(value.label),
                            leading: Radio<SearchSortBy>(
                              value: value,
                              groupValue: selectedSearchSortBy,
                              onChanged: (newSearchSortBy) {
                                setState(() => selectedSearchSortBy = newSearchSortBy ?? defaultSearchSortBy);
                              },
                            ),
                          );
                        }),
                      ]
                    ),
                  );
                },
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    callback(selectedSearchSortBy);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
      icon: const Icon(Icons.filter_list_alt),
    );
  }
}
