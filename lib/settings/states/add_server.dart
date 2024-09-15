import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:invidious/settings/models/errors/server_already_exists.dart';
import 'package:invidious/settings/models/errors/wrong_thumbnail_url.dart';

import '../../globals.dart';
import '../models/db/server.dart';

part 'add_server.freezed.dart';

class AddServerCubit extends Cubit<AddServerState> {
  final TextEditingController urlController =
      TextEditingController(text: 'https://');
  final TextEditingController headerNameController = TextEditingController();
  final TextEditingController headerValueController = TextEditingController();

  AddServerCubit(super.initialState) {
    urlController.addListener(
      () {
        emit(state.copyWith(valid: validUrl));
      },
    );
  }

  @override
  Future<void> close() {
    urlController.dispose();
    headerNameController.dispose();
    headerValueController.dispose();
    return super.close();
  }

  Future<Server?> validateServer() async {
    emit(state.copyWith(loading: true));
    try {
      var serverUrl = urlController.value.text.trim();

      final existingServer = db.getServer(serverUrl);

      if (existingServer != null) {
        throw ServerAlreadyExists();
      }

      if (serverUrl.endsWith("/")) {
        serverUrl = serverUrl.substring(0, serverUrl.length - 1);
      }

      await service.validateServer(serverUrl, state.headers);

      if (state.advancedTest) {
        Server server = Server(url: serverUrl, customHeaders: state.headers);
        final video =
            await service.getVideo('dQw4w9WgXcQ', serverOverride: server);

        final invalidThumbnailUrls = video.videoThumbnails
            .map(
              (e) => e.url,
            )
            .any((u) => u.startsWith("/"));

        if (invalidThumbnailUrls) {
          throw WrongThumbnailUrl();
        }
      }

      return Server(url: serverUrl, customHeaders: state.headers);
    } finally {
      emit(state.copyWith(loading: false));
    }
  }

  setShowAdvanced(bool advanced) {
    emit(state.copyWith(showAdvanced: advanced));
  }

  addHeader(String key, String value) {
    final Map<String, String> headers = Map.from(state.headers);
    headers[key] = value;
    emit(state.copyWith(headers: headers));
  }

  removeHeader(String key) {
    final Map<String, String> headers = Map.from(state.headers);
    headers.remove(key);
    emit(state.copyWith(headers: headers));
  }

  bool get validUrl {
    var regExp = RegExp(r'^(http://|https://)');
    if (!urlController.text.trim().startsWith(regExp)) {
      return false;
    }

    final urlWithoutProtocol = urlController.text.replaceAll(regExp, "").trim();

    if (urlWithoutProtocol.isEmpty) {
      return false;
    }

    return true;
  }

  setAdvancedTest(bool advancedTest) {
    emit(state.copyWith(advancedTest: advancedTest));
  }
}

@freezed
class AddServerState with _$AddServerState {
  const factory AddServerState(
      {@Default(false) bool loading,
      @Default(false) bool valid,
      @Default(false) bool showAdvanced,
      @Default(true) bool advancedTest,
      @Default({}) Map<String, String> headers}) = _AddServerState;
}
