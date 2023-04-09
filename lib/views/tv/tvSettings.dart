import 'package:application_icon/application_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/settings/tvManageServers.dart';
import 'package:invidious/views/tv/settings/tvSelectFromList.dart';
import 'package:invidious/views/tv/settings/tvSponsorBlockSettings.dart';

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

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    return Scaffold(
      body: GetBuilder<SettingsController>(
          init: SettingsController(),
          builder: (_) {
            return Padding(
              padding: EdgeInsets.all(40),
              child: ListView(
                children: [
                  SettingsTitle(title: locals.browsing),
                  SettingsTile(
                    title: locals.country,
                    description: _.country.name,
                    onSelected: (context) => openSelectCountry(context, _),
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
                    title: 'SponsorBlock',
                    description: locals.sponsorBlockDescription,
                    onSelected: openSponsorBlockSettings,
                  ),
                  SettingsTitle(title: locals.appearance),
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
                  style: TextStyle(color: enabled ?? true ? colors.primary : colors.primary.withOpacity(0.5), fontSize: 25),
                ),
                description != null
                    ? Text(
                        description ?? '',
                        style: TextStyle(color: colors.secondary),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        }));
  }
}
