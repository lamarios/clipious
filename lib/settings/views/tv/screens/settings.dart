import 'package:auto_route/auto_route.dart';
import 'package:clipious/app/states/app.dart';
import 'package:clipious/extensions.dart';
import 'package:clipious/router.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/utils/views/tv/components/tv_button.dart';
import 'package:clipious/utils/views/tv/components/tv_overscan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:locale_names/locale_names.dart';
import 'package:logging/logging.dart';

import '../../../../globals.dart';
import '../../../states/settings.dart';

var log = Logger('TvSettings');

@RoutePage()
class TVSettingsScreen extends StatelessWidget {
  const TVSettingsScreen({super.key});

  openSelectCountry(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();
    var countryNames = countryCodes.map((e) => e.name).toList();
    countryNames.sort();
    AutoRouter.of(context).push(TvSelectFromListRoute(
      title: locals.selectBrowsingCountry,
      options: countryNames,
      selected: cubit.state.country.name,
      onSelect: cubit.selectCountry,
    ));
  }

  List<String> getCategories(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return [
      locals.popular,
      locals.trending,
      locals.subscriptions,
      locals.playlists
    ];
  }

  openManageServers(BuildContext context) {
    AutoRouter.of(context).push(const TvSettingsManageServersRoute());
  }

  openSponsorBlockSettings(BuildContext context) {
    AutoRouter.of(context).push(const TvSponsorBlockSettingsRoute());
  }

  openDearrowSettings(BuildContext context) {
    AutoRouter.of(context).push(const TvDearrowSettingsRoute());
  }

  openSearchHistorySettings(BuildContext context) {
    AutoRouter.of(context).push(const TvSearchHistorySettingsRoute());
  }

  openAppLayout(BuildContext context) {
    AutoRouter.of(context).push(const TvAppLayoutSettingsRoute());
  }

  showSelectLanguage(BuildContext context) {
    var localsList = AppLocalizations.supportedLocales;
    var localsStrings =
        localsList.map((e) => e.nativeDisplayLanguageScript).toList();
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();

    List<String>? localeString = cubit.state.locale?.split('_');
    Locale? selected = localeString != null
        ? Locale.fromSubtags(
            languageCode: localeString[0],
            scriptCode: localeString.length >= 2 ? localeString[1] : null)
        : null;

    AutoRouter.of(context).push(TvSelectFromListRoute(
      title: locals.appLanguage,
      options: [locals.followSystem, ...localsStrings],
      selected: selected?.nativeDisplayLanguageScript ?? locals.followSystem,
      onSelect: (String selected) {
        if (selected == locals.followSystem) {
          cubit.setLocale(localsList, localsStrings, null);
        } else {
          cubit.setLocale(localsList, localsStrings, selected);
        }
      },
    ));
  }

  selectTheme(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();
    AutoRouter.of(context).push(TvSelectFromListRoute(
      title: locals.themeBrightness,
      options:
          ThemeMode.values.map((e) => cubit.getThemeLabel(locals, e)).toList(),
      selected: cubit.getThemeLabel(locals, cubit.state.themeMode),
      onSelect: (String selected) {
        ThemeMode? theme = ThemeMode.values.firstWhereOrNull(
            (element) => cubit.getThemeLabel(locals, element) == selected);
        cubit.setThemeMode(theme);
      },
    ));
  }

