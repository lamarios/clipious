import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/router.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/utils/views/tv/components/tv_overscan.dart';

class TvTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool? autofocus;
  final bool? autocorrect;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final Function(bool focus)? onFocusChanged;
  final Widget? leading;
  final Widget? trailing;
  final bool? obscureText;
  final Iterable<String>? autofillHints;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;

  const TvTextField(
      {super.key,
      required this.controller,
      this.autofocus,
      this.autocorrect,
      this.focusNode,
      this.onSubmitted,
      this.textInputAction,
      this.onFocusChanged,
      this.leading,
      this.trailing,
      this.obscureText,
      this.autofillHints,
      this.decoration,
      this.keyboardType});

  openTextField(BuildContext context) {
    AutoRouter.of(context).push(TvTextFieldRoute(
        controller: controller,
        autocorrect: autocorrect,
        autofocus: autofocus,
        onSubmitted: onSubmitted,
        textInputAction: textInputAction,
        obscureText: obscureText,
        autofillHints: autofillHints,
        decoration: decoration,
        keyboardType: keyboardType));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Focus(
      autofocus: autofocus ?? false,
      onFocusChange: onFocusChanged,
      focusNode: focusNode,
      onKeyEvent: (node, event) => onTvSelect(event, context, (context) => openTextField(context)),
      child: Builder(builder: (ctx) {
        bool hasFocus = Focus.of(ctx).hasFocus;

        bool showLabel = controller.text.isEmpty && decoration?.label != null;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
            duration: animationDuration ~/ 2,
            decoration: BoxDecoration(
                color: hasFocus ? colors.secondaryContainer : colors.background,
                borderRadius: hasFocus ? BorderRadius.circular(10) : null),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  leading ?? const SizedBox.shrink(),
                  Expanded(
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 2, color: colors.secondaryContainer))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: showLabel
                              ? decoration!.label!
                              : Text(
                                  (obscureText ?? false) ? "************" : controller.text,
                                  style: textTheme.bodyLarge,
                                ),
                        )),
                  ),
                  trailing ?? const SizedBox.shrink()
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

@RoutePage()
class TvTextFieldScreen extends StatelessWidget {
  final TextEditingController controller;
  final bool? autofocus;
  final bool? autocorrect;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Iterable<String>? autofillHints;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;

  const TvTextFieldScreen(
      {super.key,
      required this.controller,
      this.autofocus,
      this.autocorrect,
      this.focusNode,
      this.onSubmitted,
      this.textInputAction,
      this.obscureText,
      this.autofillHints,
      this.decoration,
      this.keyboardType});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: TvOverscan(
        child: DefaultTextStyle(
          style: textTheme.bodyLarge!,
          child: Column(
            children: [
              Expanded(
                  child: Container(
                alignment: Alignment.center,
                child: TextField(
                  autofocus: true,
                  autocorrect: autocorrect ?? true,
                  controller: controller,
                  keyboardType: keyboardType,
                  onSubmitted: (value) {
                    if (onSubmitted != null) {
                      onSubmitted!(value);
                    }
                    Navigator.of(context).pop();
                  },
                  textInputAction: textInputAction,
                  autofillHints: autofillHints,
                  decoration: decoration ?? const InputDecoration(),
                  obscureText: obscureText ?? false,
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
