import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    final locals = AppLocalizations.of(context)!;
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
                  onChanged(SearchSortBy? newSearchSortBy) {
                    setState(() => selectedSearchSortBy = newSearchSortBy ?? defaultSearchSortBy);
                  }
                  return SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text(locals.searchSortBy),
                        ...SearchSortBy.values.map((value) {
                          return ListTile(
                            title: Text(value.getLable(locals)),
                            leading: Radio<SearchSortBy>(
                              value: value,
                              groupValue: selectedSearchSortBy,
                              onChanged: onChanged,
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
                  child: Text(locals.cancel),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: Text(locals.ok),
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
