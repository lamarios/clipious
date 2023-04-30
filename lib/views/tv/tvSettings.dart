import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/settings/tvManageServers.dart';
import 'package:invidious/views/tv/settings/tvSelectFromList.dart';
import 'package:invidious/views/tv/settings/tvSponsorBlockSettings.dart';
import 'package:invidious/views/tv/tvButton.dart';
import 'package:invidious/views/tv/tvOverScan.dart';
import 'package:locale_names/locale_names.dart';

import '../../controllers/settingsController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../globals.dart';

class TVSettings extends StatelessWidget {
  const TVSettings({Key? key}) : super(key: key);

  openSelectCountry(BuildContext context, SettingsController controller) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        var countryNames = countryCodes.map((e) => e.name).toList();
        countryNames.sort();
        return TvSelectFromList(
          title: locals.selectBrowsingCountry,
          options: countryNames,
          selected: controller.country.name,
          onSelect: controller.selectCountry,
        );
      },
    ));
  }

  openSelectOnStart(BuildContext context, SettingsController controller) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var categories = getCategories(context);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvSelectFromList(
        title: locals.whenAppStartsShow,
        options: categories,
        selected: categories[controller.onOpen],
        onSelect: (selected) => controller.selectOnOpen(selected, categories),
      ),
    ));
  }

  List<String> getCategories(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [locals.popular, locals.trending, locals.subscriptions, locals.playlists];
  }

  openManageServers(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const TvSettingsManageServers(),
    ));
  }

  openSponsorBlockSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const TvSponsorBlockSettings(),
    ));
  }

  showSelectLanguage(BuildContext context, SettingsController controller) {
    var localsList = AppLocalizations.supportedLocales;
    var localsStrings = localsList.map((e) => e.nativeDisplayLanguageScript ?? '').toList();
    var locals = AppLocalizations.of(context)!;

    List<String>? localeString = controller.locale?.split('_');
    Locale? selected = localeString != null ? Locale.fromSubtags(languageCode: localeString[0], scriptCode: localeString.length >= 2 ? localeString[1] : null) : null;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvSelectFromList(
        title: locals.appLanguage,
        options: [locals.followSystem, ...localsStrings],
        selected: selected?.nativeDisplayLanguageScript ?? locals.followSystem,
        onSelect: (String selected) {
          if (selected == locals.followSystem) {
            controller.setLocale(localsList, localsStrings, null);
          } else {
            controller.setLocale(localsList, localsStrings, selected);
          }
        },
      ),
    ));
  }

  selectTheme(BuildContext context, SettingsController _) {
    var locals = AppLocalizations.of(context)!;
    ColorScheme colors = Theme.of(context).colorScheme;

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => TvSelectFromList(
        title: locals.themeBrightness,
        options: ThemeMode.values.map((e) => _.getThemeLabel(locals, e)).toList(),
        selected: _.getThemeLabel(locals, _.themeMode),
        onSelect: (String selected) {

          ThemeMode? theme = ThemeMode.values.firstWhereOrNull((element) => _.getThemeLabel(locals, element) == selected);
          _.setThemeMode(theme);
        },
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: GetBuilder<SettingsController>(
            init: SettingsController(),
            builder: (_) {
              return DefaultTextStyle(
                style: textTheme.bodyLarge!,
                child: ListView(
                  children: [
                    SettingsTitle(title: locals.browsing),
                    SettingsTile(
                      title: locals.country,
                      description: _.country.name,
                      onSelected: (context) => openSelectCountry(context, _),
                    ),
                    SettingsTile(
                      title: locals.appLanguage,
                      description: _.getLocaleDisplayName() ?? locals.followSystem,
                      onSelected: (context) => showSelectLanguage(context, _),
                    ),
                    SettingsTile(
                      title: 'Return YouTube Dislike',
                      description: locals.returnYoutubeDislikeDescription,
                      onSelected: (context) => _.toggleReturnYoutubeDislike(!_.useReturnYoutubeDislike),
                      trailing: Switch(onChanged: (value) {}, value: _.useReturnYoutubeDislike),
                    ),
/*
                    SettingsTile(
                      title: locals.whenAppStartsShow,
                      description: getCategories(context)[_.onOpen],
                      onSelected: (context) => openSelectOnStart(context, _),
                    ),
*/
                    SettingsTitle(title: locals.servers),
                    SettingsTile(title: locals.manageServers, description: locals.currentServer(db.getCurrentlySelectedServer().url), onSelected: openManageServers),
                    SettingsTile(
                      title: locals.skipSslVerification,
                      description: locals.skipSslVerification,
                      onSelected: (context) => _.toggleSslVerification(!_.skipSslVerification),
                      trailing: Switch(onChanged: (value) {}, value: _.skipSslVerification),
                    ),
                    SettingsTitle(title: locals.videoPlayer),
                    SettingsTile(
                      title: locals.useDash,
                      description: locals.useDashDescription,
                      onSelected: (context) => _.toggleDash(!_.useDash),
                      trailing: Switch(onChanged: (value) {}, value: _.useDash),
                    ),
                    SettingsTile(
                      title: locals.useProxy,
                      description: locals.useProxyDescription,
                      onSelected: (context) => _.toggleProxy(!_.useProxy),
                      trailing: Switch(onChanged: (value) {}, value: _.useProxy),
                    ),
                    SettingsTile(
                      title: locals.subtitleFontSize,
                      description: locals.subtitleFontSizeDescription,
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: TvButton(
                                onPressed: (ctx) => _.changeSubtitleSize(increase: false),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.remove),
                                )),
                          ),
                          Text(
                            _.subtitleSize.floor().toString(),
                            style: textTheme.bodyLarge,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: TvButton(
                                onPressed: (ctx) => _.changeSubtitleSize(increase: true),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.add),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SettingsTile(
                      title: 'SponsorBlock',
                      description: locals.sponsorBlockDescription,
                      onSelected: openSponsorBlockSettings,
                    ),
                    SettingsTitle(title: locals.appearance),
                    SettingsTile(
                      title: locals.themeBrightness,
                      description: _.getThemeLabel(locals, _.themeMode),
                      onSelected: (context) => selectTheme(context, _),
                    ),
                    SettingsTile(
                      title: locals.blackBackground,
                      description: locals.blackBackgroundDescription,
                      onSelected: (context) => _.toggleBlackBackground(!_.blackBackground),
                      trailing: Switch(onChanged: (value) {}, value: _.blackBackground),
                    ),
                    SettingsTitle(title: locals.about),
                    SettingsTile(
                      title: '${locals.name}: ${_.packageInfo.appName}',
                      description: '${locals.package}: ${_.packageInfo.packageName}',
                      onSelected: (context) {},
                    ),
                    SettingsTile(
                      title: '${locals.version}: ${_.packageInfo.version}',
                      description: '${locals.build}: ${_.packageInfo.buildNumber}',
                      onSelected: (context) {},
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class SettingsTitle extends StatelessWidget {
  final String title;

  const SettingsTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 32,
      ),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  final bool? autofocus;
  final String title;
  final bool? enabled;
  final String? description;
  final Function(BuildContext context)? onSelected;
  final Widget? trailing;
  final Widget? leading;

  const SettingsTile({Key? key, required this.title, this.description, this.onSelected, this.trailing, this.autofocus, this.leading, this.enabled}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Focus(
        canRequestFocus: enabled,
        autofocus: autofocus ?? false,
        onKeyEvent: (node, event) => onTvSelect(event, context, onSelected != null ? onSelected! : (context) {}),
        child: Builder(builder: (ctx) {
          final FocusNode focusNode = Focus.of(ctx);
          final bool hasFocus = focusNode.hasFocus;
          return ListTile(
            enabled: enabled ?? true,
            leading: leading,
            trailing: trailing,
            selectedTileColor: colors.secondaryContainer.withOpacity(0.5),
            selected: hasFocus,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headlineSmall!.copyWith(color: enabled ?? true ? colors.primary : colors.primary.withOpacity(0.5)),
                ),
                description != null
                    ? Text(
                        description ?? '',
                        style: textTheme.bodyLarge!.copyWith(color: colors.secondary),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        }));
  }
}
