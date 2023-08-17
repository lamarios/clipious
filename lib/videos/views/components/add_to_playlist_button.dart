import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invidious/videos/states/add_to_playlist_button.dart';

import 'add_to_playlist.dart';

class VideoAddToPlaylistButton extends StatelessWidget {
  String? videoId;

  VideoAddToPlaylistButton({Key? key, this.videoId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocBuilder<AddToPlaylistButtonCubit, AddToPlaylistButtonState>(
      builder: (context, _) => Visibility(
        visible: _.isLoggedIn,
        child: Stack(
          children: [
            IconButton(
              style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
              onPressed: () => AddToPlaylist.showAddToPlaylistDialog(context, _.videoId!),
              icon: const Icon(
                Icons.add,
              ),
            ),
            _.playListCount > 0
                ? Positioned(
                    top: 8,
                    right: 8,
                    child: Text(
                      _.playListCount.toString(),
                      style: textTheme.labelSmall,
                    ),
                  )
                : const SizedBox.shrink()
          ],
        ),
      ),
    );
  }
}
