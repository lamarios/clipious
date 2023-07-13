import 'package:flutter/material.dart';
import 'package:invidious/main.dart';
import 'package:invidious/utils.dart';
import 'package:invidious/views/tv/tvOverScan.dart';

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

  const TvTextField(
      {Key? key,
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
      this.decoration})
      : super(key: key);

  openTextField(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => TvTextFieldFiller(
              controller: controller,
              autocorrect: autocorrect,
              autofocus: autofocus,
              onSubmitted: onSubmitted,
              textInputAction: textInputAction,
              obscureText: obscureText,
              autofillHints: autofillHints,
              decoration: decoration,
            )));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Focus(
      autofocus: autofocus ?? false,
      onFocusChange: onFocusChanged,
      focusNode: focusNode,
      onKeyEvent: (node, event) => onTvSelect(event, context, (context) => openTextField(context)),
      child: Builder(builder: (ctx) {
        bool hasFocus = Focus.of(ctx).hasFocus;
        print(hasFocus);

        bool showLabel = controller.text.isEmpty && decoration?.label != null;

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:
                BoxDecoration(color: hasFocus ? colors.secondaryContainer : colors.background, border: Border.all(color: colors.secondaryContainer, width: 2), borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  leading ?? const SizedBox.shrink(),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: showLabel ? decoration!.label! : Text((obscureText ?? false) ? "************" : controller.text),
                    ),
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

class TvTextFieldFiller extends StatelessWidget {
  final TextEditingController controller;
  final bool? autofocus;
  final bool? autocorrect;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final Iterable<String>? autofillHints;
  final InputDecoration? decoration;

  const TvTextFieldFiller(
      {Key? key, required this.controller, this.autofocus, this.autocorrect, this.focusNode, this.onSubmitted, this.textInputAction, this.obscureText, this.autofillHints, this.decoration})
      : super(key: key);

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
