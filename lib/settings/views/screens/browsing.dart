import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/components/channel_notifications.dart';
import 'package:invidious/settings/views/screens/search_history_settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:invidious/settings/views/screens/video_filter.dart';
import 'package:invidious/utils.dart';
import 'package:locale_names/locale_names.dart';
import 'package:optimize_battery/optimize_battery.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../myRouteObserver.dart';
import '../../../utils/views/components/select_list_dialog.dart';
import '../components/app_customizer.dart';

class BrowsingSettings extends StatelessWidget {
  const BrowsingSettings({super.key});


  customizeApp(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => const AlertDialog(
            content: SizedBox(width: 300, child: AppCustomizer())));
  }

  showSelectLanguage(BuildContext context, SettingsState controller) {
    var localsList = AppLocalizations.supportedLocales;
    var localsStrings =
    localsList.map((e) => e.nativeDisplayLanguageScript ?? '').toList();
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();
    var colors = Theme.of(context).colorScheme;

    List<String>? localeString = controller.locale?.split('_');
    Locale? selected = localeString != null
        ? Locale.fromSubtags(
        languageCode: localeString[0],
        scriptCode: localeString.length >= 2 ? localeString[1] : null)
        : null;

    SelectList.show<String>(context,
        values: [locals.followSystem, ...localsStrings],
        value: selected?.nativeDisplayLanguageScript ?? locals.followSystem,
        itemBuilder: (value, selected) => Text(
          value,
          style: TextStyle(color: selected ? colors.primary : null),
        ),
        onSelect: (value) {
          if (value == locals.followSystem) {
            cubit.setLocale(localsList, localsStrings, null);
          } else {
            cubit.setLocale(localsList, localsStrings, value);
          }
        },
        title: locals.appLanguage);

  }

  List<String> getCategories(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [
      locals.popular,
      locals.trending,
      locals.subscriptions,
      locals.playlists,
      locals.history
    ];
  }

  searchCountry(BuildContext context, SettingsState controller) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();
    var colors = Theme.of(context).colorScheme;

    SelectList.show(context,
        values: countryCodes.map((e) => e.name).toList(),
        value: controller.country.name,
        searchFilter: (filter, value) =>
            value.toLowerCase().contains(filter.toLowerCase()),
        itemBuilder: (value, selected) => Text(
          value,
          style: TextStyle(color: selected ? colors.primary : null),
        ),
        onSelect: cubit.selectCountry,
        title: locals.selectBrowsingCountry);
  }

  openVideoFilterSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        settings: ROUTE_SETTINGS_VIDEO_FILTERS,
        builder: (context) => const VideoFilterSettings()));
  }

  openSearchHistorySettings(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(
        settings: ROUTE_SETTINGS_SEARCH_HISTORY,
        builder: (context) => const SearchHistorySettings()));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.background,
        title: Text(locals.browsing),
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(child: BlocBuilder<SettingsCubit, SettingsState>(builder: (context, _) {
        var cubit = context.read<SettingsCubit>();
        return DefaultTabController(
          length: 2,
          child: SettingsList(
            lightTheme: theme,
            darkTheme: theme,
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile(
                    title: Text(locals.country),
                    value: Text(_.country.name),
                    onPressed: (ctx) => searchCountry(ctx, _),
                  ),
                  SettingsTile(
                    title: Text(locals.customizeAppLayout),
                    value: Text(_.appLayout
                        .map((e) => e.getLabel(locals))
                        .join(", ")),
                    onPressed: (ctx) => customizeApp(ctx),
                  ),
                  SettingsTile.switchTile(
                    title: Text(locals.distractionFreeMode),
                    description: Text(locals.distractionFreeModeDescription),
                    initialValue: _.distractionFreeMode,
                    onToggle: cubit.setDistractionFreeMode,
                  ),
                  SettingsTile(
                    title: Text(locals.appLanguage),
                    value: Text(
                        cubit.getLocaleDisplayName() ?? locals.followSystem),
                    onPressed: (ctx) => showSelectLanguage(ctx, _),
                  ),
                  SettingsTile.switchTile(
                    title: const Text('Return YouTube Dislike'),
                    description: Text(locals.returnYoutubeDislikeDescription),
                    initialValue: _.useReturnYoutubeDislike,
                    onToggle: cubit.toggleReturnYoutubeDislike,
                  ),
                  SettingsTile.navigation(
                    title: Text(locals.searchHistory),
                    description: Text(locals.searchHistoryDescription),
                    onPressed: (context) => openSearchHistorySettings(context),
                  ),
                  SettingsTile.navigation(
                    title: Text(locals.videoFilters),
                    description:
                    Text(locals.videoFiltersSettingTileDescriptions),
                    onPressed: openVideoFilterSettings,
                  ),
                ],
              ),
            ],
          ),
        );
      })),
    );
  }
}
