import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/playlists/states/playlist_list.dart';
import 'package:invidious/playlists/views/components/playlist_list.dart';
import 'package:invidious/utils/models/paginated_list.dart';

import '../../../utils.dart';

class AddToPlaylistList extends StatelessWidget {
  final bool canDeleteVideos;

  const AddToPlaylistList({super.key, required this.canDeleteVideos});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: PlaylistList(
          canDeleteVideos: canDeleteVideos,
          paginatedList: SingleEndpointList(service.getUserPlaylists),
        ))
      ],
    );
  }
}

class AddPlayListButton extends StatelessWidget {
  const AddPlayListButton({super.key});

  addPlaylistDialog(BuildContext context) {
    var cubit = context.read<PlaylistListCubit>();
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
              child: AddPlayListForm(
                afterAdd: (playlistId) => cubit.refreshPlaylists(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => addPlaylistDialog(context),
      child: const Icon(Icons.add),
    );
  }
}

class AddPlayListForm extends StatefulWidget {
  final Future<void> Function(String playlistId)? afterAdd;

  const AddPlayListForm({super.key, this.afterAdd});

  @override
  State<AddPlayListForm> createState() => _AddPlayListFormState();
}

class _AddPlayListFormState extends State<AddPlayListForm> {
  final TextEditingController nameController = TextEditingController(text: '');
  String privacyValue = 'public';

  addPlaylist(BuildContext context) async {
    var locals = AppLocalizations.of(context)!;
    try {
      var id =
          await service.createPlayList(nameController.value.text, privacyValue);

      if (context.mounted) {
        Navigator.pop(context);
      }

      if (context.mounted && id != null && widget.afterAdd != null) {
        await widget.afterAdd!(id);
      }
    } catch (err) {
      if (context.mounted) {
        showAlertDialog(context, locals.error, [Text(err.toString())]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var locals = AppLocalizations.of(context)!;
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locals.addPlayList),
            TextField(
              decoration: InputDecoration(hintText: locals.playListName),
              controller: nameController,
              autocorrect: false,
              enableSuggestions: false,
              enableIMEPersonalizedLearning: false,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('${locals.playlistVisibility}:'),
                  ),
                  DropdownButton(
                    value: privacyValue,
                    items: [
                      DropdownMenuItem(
                          value: 'public', child: Text(locals.publicPlaylist)),
                      DropdownMenuItem(
                          value: 'unlisted',
                          child: Text(locals.unlistedPlaylist)),
                      DropdownMenuItem(
                          value: 'private', child: Text(locals.privatePlaylist))
                    ],
                    onChanged: (value) {
                      setState(() {
                        privacyValue = value ?? '';
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(locals.cancel),
                ),
                TextButton(
                  onPressed: () {
                    addPlaylist(context);
                  },
                  child: Text(locals.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
