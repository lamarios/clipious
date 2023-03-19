import 'package:get/get.dart';

import '../models/comment.dart';
import '../models/videoComments.dart';

class SingleCommentController extends GetxController{
  bool showingChildren = false;
  Comment comment;

  VideoComments? children;

  SingleCommentController({required this.comment});

  toggleShowChildren(){
    showingChildren = !showingChildren;
    update();
  }
}