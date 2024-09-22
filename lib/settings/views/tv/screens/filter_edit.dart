import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/router.dart';
import 'package:clipious/settings/states/video_filter_edit.dart';
import 'package:clipious/settings/views/tv/screens/settings.dart';
import 'package:clipious/utils/views/tv/components/searchable_dynamic_select_from_list.dart';
import 'package:clipious/utils/views/tv/components/tv_button.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:clipious/utils/views/tv/components/tv_text_field.dart';
import 'package:clipious/utils/views/tv/components/tv_time_picker.dart';

import '../../../../channels/models/channel.dart';
import '../../../../utils.dart';
import '../../../models/db/video_filter.dart';

@RoutePage()
class TvFilterEditSettingsScreen extends StatelessWidget {
  final String? channelId;
  final VideoFilter? filter;

  const TvFilterEditSettingsScreen({super.key, this.channelId, this.filter});

  List<Widget> getFilterWidgets(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<VideoFilterEditCubit>();
    var textTheme = Theme.of(context).textTheme;
    var state = cubit.state;
    return state.filter?.filterAll ?? false
        ? []
        : [
            SettingsTile(
              title: locals.videoFilterType,
              trailing: Text(
                FilterType.localizedType(state.filter?.type, locals),
                style: textTheme.bodyLarge,
              ),
              onSelected: (context) => AutoRouter.of(context).push(
                  TvSelectFromListRoute(
                      options: FilterType.values
                          .map((e) => FilterType.localizedType(e, locals))
                          .toList(),
                      selected:
                          FilterType.localizedType(state.filter?.type, locals),
                      onSelect: (type) {
                        cubit.setType(FilterType.values
                            .where((t) =>
                                FilterType.localizedType(t, locals) == type)
                            .firstOrNull);
                      },
                      title: locals.videoFilterType)),
            ),
            Visibility(
              visible: state.filter?.type != null,
              child: SettingsTile(
                title: locals.videoFilterOperation,
                trailing: Text(
                  FilterOperation.localizedLabel(
                      state.filter?.operation, locals),
                  style: textTheme.bodyLarge,
                ),
                onSelected: (context) => AutoRouter.of(context).push(
                    TvSelectFromListRoute(
                        options: cubit
                            .getAvailableOperations()
                            .map((e) =>
                                FilterOperation.localizedLabel(e, locals))
                            .toList(),
                        selected: FilterOperation.localizedLabel(
                            state.filter?.operation, locals),
                        onSelect: (operation) {
                          cubit.setOperation(FilterOperation.values
                              .where((t) =>
                                  FilterOperation.localizedLabel(t, locals) ==
                                  operation)
                              .firstOrNull);
                        },
                        title: locals.videoFilterType)),
              ),
            ),
            Visibility(
                visible: state.filter?.operation != null,
                child: TvTextField(
                  controller: cubit.valueController,
                  autocorrect: false,
                  keyboardType:
                      cubit.isNumberValue() ? TextInputType.number : null,
                  decoration:
                      InputDecoration(label: Text(locals.videoFilterValue)),
                  onSubmitted: cubit.valueChanged,
                )),
          ];
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Builder(
        builder: (context) {
          return TvOverscan(
            child: BlocProvider(
              create: (context) =>
                  VideoFilterEditCubit(VideoFilterEditState(filter: filter)),
              child: BlocBuilder<VideoFilterEditCubit, VideoFilterEditState>(
                  builder: (context, state) {
                var cubit = context.read<VideoFilterEditCubit>();
                return Stack(
                  children: [
                    ListView(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SettingsTitle(
                                title: filter != null
                                    ? locals.editVideoFilter
                                    : locals.addVideoFilter),
                            if (filter != null)
                              TvButton(
                                onPressed: (context) async {
                                  await db.deleteFilter(filter!);
                                  if (context.mounted) {
                                    AutoRouter.of(context).maybePop();
                                  }
                                },
                                unfocusedColor: Colors.transparent,
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              )
                          ],
                        ),
                        SettingsTitle(title: locals.videoFilterEditDescription),
                        state.channel == null
                            ? SettingsTile(
                                leading: const Icon(Icons.personal_video),
                                title: '${locals.channel} (${locals.optional})',
                                onSelected: (context) => Navigator.of(context)
                                    .push(MaterialPageRoute(
                                  builder: (context) =>
                                      SearchableSelectFromListScreen<Channel>(
                                    title: locals.channel,
                                    fetchItems: cubit.searchChannel,
                                    titleBuilder: (item) => item.author,
                                    descriptionBuilder: (item) => null,
                                    onSelect: (selected) {
                                      cubit.selectChannel(selected);
                                    },
                                  ),
                                )),
                              )
                            : SettingsTile(
                                leading: const Icon(Icons.personal_video),
                                title:
                                    '${locals.channel}: ${state.channel?.author ?? ''}',
                                trailing: const Icon(Icons.clear),
                                onSelected: (context) => cubit.channelClear(),
                              ),
                        Visibility(
                            visible: state.filter?.channelId != null,
                            child: SettingsTile(
                              title: locals.videoFilterHideAllFromChannel,
                              onSelected: (context) => cubit.channelHideAll(
                                  !(state.filter?.filterAll ?? false)),
                              trailing: Switch(
                                  onChanged: (value) {},
                                  value: state.filter?.filterAll ?? false),
                            )),
                        ...getFilterWidgets(context),
                        SettingsTile(
                          title: locals.videoFilterDayOfWeek,
                          description: locals.videoFilterDayOfWeekDescription,
                          onSelected: (context) =>
                              cubit.showDateSettings = !cubit.showDateSettings,
                          trailing: Switch(
                              onChanged: (value) {},
                              value: cubit.showDateSettings),
                        ),
                        Visibility(
                          visible: cubit.showDateSettings,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: wholeWeek.map((e) {
                                  String day =
                                      getWeekdayName(e).substring(0, 1);
                                  var isSelected =
                                      state.filter?.daysOfWeek.contains(e) ??
                                          false;
                                  return TvButton(
                                    onPressed: (context) => cubit.toggleDay(e),
                                    child: AnimatedContainer(
                                        duration: animationDuration,
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                day,
                                                style: textTheme.titleLarge,
                                              ),
                                              if (isSelected)
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: const Icon(Icons.check)
                                                      .animate()
                                                      .slideX(
                                                          duration:
                                                              animationDuration,
                                                          curve: Curves
                                                              .easeInOutQuad)
                                                      .fadeIn(
                                                          duration:
                                                              animationDuration),
                                                )
                                            ],
                                          ),
                                        )),
                                  );
                                }).toList()),
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Visibility(
                            visible: cubit.showDateSettings,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${locals.from}:',
                                      style: textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    TvTimePicker(
                                        value:
                                            state.filter?.startTime ?? '00:00',
                                        onTimePicked: cubit.setStartTime),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${locals.to}:',
                                      style: textTheme.titleLarge,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    TvTimePicker(
                                        value: state.filter?.endTime ?? '00:00',
                                        onTimePicked: cubit.setEndTime),
                                  ],
                                ),
                              ],
                            )),
                        SettingsTile(
                          title: locals.videoFilterHide,
                          description: locals.videoFilterHideDescription,
                          onSelected: (context) => cubit.hideOnFilteredChanged(
                              !(state.filter?.hideFromFeed ?? false)),
                          trailing: Switch(
                              onChanged: (value) {},
                              value: state.filter?.hideFromFeed ?? false),
                        ),
                        Visibility(
                          visible: cubit.isFilterValid(),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: colors.secondaryContainer),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  state.filter
                                          ?.localizedLabel(locals, context) ??
                                      '',
                                  style: textTheme.headlineSmall,
                                  textAlign: TextAlign.center),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TvButton(
                              unfocusedColor: cubit.isFilterValid()
                                  ? null
                                  : Colors.transparent,
                              focusedColor: cubit.isFilterValid()
                                  ? null
                                  : Colors.transparent,
                              onPressed: cubit.isFilterValid()
                                  ? (context) {
                                      cubit.onSave();
                                      AutoRouter.of(context).maybePop();
                                    }
                                  : null,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 16),
                                child: Text(
                                  locals.save,
                                  style: textTheme.titleLarge,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
