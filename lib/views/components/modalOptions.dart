import 'package:flutter/material.dart';

class ModalOption extends StatelessWidget {
  final Function(BuildContext context) onTap;
  final String label;
  const ModalOption({Key? key, required this.onTap, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
            onTap: () => onTap(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text(label, style: const TextStyle(fontSize: 17),)],
              ),
            ));
  }
}
