import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/home/models/db/home_layout.dart';

import '../../states/app_customizer.dart';
import '../../states/settings.dart';

class AppCustomizer extends StatelessWidget {
  const AppCustomizer({super.key});

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return BlocProvider(
      create: (context) => AppCustomizerCubit(
          context.read<SettingsCubit>().state.appLayout,
          context.read<SettingsCubit>()),
      child: BlocBuilder<AppCustomizerCubit, List<HomeDataSource>>(
        builder: (context, state) {
          var settings = context.read<SettingsCubit>();
          var appLayout = context.read<AppCustomizerCubit>();
          var onStart =
              context.select((SettingsCubit cubit) => cubit.state.onOpen);
          if (onStart >= state.length) onStart = 0;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(locals.customizeAppLayoutExplanation,
                    style: textTheme.labelSmall),
              ),
              ReorderableListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  HomeDataSource source = state[index];

                  return Row(
                    key: ValueKey(source),
                    children: [
                      IconButton(
                          onPressed: () => settings.selectOnOpen(index),
                          icon: Icon(
                              onStart == index
                                  ? Icons.home
                                  : Icons.home_outlined,
                              color: onStart == index
                                  ? colors.primary
                                  : colors.secondary)),
                      Checkbox(
                        value: state.contains(source),
                        onChanged: (value) =>
                            appLayout.updateSource(source, value ?? false),
                      ),
                      Expanded(
                          child: ReorderableDragStartListener(
                              index: index,
                              child: Text(source.getLabel(locals)))),
                      ReorderableDragStartListener(
                        index: index,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.drag_indicator,
                            color: colors.secondary,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemCount: state.length,
                onReorder: appLayout.reorder,
              ),
              const Divider(),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: HomeDataSource.values
                    .where((element) => !state.contains(element))
                    .map((e) => Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 48.0),
                              child: Checkbox(
                                value: state.contains(e),
                                onChanged: (value) =>
                                    appLayout.updateSource(e, value ?? false),
                              ),
                            ),
                            Text(e.getLabel(locals))
                          ],
                        ))
                    .toList(),
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(locals.ok)),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
