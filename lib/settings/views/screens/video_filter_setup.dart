import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/states/video_filter_edit.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/views/components/select_list_dialog.dart';

import '../../../channels/models/channel.dart';
import '../../models/db/video_filter.dart';

@RoutePage()
class VideoFilterSetupScreen extends StatelessWidget {
  final String? channelId;
  final VideoFilter? filter;

  const VideoFilterSetupScreen({Key? key, this.channelId, this.filter}) : super(key: key);

  List<Widget> getFilterWidgets(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<VideoFilterEditCubit>();
    var _ = cubit.state;
    return _.filter?.filterAll ?? false
        ? []
        : [
            Row(
              children: [
                Expanded(child: Text(locals.videoFilterType)),
                DropdownButton<FilterType>(
                    value: _.filter?.type,
                    items: FilterType.values
                        .map((e) =>
                            DropdownMenuItem<FilterType>(value: e, child: Text(FilterType.localizedType(e, locals))))
                        .toList(),
                    onChanged: cubit.setType)
              ],
            ),
            Visibility(
              visible: _.filter?.type != null,
              child: Row(
                children: [
                  Expanded(child: Text(locals.videoFilterOperation)),
                  DropdownButton<FilterOperation>(
                      value: _.filter?.operation,
                      items: cubit
                          .getAvailableOperations()
                          .map((e) => DropdownMenuItem<FilterOperation>(
                              value: e, child: Text(FilterOperation.localizedLabel(e, locals))))
                          .toList(),
                      onChanged: cubit.setOperation)
                ],
              ),
            ),
            Visibility(
              visible: _.filter?.operation != null,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16.0),
                    child: Text(locals.videoFilterValue),
                  ),
                  Expanded(
                    child: TextField(
                      autocorrect: false,
                      maxLines: 1,
                      keyboardType: cubit.isNumberValue() ? TextInputType.number : null,
                      controller: cubit.valueController,
                      onChanged: cubit.valueChanged,
                    ),
                  )
                ],
              ),
            ),
          ];
  }

  searchChannel(BuildContext context) {
    var cubit = context.read<VideoFilterEditCubit>();
    var locals = AppLocalizations.of(context)!;
    SelectList.show<Channel>(context,
        itemBuilder: (value, selected) => Text(value.author),
        asyncSearch: (filter) => cubit.searchChannel(filter ?? ''),
        onSelect: (value) => cubit.selectChannel(value),
        title: locals.channel);
  }

  selectTime(BuildContext context, String initialTime, Function(String newTime) onNewTime) async {
    var split = initialTime.split(":");
    if (split.length == 3) {
      TimeOfDay? selectedTime = await showTimePicker(context: context, initialTime: timeStringToTimeOfDay(initialTime));
      if (selectedTime != null) {
        String newTime =
            '${selectedTime.hour.toString().padLeft(2, "0")}:${selectedTime.minute.toString().padLeft(2, "0")}:${split[2]}';
        onNewTime(newTime);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return BlocProvider(
      create: (context) => VideoFilterEditCubit(VideoFilterEditState(filter: filter)),
      child: BlocBuilder<VideoFilterEditCubit, VideoFilterEditState>(builder: (context, _) {
        var cubit = context.read<VideoFilterEditCubit>();
        return Scaffold(
          appBar: AppBar(
            backgroundColor: colors.background,
            title: Text(filter == null ? locals.addVideoFilter : locals.editVideoFilter),
          ),
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(locals.videoFilterEditDescription),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_.channel == null)
                            FilledButton.tonalIcon(
                                onPressed: () => searchChannel(context),
                                icon: const Icon(Icons.personal_video),
                                label: Text('${locals.channel} (${locals.optional})')),
                          if (_.channel != null)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                  text: TextSpan(children: [
                                TextSpan(text: '${locals.channel}: ', style: textTheme.bodyLarge),
                                TextSpan(
                                    text: _.channel?.author ?? '',
                                    style: textTheme.bodyLarge?.copyWith(color: colors.primary))
                              ])),
                            ),
                          if (_.channel != null)
                            IconButton(onPressed: () => cubit.channelClear(), icon: Icon(Icons.clear))
                        ],
                      ),
                    )
/*
                    SearchChoices.single(
                      isExpanded: true,
                      value: _.channel,
                      selectedValueWidgetFn: (value) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(value.author),
                      ),
                      hint: '${locals.channel} (${locals.optional})',
                      dialogBox: true,
                      onChanged: cubit.selectChannel,
                      onClear: cubit.channelClear,
                      futureSearchFn: (keyword, orderBy, orderAsc, filters, pageNb) async {
                        List<Channel> channels = await cubit.searchChannel(keyword ?? '');

                        return Tuple2(
                            channels
                                .map((e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e.author),
                                    ))
                                .toList(),
                            channels.length);
                      },
                    ),
*/
                    ,
                    Visibility(
                        visible: _.filter?.channelId != null,
                        child: SwitchListTile(
                            title: Text(locals.videoFilterHideAllFromChannel),
                            value: _.filter?.filterAll ?? false,
                            onChanged: cubit.channelHideAll)),
                    ...getFilterWidgets(context),
                    SwitchListTile(
                        title: Text(locals.videoFilterDayOfWeek),
                        subtitle: Text(
                          locals.videoFilterDayOfWeekDescription,
                          style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                        ),
                        value: cubit.showDateSettings,
                        onChanged: (value) => cubit.showDateSettings = value),
                    AnimatedCrossFade(
                      firstChild: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: wholeWeek.map((e) {
                                  String day = getWeekdayName(e).substring(0, 1);
                                  var isSelected = _.filter?.daysOfWeek.contains(e) ?? false;
                                  return GestureDetector(
                                    onTap: () => cubit.toggleDay(e),
                                    child: AnimatedContainer(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(horizontal: 8),
                                      height: 30,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: isSelected
                                              ? colors.primaryContainer
                                              : colors.primaryContainer.withOpacity(0.4)),
                                      duration: animationDuration,
                                      curve: Curves.easeInOutQuad,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            day,
                                            style: textTheme.bodySmall?.copyWith(
                                                fontWeight: FontWeight.bold,
                                                color: isSelected ? colors.onPrimaryContainer : colors.onBackground),
                                          ),
                                          if(isSelected) const Icon(Icons.check, size: 14,).animate().slideX(duration: animationDuration, curve: Curves.easeInOutQuad).fadeIn(duration: animationDuration)
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList()),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${locals.from}:'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: FilledButton.tonal(
                                      onPressed: () => selectTime(
                                          context, _.filter?.startTime ?? defaultStartTime, cubit.setStartTime),
                                      child: Text(timeStringToTimeOfDay(_.filter?.startTime ?? defaultStartTime)
                                          .format(context))),
                                ),
                                Text('${locals.to}:'),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: FilledButton.tonal(
                                      onPressed: () =>
                                          selectTime(context, _.filter?.endTime ?? defaultEndTime, cubit.setEndTime),
                                      child: Text(
                                          timeStringToTimeOfDay(_.filter?.endTime ?? defaultEndTime).format(context))),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      secondChild: const SizedBox.shrink(),
                      crossFadeState: cubit.showDateSettings ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                      duration: animationDuration,
                      sizeCurve: Curves.easeInOutQuad,
                      firstCurve: Curves.easeInOutQuad,
                      secondCurve: Curves.easeInOutQuad,
                    )
                        .animate()
                        .slideY(duration: animationDuration, curve: Curves.easeInOutQuad)
                        .fadeIn(duration: animationDuration),
                    SwitchListTile(
                        title: Text(locals.videoFilterHide),
                        subtitle: Text(
                          locals.videoFilterHideDescription,
                          style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                        ),
                        value: _.filter?.hideFromFeed ?? false,
                        onChanged: cubit.hideOnFilteredChanged),
                    Visibility(
                        visible: cubit.isFilterValid(),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            _.filter?.localizedLabel(locals, context) ?? '',
                            style: TextStyle(color: colors.primary),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FilledButton(
                          onPressed: cubit.isFilterValid()
                              ? () {
                                  cubit.onSave();
                                  AutoRouter.of(context).pop();
                                }
                              : null,
                          child: Text(locals.save)),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
