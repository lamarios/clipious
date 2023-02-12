library app.globals;

import 'dart:collection';

import 'package:invidious/database.dart';
import 'package:invidious/service.dart';

const PAULFLIX = 'https://youtube.paulflix.tv';

const PUBLIC_SERVERS = [
  "https://vid.puffyan.us",
  'https://yt.funami.tech',
  'https://invidious.silur.me',
  'https://invidious.epicsite.xyz',
  'https://invidious.baczek.me',
  'https://inv.odyssey346.dev',
  'https://invidious.sethforprivacy.com',
  'https://watch.thekitty.zone',
  'https://yt.oelrichsgarcia.de',
  'https://inv.vern.cc',
  'https://invidious.nerdvpn.de',
  'https://invidious.tiekoetter.com',
  'https://y.com.sb',
  'https://inv.bp.projectsegfau.lt',
  'https://invidious.flokinet.to',
  'https://inv.riverside.rocks',
  'https://iv.ggtyler.dev',
];
const BROADCAST_SERVER_CHANGED = 'server-changed';

const YOUTUBE_HOSTS = ['youtube.com', 'www.youtube.com', 'm.youtube.com', 'youtu.be'];

const animationDuration = Duration(milliseconds: 250);

Service service = Service();

late DbClient db;