  showCustomRydUrl(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<SettingsCubit>();
    final controller =
        TextEditingController(text: cubit.state.returnYoutubeDislikeUrl);

    FocusNode focusNode = FocusNode();
    showTvDialog(
      title: 'URL',
      context: context,
      actions: [
        TvButton(
          onPressed: (context) {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(locals.cancel),
          ),
        ),
        TvButton(
          onPressed: (context) async {
            String newUrl = controller.text.trim();

            if (newUrl.isNotEmpty &&
                !newUrl.startsWith("http://") &&
                !newUrl.startsWith("https://")) {
              showTvAlertdialog(context, locals.error,
                  [Text(locals.customizeAppLayoutExplanation)]);
              return;
            }

            newUrl = newUrl.trim();
            if (newUrl.isNotEmpty && !newUrl.endsWith("/")) {
              newUrl += "/";
            }

            cubit.setReturnYoutubeDislikeUrl(newUrl);
            Navigator.of(context).pop();
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
            child: Text(locals.save),
          ),
        ),
      ],
      builder: (BuildContext context) => [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                autofocus: true,
                focusNode: focusNode,
                textInputAction: TextInputAction.next,
                controller: controller,
                autocorrect: false,
                enableSuggestions: false,
                enableIMEPersonalizedLearning: false,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [],
              ),
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations locals = AppLocalizations.of(context)!;

    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: BlocBuilder<SettingsCubit, SettingsState>(
            builder: (context, state) {
          var cubit = context.read<SettingsCubit>();
          return DefaultTextStyle(
            style: textTheme.bodyLarge!,
            child: ListView(
              children: [
                SettingsTitle(title: locals.browsing),
                SettingsTile(
                  title: locals.customizeAppLayout,
                  description:
                      state.appLayout.map((e) => e.getLabel(locals)).join(", "),
                  onSelected: (context) => openAppLayout(context),
                ),
                SettingsTile(
                  title: locals.country,
                  description: state.country.name,
                  onSelected: (context) => openSelectCountry(context),
                ),
                SettingsTile(
                  title: locals.appLanguage,
                  description:
                      cubit.getLocaleDisplayName() ?? locals.followSystem,
                  onSelected: (context) => showSelectLanguage(context),
                ),
                SettingsTile(
                  title: 'Return YouTube Dislike',
                  description: locals.returnYoutubeDislikeDescription,
                  onSelected: (context) => cubit.toggleReturnYoutubeDislike(
                      !state.useReturnYoutubeDislike),
                  trailing: Switch(
                      onChanged: (value) {},
                      value: state.useReturnYoutubeDislike),
                ),
                SettingsTile(
                  title: locals.rydCustomInstance,
                  description:
                      '${state.returnYoutubeDislikeUrl.isNotEmpty ? '${locals.currentServer(state.returnYoutubeDislikeUrl)}\n' : ''}${locals.rydCustomInstanceDescription}',
                  enabled: state.useReturnYoutubeDislike,
                  onSelected: (context) => showCustomRydUrl(context),
                ),
                SettingsTile(
                  title: locals.searchHistory,
                  description: locals.searchHistoryDescription,
                  onSelected: openSearchHistorySettings,
                ),
                SettingsTile(
                  title: 'DeArrow',
                  description: state.dearrow
                      ? locals.enabled
                      : locals.deArrowSettingDescription,
                  onSelected: openDearrowSettings,
                ),
                SettingsTile(
                  title: locals.videoFilters,
                  description: locals.videoFiltersSettingTileDescriptions,
                  onSelected: (context) => AutoRouter.of(context)
                      .push(const TvFilterListSettingsRoute()),
                ),
                SettingsTitle(title: locals.servers),
                BlocBuilder<AppCubit, AppState>(
                    buildWhen: (previous, current) =>
                        previous.server != current.server,
                    builder: (context, app) {
                      return SettingsTile(
                          title: locals.manageServers,
                          description: app.server != null
                              ? locals.currentServer(app.server!.url)
                              : "",
                          onSelected: openManageServers);
                    }),
                SettingsTitle(title: locals.videoPlayer),
                SettingsTile(
                  title: locals.useDash,
                  description: locals.useDashDescription,
                  onSelected: (context) => cubit.toggleDash(!state.useDash),
                  trailing: Switch(onChanged: (value) {}, value: state.useDash),
                ),
                SettingsTile(
                  title: locals.useProxy,
                  description: locals.useProxyDescription,
                  onSelected: (context) => cubit.toggleProxy(!state.useProxy),
                  trailing:
                      Switch(onChanged: (value) {}, value: state.useProxy),
                ),
                AdjustmentSettingTile(
                  title: locals.skipStep,
                  value: state.skipStep.floor(),
                  description: locals.skipStepDescription,
                  possibleValues: skipSteps,
                  onNewValue: cubit.setSkipStep,
                ),
                SettingsTile(
                  title: locals.exponentialSkip,
                  description: locals.exponentialSkipDescription,
                  onSelected: (context) =>
                      cubit.setSkipExponentially(!state.skipExponentially),
                  trailing: Switch(
                      onChanged: (value) {}, value: state.skipExponentially),
                ),
                AdjustmentSettingTile(
                  title: locals.subtitleFontSize,
                  value: state.subtitleSize.floor(),
                  step: 1,
                  description: locals.subtitleFontSizeDescription,
                  onNewValue: cubit.setSubtitleSize,
                ),
                SettingsTile(
                  title: locals.subtitlesBackground,
                  description: locals.subtitlesBackgroundDescription,
                  onSelected: (context) =>
                      cubit.setSubtitlesBackground(!state.subtitlesBackground),
                  trailing: Switch(
                      onChanged: (value) {}, value: state.subtitlesBackground),
                ),
                SettingsTile(
                  title: locals.rememberSubtitleLanguage,
                  description: locals.rememberSubtitleLanguageDescription,
                  onSelected: (context) =>
                      cubit.toggleRememberSubtitles(!state.rememberSubtitles),
                  trailing: Switch(
                      onChanged: (value) {}, value: state.rememberSubtitles),
                ),
                SettingsTile(
                  title: locals.rememberPlaybackSpeed,
                  description: locals.rememberPlaybackSpeedDescription,
                  onSelected: (context) => cubit.toggleRememberPlaybackSpeed(
                      !state.rememberPlayBackSpeed),
                  trailing: Switch(
                      onChanged: (value) {},
                      value: state.rememberPlayBackSpeed),
                ),
                SettingsTile(
                  title: 'SponsorBlock',
                  description: locals.sponsorBlockDescription,
                  onSelected: openSponsorBlockSettings,
                ),
                SettingsTitle(title: locals.appearance),
                SettingsTile(
                  title: locals.themeBrightness,
                  description: cubit.getThemeLabel(locals, state.themeMode),
                  onSelected: (context) => selectTheme(context),
                ),
                SettingsTile(
                  title: locals.blackBackground,
                  description: locals.blackBackgroundDescription,
                  onSelected: (context) =>
                      cubit.toggleBlackBackground(!state.blackBackground),
                  trailing: Switch(
                      onChanged: (value) {}, value: state.blackBackground),
                ),
                SettingsTile(
                  title: locals.forceTvUi,
                  description: locals.forceTvUiExplanation,
                  onSelected: (context) => cubit.setForceTvUi(!state.forceTvUi),
                  trailing:
                      Switch(onChanged: (value) {}, value: state.forceTvUi),
                ),
                SettingsTitle(title: locals.about),
                SettingsTile(
                  title: '${locals.name}: ${state.packageInfo.appName}',
                  description:
                      '${locals.package}: ${state.packageInfo.packageName}',
                  onSelected: (context) {},
                ),
                SettingsTile(
                  title: '${locals.version}: ${state.packageInfo.version}',
                  description:
                      '${locals.build}: ${state.packageInfo.buildNumber}',
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

  const SettingsTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        top: 32,
      ),
      child: Text(
        title,
        style: textTheme.titleMedium,
      ),
    );
  }
}

class AdjustmentSettingTile extends StatelessWidget {
  final String title;
  final int value;
  final int? step;
  final List<int>? possibleValues;
  final String? description;
  final Function(int) onNewValue;

  const AdjustmentSettingTile(
      {super.key,
      required this.onNewValue,
      required this.title,
      this.description,
      required this.value,
      this.possibleValues,
      this.step})
      : assert(step == null || possibleValues == null,
            'Can\' have both step and possible values');

  onKeyEvent(FocusNode node, KeyEvent event, BuildContext ctx) {
    if (event is KeyUpEvent) {
      log.fine('onTvSelect, ${event.logicalKey}, $event');
      if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
        if (step != null) {
          onNewValue(value - step!);
        } else if (possibleValues != null) {
          int index = possibleValues!.indexOf(value);
          if (index > 0) {
            onNewValue(possibleValues![index - 1]);
          }
        }
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
        if (step != null) {
          onNewValue(value + step!);
        } else if (possibleValues != null) {
          int index = possibleValues!.indexOf(value);
          if (index < possibleValues!.length - 1) {
            onNewValue(possibleValues![index + 1]);
          }
        }
        return KeyEventResult.handled;
      }
    }

    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SettingsTile(
      title: title,
      description: description,
      onKeyEvent: onKeyEvent,
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.chevron_left),
            ),
          ),
          Text(
            value.floor().toString(),
            style: textTheme.bodyLarge,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.chevron_right),
            ),
          ),
        ],
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
  final Function(FocusNode, KeyEvent, BuildContext)? onKeyEvent;

