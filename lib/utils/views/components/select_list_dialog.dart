import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/utils/states/select_list.dart';

class SelectList<T> extends StatelessWidget {
  final List<T>? values;
  final T? value;
  final String title;
  final Widget Function(T value, bool selected) itemBuilder;
  final Function(T value) onSelect;
  final Future<List<T>> Function(String filter)? asyncSearch;
  final bool Function(String filter, T value)? searchFilter;

  SelectList(
      {super.key,
      required this.title,
      required this.values,
      this.value,
      required this.itemBuilder,
      required this.onSelect,
      this.searchFilter,
      this.asyncSearch})
      : assert(values == null || asyncSearch == null, 'Cannot provide both async search and list of values');

  static show<T>(BuildContext context,
      {List<T>? values,
      T? value,
      Future<List<T>> Function(String filter)? asyncSearch,
      required Widget Function(T value, bool selected) itemBuilder,
      required Function(T value) onSelect,
      required String title,
      bool search = false,
      bool Function(String filter, T value)? searchFilter}) {
    showDialog(
      context: context,
      builder: (context) => SelectList<T>(
        title: title,
        asyncSearch: asyncSearch,
        value: value,
        values: values,
        itemBuilder: itemBuilder,
        onSelect: onSelect,
        searchFilter: searchFilter,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colors = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;

    return AlertDialog(
      title: Text(
        title,
        style: textTheme.titleLarge,
      ),
      content: SizedBox(
        width: 300,
        child: BlocProvider(
          create: (BuildContext context) => SelectListCubit<T>(SelectListState<T>(filteredItems: values ?? [])),
          child: BlocBuilder<SelectListCubit<T>, SelectListState<T>>(builder: (context, state) {
            var cubit = context.read<SelectListCubit<T>>();
            return Column(
              children: [
                if (searchFilter != null || asyncSearch != null)
                  TextField(
                    decoration: InputDecoration(hintText: locals.search),
                    onChanged: (searchQuery) async {
                      cubit.filterItems(asyncSearch, searchFilter, values, searchQuery);
                    },
                  ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.filteredItems.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: GestureDetector(
                          key: ValueKey(state.filteredItems[index]),
                          onTap: () {
                            onSelect(state.filteredItems[index]);
                            Navigator.of(context).pop();
                          },
                          child: itemBuilder(state.filteredItems[index], state.filteredItems[index] == value)),
                    ),
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
