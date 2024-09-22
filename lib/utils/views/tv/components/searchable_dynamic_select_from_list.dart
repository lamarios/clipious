import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/utils/states/tv/searchable_dynamic_select_from_list.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:clipious/utils/views/tv/components/tv_text_field.dart';

import '../../../../settings/views/tv/screens/settings.dart';

class SearchableSelectFromListScreen<T> extends StatelessWidget {
  final String title;
  final Future<List<T>> Function(String query) fetchItems;
  final Function(T selected) onSelect;
  final String Function(T item) titleBuilder;
  final String? Function(T item) descriptionBuilder;

  const SearchableSelectFromListScreen(
      {super.key,
      required this.title,
      required this.fetchItems,
      required this.onSelect,
      required this.titleBuilder,
      required this.descriptionBuilder});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TvOverscan(
      child: BlocProvider(
        create: (context) => SearchableSelectFromListCubit<T>(
            SearchableSelectFromListState<T>([],
                controller: TextEditingController()),
            fetchItems),
        child: BlocBuilder<SearchableSelectFromListCubit<T>,
            SearchableSelectFromListState<T>>(builder: (context, state) {
          var cubit = context.read<SearchableSelectFromListCubit<T>>();
          return Column(
            children: [
              SettingsTitle(title: title),
              TvTextField(
                decoration: InputDecoration(label: Text(title)),
                controller: state.controller,
                onSubmitted: (value) => cubit.searchItems(value),
              ),
              Expanded(
                  child: ListView(
                children: state.items
                    .map((e) => SettingsTile(
                          title: titleBuilder(e),
                          description: descriptionBuilder(e),
                          onSelected: (context) {
                            onSelect(e);
                            Navigator.of(context).pop();
                          },
                        ))
                    .toList(),
              ))
            ],
          );
        }),
      ),
    ));
  }
}
