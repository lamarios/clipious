import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/notifications/state/bell_icon.dart';
import 'package:invidious/settings/states/settings.dart';
import 'package:optimize_battery/optimize_battery.dart';

import '../../../utils.dart';

class BellIcon extends StatelessWidget {
  final String channelId;

  const BellIcon({super.key, required this.channelId});

  toggleNotifications(BuildContext context) async {
    var cubit = context.read<BellIconCubit>();
    var result = await cubit.toggle();
    switch (result) {
      case TurnOnStatus.needToEnableBackGroundServices:
        if (context.mounted) {
          var locals = AppLocalizations.of(context)!;
          okCancelDialog(context, locals.askToEnableBackgroundServiceTitle, locals.askToEnableBackgroundServiceContent,
              () async {
            var settings = context.read<SettingsCubit>();
            var res = await settings.setBackgroundNotifications(true);
            if (context.mounted) {
              if (res == EnableBackGroundNotificationResponse.needBatteryOptimization) {
                showBatteryOptimizationDialog(context);
              } else {
                cubit.toggle();
              }
            }
          });
        }
        break;
      case TurnOnStatus.needToEnableBatteryOptimization:
        showBatteryOptimizationDialog(context);
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    return BlocProvider(
      create: (context) => BellIconCubit(false, context.read<SettingsCubit>(), channelId),
      child: BlocBuilder<BellIconCubit, bool>(
        builder: (context, state) {
          return IconButton(
            onPressed: () => toggleNotifications(context),
            icon: const Icon(Icons.notifications),
            color: state ? colors.primary : null,
          ).animate(target: state ? 1 : 0, effects: state?[const ShakeEffect()]:[]);
        },
      ),
    );
  }
}
