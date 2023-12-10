import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/search/models/search_sort_by.dart';
import 'package:invidious/search/states/search.dart';

class SearchFiltersButton extends StatelessWidget {
  final SearchFiltersState initialFilters;
  final Function(SearchFiltersState) onChanged;

  const SearchFiltersButton({
    super.key,
    required this.initialFilters,
    required this.onChanged,
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
            return BlocProvider(
              create: (context) => SearchFiltersCubit(initialFilters),
              child: BlocBuilder<SearchFiltersCubit, SearchFiltersState>(
                builder: (context, state) {
                  final cubit = context.read<SearchFiltersCubit>();
                  onSortByChanged(SearchSortBy? newValue) {
                    cubit.setSortBy(newValue);
                  }
                  return AlertDialog(
                    content: SingleChildScrollView(
                      child: ListBody(children: <Widget>[
                        Text(locals.searchSortBy),
                        ...SearchSortBy.values.map((value) {
                          return ListTile(
                            title: Text(value.getLable(locals)),
                            leading: Radio<SearchSortBy>(
                              value: value,
                              groupValue: state.sortBy,
                              onChanged: onSortByChanged,
                            ),
                          );
                        }),
                      ]),
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
                          onChanged(state);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              ),
            );
          },
        );
      },
      icon: const Icon(Icons.filter_list_alt),
    );
  }
}
