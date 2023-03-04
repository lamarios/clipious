enum PlayerEventType { progress }

class PlayerEvent {
  bool finished = false;
  PlayerEventType type;
  Duration progress;

  PlayerEvent({required this.finished, required this.type, required this.progress});
}
