import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:invidious/settings/views/screens/settings.dart';
import 'package:locale_names/locale_names.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../utils/views/components/select_list_dialog.dart';
import '../components/app_customizer.dart';

@RoutePage()
class BrowsingSettingsScreen extends StatelessWidget {
  const BrowsingSettingsScreen({super.key});

  customizeApp(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        useRootNavigator: false,
        context: context,
        builder: (context) => const AlertDialog(
            content: SizedBox(width: 300, child: AppCustomizer())));
  }

  customRydInstanceDialog(BuildContext context) async {
    SettingsCubit cubit = context.read<SettingsCubit>();
    final controller =
        TextEditingController(text: cubit.state.returnYoutubeDislikeUrl);
    final formKey = GlobalKey<FormState>();

    var locals = AppLocalizations.of(context)!;
    String? newUrl = await showDialog<String>(
        context: context,
        useRootNavigator: false,
        builder: (BuildContext context) => Dialog(
              child: Form(
                key: formKey,
                child: SizedBox(
                  width: 400,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text('URL'),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(locals.rydCustomInstanceDescription),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return null;
                            }
                            final trimmed = value.trim();
                            if (!trimmed.startsWith("http://") &&
                                !trimmed.startsWith("https://")) {
                              return locals.returnYoutubeUrlValidation;
                            }

                            return null;
                          },
                          controller: controller,
                          autocorrect: false,
                          enableSuggestions: false,
                          enableIMEPersonalizedLearning: false,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(locals.cancel),
                            ),
                            TextButton(
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  Navigator.of(context).pop(controller.text);
                                }
                              },
                              child: Text(locals.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ));

    if (newUrl != null) {
      newUrl = newUrl.trim();
      if (newUrl.isNotEmpty && !newUrl.endsWith("/")) {
        newUrl += "/";
      }

      cubit.setReturnYoutubeDislikeUrl(newUrl);
    }
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
    AutoRouter.of(context).push(const VideoFilterSettingsRoute());
  }

  openSearchHistorySettings(BuildContext context) {
    AutoRouter.of(context).push(const SearchHistorySettingsRoute());
  }

  openDearrowSettings(BuildContext context) {
    AutoRouter.of(context).push(const DeArrowSettingsRoute());
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(locals.browsing),
      ),
      body: SafeArea(child:
          BlocBuilder<SettingsCubit, SettingsState>(builder: (context, state) {
        var cubit = context.read<SettingsCubit>();
        var filterCount = db.getAllFilters().length;
        return DefaultTabController(
          length: 2,
          child: SettingsList(
            lightTheme: theme,
            darkTheme: theme,
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile(
                    leading: const Icon(Icons.public),
                    title: Text(locals.country),
                    value: Text(state.country.name),
                    onPressed: (ctx) => searchCountry(ctx, state),
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.app_settings_alt),
                    title: Text(locals.customizeAppLayout),
                    value: Text(state.appLayout
                        .map((e) => e.getLabel(locals))
                        .join(", ")),
                    onPressed: (ctx) => customizeApp(ctx),
                  ),
                  SettingsTile.switchTile(
                    leading: const Icon(Icons.self_improvement_outlined),
                    title: Text(locals.distractionFreeMode),
                    description: Text(locals.distractionFreeModeDescription),
                    initialValue: state.distractionFreeMode,
                    onToggle: cubit.setDistractionFreeMode,
                  ),
                  SettingsTile(
                    leading: const Icon(Icons.language),
                    title: Text(locals.appLanguage),
                    value: Text(
                        cubit.getLocaleDisplayName() ?? locals.followSystem),
                    onPressed: (ctx) => showSelectLanguage(ctx, state),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.manage_search),
                    title: Text(locals.searchHistory),
                    description: Text(state.useSearchHistory
                        ? locals.enabled
                        : locals.searchHistoryDescription),
                    onPressed: (context) => openSearchHistorySettings(context),
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.rule_sharp),
                    title: Text(locals.videoFilters),
                    description: Text(
                        '${locals.videoFiltersSettingTileDescriptions}${filterCount > 0 ? '\n${locals.nFilters(filterCount)}' : ''}'),
                    onPressed: openVideoFilterSettings,
                  ),
                  SettingsTile.navigation(
                    leading: const Icon(Icons.adjust),
                    title: const Text('DeArrow'),
                    description: Text(state.dearrow
                        ? locals.enabled
                        : locals.deArrowSettingDescription),
                    onPressed: openDearrowSettings,
                  ),
                ],
              ),
              SettingsSection(title: Text('Return YouTube Dislike'), tiles: [
                SettingsTile.switchTile(
                  leading: const Icon(Icons.thumb_down),
                  title: Text(locals.enabled),
                  description: Text(locals.returnYoutubeDislikeDescription),
                  initialValue: state.useReturnYoutubeDislike,
                  onToggle: cubit.toggleReturnYoutubeDislike,
                ),
                SettingsTile(
                  enabled: state.useReturnYoutubeDislike,
                  leading: const Icon(Icons.network_ping),
                  title: Text(locals.rydCustomInstance),
                  description: Text(
                      '${state.returnYoutubeDislikeUrl.isNotEmpty ? '${locals.currentServer(state.returnYoutubeDislikeUrl)}\n' : ''}${locals.rydCustomInstanceDescription}'),
                  onPressed: (context) => customRydInstanceDialog(context),
                )
              ])
            ],
          ),
        );
      })),
    );
  }
}
