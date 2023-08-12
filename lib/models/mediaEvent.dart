class MediaEvent {
  MediaEventType? type;
  MediaState state;

  MediaEvent({this.type, required this.state});
}

enum MediaEventType { play, pause, seek, speedChanged, progress }

enum MediaState {
  idle,
  loading,
  buffering,
  playing,
  ready,
  completed;
}
