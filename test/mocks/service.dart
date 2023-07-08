import 'dart:io';

import 'package:flutter/services.dart';
import 'package:http/http.dart' show Client, Request, Response;
import 'package:http/testing.dart';
import 'package:invidious/globals.dart';
import 'package:invidious/httpOverrides.dart';

import '../pair.dart';
import '../controllers/videoController_test.dart';
import 'db.dart';

const apiv1 = '/api/v1';

void setClient() {
  HttpOverrides.global = MyHttpOverrides();
  service.client = MockClient((request) async {
    var resp = await getContent(request);
    return Response(resp.right, resp.left, headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
    });
  });
}

Future<Pair<int, String>> getContent(Request request) async {
  var url = request.url.toString();

  if (url == '$testServerUrl$apiv1/videos/$videoControllerTestVideoId') {
    return Pair(200, await loadJson('videoControllerTest.json'));
  }
  if (url == '$testServerUrl$apiv1/videos/$videoControllerTestVideoIdFailed') {
    return Pair(500, await loadJson('videoControllerTestFailed.json'));
  }

  return Pair(404, '');
}

Future<String> loadJson(String path) async {
  return await rootBundle.loadString('assets/test/$path');
}
