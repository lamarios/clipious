library app.globals;

import 'dart:collection';

import 'package:invidious/database.dart';
import 'package:invidious/service.dart';

const BROADCAST_SERVER_CHANGED = 'server-changed';

const YOUTUBE_HOSTS = ['youtube.com', 'www.youtube.com', 'm.youtube.com', 'youtu.be'];

const animationDuration = Duration(milliseconds: 250);

Service service = Service();

late DbClient db;
