import 'package:clipious/player/models/sleep_timer.dart';
import 'package:clipious/player/states/sleep_timer.dart';
import 'package:clipious/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:gap/gap.dart';

const sleepTimerMinDuration = Duration(minutes: 1);
const sleepTimerMaxDuration = Duration(hours: 6);

class SleepTimerSheet extends StatelessWidget {
  const SleepTimerSheet({super.key});

  static Future<SleepTimer?> show(BuildContext context) {
    return showSafeModalBottomSheet<SleepTimer?>(
        showDragHandle: true,
        context: context,
        builder: (context) => const SleepTimerSheet());
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) => SleepTimerCubit(const SleepTimer()),
      child:
          BlocBuilder<SleepTimerCubit, SleepTimer>(builder: (context, state) {
        final cubit = context.read<SleepTimerCubit>();

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Slider(
              min: sleepTimerMinDuration.inMilliseconds.toDouble(),
              max: sleepTimerMaxDuration.inMilliseconds.toDouble(),
              value: state.duration.inMilliseconds.toDouble(),
              divisions:
                  (sleepTimerMaxDuration - sleepTimerMinDuration).inMinutes,
              label: prettyDurationCustom(state.duration),
              onChanged: (value) =>
                  cubit.setDuration(Duration(milliseconds: value.floor())),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () => cubit.setDuration(
                        state.duration - const Duration(minutes: 1)),
                    icon: const Icon(Icons.remove)),
                SizedBox(
                    width: 50,
                    child: Text(
                      prettyDurationCustom(state.duration),
                      textAlign: TextAlign.center,
                    )),
                IconButton(
                    onPressed: () => cubit.setDuration(
                        state.duration + const Duration(minutes: 1)),
                    icon: const Icon(Icons.add)),
              ],
            ),
            SwitchListTile(
              title: Text(locals.stopTheVideo),
              subtitle: Text(locals.stopTheVideoExplanation),
              value: state.stopVideo,
              onChanged: (value) => cubit.setStopVideo(value),
            ),
            const Gap(10),
            FilledButton.tonal(
                onPressed: () => Navigator.of(context).pop(state),
                child: Text(locals.setTimer)),
            const Gap(10),
          ],
        );
      }),
    );
  }
}
