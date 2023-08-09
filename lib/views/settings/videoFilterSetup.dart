import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';
import 'package:invidious/controllers/videoFilterEditController.dart';
import 'package:search_choices/search_choices.dart';

import '../../models/channel.dart';
import '../../models/db/videoFilter.dart';

class VideoFilterSetup extends StatelessWidget {
  final String? channelId;
  final VideoFilter? filter;

  const VideoFilterSetup({Key? key, this.channelId, this.filter}) : super(key: key);

  List<Widget> getFilterWidgets(AppLocalizations locals, VideoFilterEditController _) {
    return _.filter?.filterAll ?? false
        ? []
        : [
            Row(
              children: [
                Expanded(child: Text(locals.videoFilterType)),
                DropdownButton<FilterType>(
                    value: _.filter?.type, items: FilterType.values.map((e) => DropdownMenuItem<FilterType>(value: e, child: Text(FilterType.localizedType(e, locals)))).toList(), onChanged: _.setType)
              ],
            ),
            Visibility(
              visible: _.filter?.type != null,
              child: Row(
                children: [
                  Expanded(child: Text(locals.videoFilterOperation)),
                  DropdownButton<FilterOperation>(
                      value: _.filter?.operation,
                      items: _.getAvailableOperations().map((e) => DropdownMenuItem<FilterOperation>(value: e, child: Text(FilterOperation.localizedLabel(e, locals)))).toList(),
                      onChanged: _.setOperation)
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
                      keyboardType: _.isNumberValue() ? TextInputType.number : null,
                      controller: _.valueController,
                      onChanged: _.valueChanged,
                    ),
                  )
                ],
              ),
            ),
          ];
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return GetBuilder<VideoFilterEditController>(
        init: VideoFilterEditController(filter: filter),
        builder: (_) => Scaffold(
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
                        SearchChoices.single(
                          isExpanded: true,
                          value: _.channel,
                          selectedValueWidgetFn: (value) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(value.author),
                          ),
                          hint: '${locals.channel} (${locals.optional})',
                          dialogBox: true,
                          onChanged: _.selectChannel,
                          onClear: _.channelClear,
                          futureSearchFn: (keyword, orderBy, orderAsc, filters, pageNb) async {
                            List<Channel> channels = await _.searchChannel(keyword ?? '');

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
                        Visibility(
                            visible: _.filter?.channelId != null,
                            child: SwitchListTile(title: Text(locals.videoFilterHideAllFromChannel), value: _.filter?.filterAll ?? false, onChanged: _.channelHideAll)),
                        ...getFilterWidgets(locals, _),
                        SwitchListTile(
                            title: Text(locals.videoFilterHide),
                            subtitle: Text(
                              locals.videoFilterHideDescription,
                              style: textTheme.bodySmall?.copyWith(color: colors.secondary),
                            ),
                            value: _.filter?.hideFromFeed ?? false,
                            onChanged: _.hideOnFilteredChanged),
                        Visibility(
                            visible: _.isFilterValid(),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                _.filter?.localizedLabel(locals) ?? '',
                                style: TextStyle(color: colors.primary),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FilledButton(onPressed: _.isFilterValid() ? _.onSave : null, child: Text(locals.save)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
