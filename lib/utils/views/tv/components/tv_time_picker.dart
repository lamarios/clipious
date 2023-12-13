import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:invidious/utils/states/tv/time_picker.dart';
import 'package:invidious/utils/views/tv/components/tv_button.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

RegExp time = RegExp(r'^[0-2][0-3]:[0-5][0-9]:[0-5][0-9]$');

// removes the seconds from the displayed time
String displayTime(String time) {
  return time.split(":").sublist(0, 2).join(":");
}

class TvTimePicker extends StatelessWidget {
  final String value;
  final Function(String value) onTimePicked;

  const TvTimePicker({super.key, required this.value, required this.onTimePicked});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return TvButton(
      onPressed: (context) => AutoRouter.of(context).push(TvTimePickerRoute(value: value, onTimePicked: onTimePicked)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          displayTime(value),
          style: textTheme.titleLarge,
        ),
      ),
    );
  }
}

@RoutePage()
class TvTimePickerScreen extends StatelessWidget {
  final String value;
  final Function(String value) onTimePicked;

  const TvTimePickerScreen({super.key, required this.value, required this.onTimePicked});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: TvOverscan(
          child: BlocProvider(
        create: (context) => TimePickerCubit(value),
        child: BlocBuilder<TimePickerCubit, String>(builder: (context, _) {
          var cubit = context.read<TimePickerCubit>();
          return Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TimeChanger(
                  value: cubit.getHoursString(),
                  onUp: () {
                    cubit.addHours(1);
                  },
                  onDown: () {
                    cubit.addHours(-1);
                  },
                  autoFocus: true,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  ':',
                  style: textTheme.displayMedium,
                ),
                const SizedBox(
                  width: 8,
                ),
                TimeChanger(
                  value: cubit.getMinutesString(),
                  onUp: () {
                    cubit.addMinutes(1);
                  },
                  onDown: () {
                    cubit.addMinutes(-1);
                  },
                ),
                const SizedBox(
                  width: 8,
                ),
                TvButton(
                  unfocusedColor: colors.secondaryContainer.withOpacity(0),
                  focusedColor: colors.secondaryContainer,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      size: 40,
                    ),
                  ),
                  onPressed: (context) {
                    AutoRouter.of(context).pop();
                    return onTimePicked(_);
                  },
                )
              ],
            ),
          );
        }),
      )),
    );
  }
}

class TimeChanger extends StatelessWidget {
  final String value;
  final Function() onUp;
  final Function() onDown;
  final bool autoFocus;

  const TimeChanger({super.key, required this.value, required this.onUp, required this.onDown, this.autoFocus = false});

  KeyEventResult handleKeyEvent(FocusNode node, KeyEvent event) {
    if (event is KeyUpEvent) {
      if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
        onUp();
        return KeyEventResult.handled;
      }
      if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
        onDown();
        return KeyEventResult.handled;
      }
    }
    return KeyEventResult.ignored;
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var colors = Theme.of(context).colorScheme;
    return Focus(
      onKeyEvent: handleKeyEvent,
      autofocus: autoFocus,
      child: Builder(builder: (ctx) {
        bool hasFocus = Focus.of(ctx).hasFocus;
        return AnimatedContainer(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: hasFocus ? colors.secondaryContainer : colors.secondaryContainer.withOpacity(0),
          ),
          padding: const EdgeInsets.all(8),
          duration: animationDuration,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.expand_less,
                color: colors.secondary,
              ),
              Text(
                value,
                style: textTheme.displayMedium,
              ),
              Icon(Icons.expand_more, color: colors.secondary),
            ],
          ),
        );
      }),
    );
  }
}
