import 'package:flutter/material.dart';

import '../../models/db/videoFilter.dart';

class VideoFilterItem extends StatelessWidget {
  final VideoFilter filter;
  const VideoFilterItem({Key? key, required this.filter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(filter.value);
  }
}
