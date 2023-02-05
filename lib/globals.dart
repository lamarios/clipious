library app.globals;

import 'dart:collection';

import 'package:invidious/database.dart';
import 'package:invidious/service.dart';

const PAULFLIX = 'https://youtube.paulflix.tv';

const PUBLIC_SERVERS = [
  "https://vid.puffyan.us/",
  "https://yt.artemislena.eu/",
  "https://youtube.paulflix.tv"
];

const animationDuration = Duration(milliseconds: 250);

Service service = Service();

late DbClient db;