  const SettingsTile(
      {super.key,
      required this.title,
      this.description,
      this.onSelected,
      this.trailing,
      this.autofocus,
      this.leading,
      this.enabled,
      this.onKeyEvent});

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    TextTheme textTheme = Theme.of(context).textTheme;
    return Focus(
        canRequestFocus: enabled,
        autofocus: autofocus ?? false,
        onKeyEvent: (node, event) => onKeyEvent != null
            ? onKeyEvent!(node, event, context)
            : onTvSelect(event, context,
                onSelected != null ? onSelected! : (context) {}),
        child: Builder(builder: (ctx) {
          final FocusNode focusNode = Focus.of(ctx);
          final bool hasFocus = focusNode.hasFocus;
          return ListTile(
            enabled: enabled ?? true,
            leading: leading,
            trailing: trailing,
            selectedTileColor: colors.secondaryContainer.withValues(alpha: 0.5),
            selected: hasFocus,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: textTheme.headlineSmall!.copyWith(
                      color: enabled ?? true
                          ? colors.primary
                          : colors.primary.withValues(alpha: 0.5)),
                ),
                description != null
                    ? Text(
                        description ?? '',
                        style: textTheme.bodyLarge!
                            .copyWith(color: colors.secondary),
                      )
                    : const SizedBox.shrink()
              ],
            ),
          );
        }));
  }
}
