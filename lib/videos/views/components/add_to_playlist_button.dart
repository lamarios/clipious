import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clipious/l10n/generated/app_localizations.dart';
import 'package:clipious/globals.dart';
import 'package:clipious/settings/models/errors/invidious_service_error.dart';
import 'package:clipious/utils.dart';
import 'package:clipious/videos/states/add_to_playlist.dart';

import 'add_to_playlist_dialog.dart';

enum AddToPlayListButtonType {
  appBar,
  modalSheet;
}

const buttonScaleOffset = 0.8;

class AddToPlayListButton extends StatelessWidget {
  final String videoId;
  final AddToPlayListButtonType type;
  final Function? afterAdd;

  const AddToPlayListButton(
      {super.key,
      required this.videoId,
      this.type = AddToPlayListButtonType.appBar,
      this.afterAdd});

  showAddToPlaylistDialog(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    var cubit = context.read<AddToPlaylistCubit>();
    AddToPlaylistDialog.showAddToPlaylistDialog(context,
        playlists: cubit.state.playlists,
        videoId: videoId, onAdd: (selectedPlaylistId) async {
      try {
        await cubit.saveVideoToPlaylist(selectedPlaylistId);
        if (afterAdd != null) {
          afterAdd!();
        }
      } catch (err) {
        if (context.mounted) {
          showAlertDialog(context, locals.errorAddingVideoToPlaylist, [
            (err is InvidiousServiceError)
                ? Text(err.message)
                : Text(err.runtimeType.toString())
          ]);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var colors = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;
    var locals = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (BuildContext context) =>
          AddToPlaylistCubit(AddToPlaylistController(videoId)),
      child: BlocBuilder<AddToPlaylistCubit, AddToPlaylistController>(
          builder: (context, state) {
        var cubit = context.read<AddToPlaylistCubit>();
        return switch (type) {
          (AddToPlayListButtonType.modalSheet) => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AnimatedCrossFade(
                  crossFadeState: state.loading
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: IconButton.filledTonal(
                      onPressed: () => showAddToPlaylistDialog(context),
                      icon: const Icon(Icons.playlist_add)),
                  secondChild: FilledButton.tonal(
                      style: ButtonStyle(
                          shape: WidgetStateProperty.all(const CircleBorder())),
                      onPressed: () {},
                      child: const SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(
                            strokeWidth: 1,
                          ))),
                  duration: animationDuration,
                  firstCurve: Curves.easeInOutQuad,
                  secondCurve: Curves.easeInOutQuad,
                  sizeCurve: Curves.easeInOutQuad,
                ),
                Text(locals.addToPlaylist)
              ],
            ),
          (AddToPlayListButtonType.appBar) => Row(
              children: [
                IconButton(
                  onPressed: state.loading ? () {} : cubit.toggleLike,
                  icon: state.isVideoLiked
                      ? const Icon(Icons.favorite)
                      : const Icon(Icons.favorite_border),
                )
                    .animate(target: state.loading ? 0 : 1)
                    .fade(begin: 0.2, duration: animationDuration)
                    .scale(
                        begin:
                            const Offset(buttonScaleOffset, buttonScaleOffset),
                        duration: animationDuration,
                        curve: Curves.easeInOutQuad),
                Stack(
                  children: [
                    IconButton(
                      style: ButtonStyle(
                          padding: WidgetStateProperty.all<EdgeInsets>(
                              EdgeInsets.zero)),
                      onPressed: state.loading
                          ? () {}
                          : () => showAddToPlaylistDialog(context),
                      icon: const Icon(
                        Icons.add,
                      ),
                    )
                        .animate(target: state.loading ? 0 : 1)
                        .fade(
                          begin: 0.2,
                          duration: animationDuration,
                        )
                        .scale(
                            begin: const Offset(
                                buttonScaleOffset, buttonScaleOffset),
                            duration: animationDuration,
                            curve: Curves.easeInOutQuad),
                    state.playListCount > 0
                        ? Positioned(
                            top: 1,
                            right: 1,
                            child: GestureDetector(
                              onTap: () => showAddToPlaylistDialog(context),
                              child: Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                    color: colors.secondaryContainer,
                                    shape: BoxShape.circle),
                                child: Text(
                                  state.loading
                                      ? '-'
                                      : state.playListCount.toString(),
                                  style: textTheme.labelSmall,
                                ),
                              )
                                  .animate(target: state.loading ? 0 : 1)
                                  .fade(
                                    begin: 0.2,
                                    duration: animationDuration,
                                  )
                                  .scale(
                                      begin: const Offset(
                                          buttonScaleOffset, buttonScaleOffset),
                                      duration: animationDuration,
                                      curve: Curves.easeInOutQuad),
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
