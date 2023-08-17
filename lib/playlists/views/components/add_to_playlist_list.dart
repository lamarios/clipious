import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/utils/models/paginatedList.dart';
import 'package:invidious/playlists/states/playlist_list.dart';
import 'package:invidious/playlists/views/components/playlist_list.dart';

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
          tag: userPlayListTag,
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
    showDialog<String>(
        context: context,
        builder: (BuildContext context) => const Dialog(
              child: AddPlayListForm(),
            ));
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme colors = Theme.of(context).colorScheme;
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
      var id = await service.createPlayList(nameController.value.text, privacyValue);

      if (context.mounted) {
        Navigator.of(context).pop();
      }

      if (context.mounted && id != null && widget.afterAdd != null) {
        await widget.afterAdd!(id!);
      }
    } catch (err) {
      showAlertDialog(context, locals.error, [Text(err.toString())]);
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
                    padding: EdgeInsets.all(8.0),
                    child: Text('${locals.playlistVisibility}:'),
                  ),
                  DropdownButton(
                    value: privacyValue,
                    items: [
                      DropdownMenuItem(value: 'public', child: Text(locals.publicPlaylist)),
                      DropdownMenuItem(value: 'unlisted', child: Text(locals.unlistedPlaylist)),
                      DropdownMenuItem(value: 'private', child: Text(locals.privatePlaylist))
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
