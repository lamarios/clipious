import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/videos/states/add_to_playlist.dart';

import 'add_to_playlist_dialog.dart';

enum AddToPlayListButtonType {
  appBar,
  modalSheet;
}

class AddToPlayListButton extends StatelessWidget {
  final String videoId;
  final AddToPlayListButtonType type;
  final Function? afterAdd;

  const AddToPlayListButton(
      {super.key, required this.videoId, this.type = AddToPlayListButtonType.appBar, this.afterAdd});

  showAddToPlaylistDialog(BuildContext context) {
    var cubit = context.read<AddToPlaylistCubit>();
    AddToPlaylistDialog.showAddToPlaylistDialog(context, playlists: cubit.state.playlists, videoId: videoId,
        onAdd: (selectedPlaylistId) async {
      await cubit.saveVideoToPlaylist(selectedPlaylistId);
      if (afterAdd != null) {
        afterAdd!();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (BuildContext context) => AddToPlaylistCubit(AddToPlaylistController(videoId)),
      child: BlocBuilder<AddToPlaylistCubit, AddToPlaylistController>(builder: (context, _) {
        var cubit = context.read<AddToPlaylistCubit>();
        return switch (type) {
          (AddToPlayListButtonType.modalSheet) => Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton.filledTonal(
                      onPressed: () => showAddToPlaylistDialog(context), icon: const Icon(Icons.playlist_add)),
                  Text(locals.addToPlaylist)
                ],
              ),
            ),
          (AddToPlayListButtonType.appBar) => Row(
              children: [
                IconButton(
                  onPressed: cubit.toggleLike,
                  icon: _.isVideoLiked ? const Icon(Icons.favorite) : const Icon(Icons.favorite_border),
                ),
                Stack(
                  children: [
                    IconButton(
                      style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero)),
                      onPressed: () => showAddToPlaylistDialog(context),
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                    _.playListCount > 0
                        ? Positioned(
                            top: 1,
                            right: 1,
                            child: GestureDetector(
                              onTap: () => showAddToPlaylistDialog(context),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(color: colors.secondaryContainer, shape: BoxShape.circle),
                                child: Text(
                                  _.playListCount.toString(),
                                  style: textTheme.labelSmall,
                                ),
                              ),
                            ),
                          )
                        : const SizedBox.shrink()
                  ],
                )
              ],
            )
        };
      }),
    );
  }
}
