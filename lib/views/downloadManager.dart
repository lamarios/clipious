import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get.dart';

import '../controllers/downloadController.dart';

class DownloadManager extends StatelessWidget {
  const DownloadManager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locals.downloads),
      ),
      body: SafeArea(
        bottom: false,
        child: GetBuilder<DownloadController>(
          init: DownloadController(),
          tag: 'dl',
          builder: (_) {
            return Text(_.downloads.toString());
          },
        ),
      ),
    );
  }
}
