import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/app/states/app.dart';
import 'package:invidious/myRouteObserver.dart';
import 'package:invidious/settings/views/screens/app_logs.dart';
import 'package:invidious/settings/views/screens/search_history_settings.dart';
import 'package:invidious/settings/views/screens/sponsor_block_settings.dart';
import 'package:invidious/settings/views/screens/video_filter.dart';
import 'package:locale_names/locale_names.dart';
import 'package:select_dialog/select_dialog.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../states/settings.dart';
import '../../../globals.dart';
import '../../../main.dart';
import 'manage_servers.dart';

settingsTheme(ColorScheme colorScheme) => SettingsThemeData(
    settingsSectionBackground: colorScheme.background,
    settingsListBackground: colorScheme.background,
    titleTextColor: colorScheme.primary,
    dividerColor: colorScheme.onBackground,
    tileDescriptionTextColor: colorScheme.secondary,
    leadingIconsColor: colorScheme.secondary,
    tileHighlightColor: colorScheme.secondaryContainer);

class Settings extends StatelessWidget {
  const Settings({super.key});

  manageServers(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(settings: ROUTE_SETTINGS_MANAGE_SERVERS, builder: (context) => const ManageServers()));
  }

  openSponsorBlockSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(settings: ROUTE_SETTINGS_SPONSOR_BLOCK, builder: (context) => const SponsorBlockSettings()));
  }

  openVideoFilterSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(settings: ROUTE_SETTINGS_VIDEO_FILTERS, builder: (context) => const VideoFilterSettings()));
  }

  openSearchHistorySettings(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(settings: ROUTE_SETTINGS_SEARCH_HISTORY, builder: (context) => const SearchHistorySettings()));
  }

  openAppLogs(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(settings: ROUTE_SETTINGS_SEARCH_HISTORY, builder: (context) => const AppLogs()));
  }

  searchCountry(BuildContext context, SettingsState controller) {
    var locals = AppLocalizations.of(context);
    var cubit = context.read<SettingsCubit>();
    SelectDialog.showModal<String>(
      context,
      label: locals?.selectBrowsingCountry,
      selectedValue: controller.country.name,
      items: countryCodes.map((e) => e.name).toList(),
      onChange: (String selected) {
        cubit.selectCountry(selected);
      },
    );
  }

  selectOnOpen(BuildContext context, SettingsState controller) {
    var categories = getCategories(context);
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();

    SelectDialog.showModal<String>(
      context,
      label: locals.showOnStart,
      selectedValue: categories[controller.onOpen],
      showSearchBox: false,
      items: categories,
      onChange: (String selected) {
        cubit.selectOnOpen(selected, categories);
      },
    );
  }

  showSelectLanguage(BuildContext context, SettingsState controller) {
    var localsList = AppLocalizations.supportedLocales;
    var localsStrings = localsList.map((e) => e.nativeDisplayLanguageScript ?? '').toList();
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();

    List<String>? localeString = controller.locale?.split('_');
    Locale? selected = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    SelectDialog.showModal<String>(
      context,
      label: locals.appLanguage,
      selectedValue: selected?.nativeDisplayLanguageScript ?? locals.followSystem,
      showSearchBox: false,
      items: [locals.followSystem, ...localsStrings],
      onChange: (String selected) {
        if (selected == locals.followSystem) {
          cubit.setLocale(localsList, localsStrings, null);
        } else {
          cubit.setLocale(localsList, localsStrings, selected);
        }
      },
    );
  }

  List<String> getCategories(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [locals.popular, locals.trending, locals.subscriptions, locals.playlists, locals.history];
  }

  selectTheme(BuildContext context, SettingsState _) {
    var cubit = context.read<SettingsCubit>();
    var locals = AppLocalizations.of(context)!;
    showDialog(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        builder: (ctx) => SizedBox(
              height: 200,
              child: SimpleDialog(
                  title: Text(locals.themeBrightness),
                  children: ThemeMode.values
                      .map((e) => RadioListTile(
                          title: Text(cubit.getThemeLabel(locals, e)),
                          value: e,
                          groupValue: _.themeMode,
                          onChanged: (value) {
                            Navigator.of(ctx).pop();
                            cubit.setThemeMode(value);
                          }))
                      .toList()),
            ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    var locals = AppLocalizations.of(context)!;
    SettingsThemeData theme = settingsTheme(colorScheme);

    return BlocProvider(
      create: (BuildContext context) => SettingsCubit(SettingsState(), context.read<AppCubit>()),
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (ctx, _) {
          var cubit = ctx.read<SettingsCubit>();
          return Scaffold(
              extendBody: true,
              bottomNavigationBar: const SizedBox.shrink(),
              appBar: AppBar(
                backgroundColor: colorScheme.background,
                scrolledUnderElevation: 0,
                title: Text(locals.settings),
              ),
              backgroundColor: colorScheme.background,
              body: SafeArea(
                  child: SettingsList(
                lightTheme: theme,
                darkTheme: theme,
                sections: [
                  SettingsSection(
                    title: Text(locals.browsing),
                    tiles: [
                      SettingsTile(
                        title: Text(locals.country),
                        value: Text(_.country.name),
                        onPressed: (ctx) => searchCountry(ctx, _),
                      ),
                      SettingsTile(
                        title: Text(locals.whenAppStartsShow),
                        value: Text(getCategories(ctx)[_.onOpen]),
                        onPressed: (ctx) => selectOnOpen(ctx, _),
                      ),
                      SettingsTile(
                        title: Text(locals.appLanguage),
                        value: Text(cubit.getLocaleDisplayName() ?? locals.followSystem),
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
                        onPressed: (context) => openSearchHistorySettings(ctx),
                      ),
                      SettingsTile.navigation(
                        title: Text(locals.videoFilters),
                        description: Text(locals.videoFiltersSettingTileDescriptions),
                        onPressed: openVideoFilterSettings,
                      ),
                    ],
                  ),
                  SettingsSection(title: Text(locals.servers), tiles: [
                    SettingsTile.navigation(
                      title: Text(locals.manageServers),
                      description: BlocBuilder<AppCubit, AppState>(
                          buildWhen: (previous, current) => previous.server != current.server, builder: (context, app) => Text(app.server != null ? locals.currentServer(app.server!.url) : "")),
                      onPressed: manageServers,
                    ),
                    SettingsTile.switchTile(
                      title: Text(locals.skipSslVerification),
                      description: Text(locals.skipSslVerificationDescription),
                      initialValue: _.skipSslVerification,
                      onToggle: cubit.toggleSslVerification,
                    )
                  ]),
                  SettingsSection(title: Text(locals.videoPlayer), tiles: [
                    SettingsTile.switchTile(
                      initialValue: _.useDash,
                      onToggle: cubit.toggleDash,
                      title: Text(locals.useDash),
                      description: Text(locals.useDashDescription),
                    ),
                    SettingsTile.switchTile(
                      initialValue: _.useProxy,
                      onToggle: cubit.toggleProxy,
                      title: Text(locals.useProxy),
                      description: Text(locals.useProxyDescription),
                    ),
                    SettingsTile.switchTile(
                      initialValue: _.autoplayVideoOnLoad,
                      onToggle: cubit.toggleAutoplayOnLoad,
                      title: Text(locals.autoplayVideoOnLoad),
                      description: Text(locals.autoplayVideoOnLoadDescription),
                    ),
                    SettingsTile(
                      title: Text(locals.subtitleFontSize),
                      description: Text(locals.subtitleFontSizeDescription),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(onPressed: () => cubit.changeSubtitleSize(increase: false), icon: const Icon(Icons.remove)),
                          Text(_.subtitleSize.floor().toString()),
                          IconButton(onPressed: () => cubit.changeSubtitleSize(increase: true), icon: const Icon(Icons.add)),
                        ],
                      ),
                    ),
                    SettingsTile.switchTile(
                      initialValue: _.rememberSubtitles,
                      onToggle: cubit.toggleRememberSubtitles,
                      title: Text(locals.rememberSubtitleLanguage),
                      description: Text(locals.rememberSubtitleLanguageDescription),
                    ),
                    SettingsTile.switchTile(
                      initialValue: _.rememberPlayBackSpeed,
                      onToggle: cubit.toggleRememberPlaybackSpeed,
                      title: Text(locals.rememberPlaybackSpeed),
                      description: Text(locals.rememberPlaybackSpeedDescription),
                    ),
                    SettingsTile.navigation(
                      title: const Text('SponsorBlock'),
                      description: Text(locals.sponsorBlockDescription),
                      onPressed: openSponsorBlockSettings,
                    ),
                    SettingsTile.switchTile(
                      initialValue: _.forceLandscapeFullScreen,
                      onToggle: cubit.toggleForceLandscapeFullScreen,
                      title: Text(locals.lockFullScreenToLandscape),
                      description: Text(locals.lockFullScreenToLandscapeDescription),
                    ),
                    SettingsTile.switchTile(
                      initialValue: _.fillFullscreen,
                      onToggle: cubit.toggleFillFullscreen,
                      title: Text(locals.fillFullscreen),
                      description: Text(locals.fillFullscreenDescription),
                    ),
                  ]),
                  SettingsSection(
                    title: Text(locals.appearance),
                    tiles: [
                      SettingsTile.switchTile(
                        initialValue: _.useDynamicTheme,
                        onToggle: cubit.toggleDynamicTheme,
                        title: Text(locals.useDynamicTheme),
                        description: Text(locals.useDynamicThemeDescription),
                      ),
                      SettingsTile(
                        title: Text(locals.themeBrightness),
                        value: Text(cubit.getThemeLabel(locals, _.themeMode)),
                        onPressed: (ctx) => selectTheme(ctx, _),
                      ),
                      SettingsTile.switchTile(
                        initialValue: _.blackBackground,
                        onToggle: cubit.toggleBlackBackground,
                        title: Text(locals.blackBackground),
                        description: Text(locals.blackBackgroundDescription),
                      ),
                    ],
                  ),
                  SettingsSection(title: (Text(locals.about)), tiles: [
                    SettingsTile(title: const Center(child: SizedBox(height: 150, width: 150, child: AppIconImage()))),
                    SettingsTile(
                      title: Text('${locals.name}: ${_.packageInfo.appName}'),
                      description: Text('${locals.package}: ${_.packageInfo.packageName}'),
                    ),
                    SettingsTile(
                      title: Text('${locals.version}: ${_.packageInfo.version}'),
                      description: Text('${locals.build}: ${_.packageInfo.buildNumber}'),
                    ),
                    SettingsTile(
                      title: Text(locals.appLogs),
                      description: Text(locals.appLogsDescription),
                      onPressed: openAppLogs,
                    )
                  ])
                ],
              )));
        },
      ),
    );
  }
}
