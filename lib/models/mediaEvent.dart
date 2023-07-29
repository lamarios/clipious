class MediaEvent {
  MediaEventType? type;
  MediaState state;

  MediaEvent({this.type, required this.state});
}

enum MediaEventType { play, pause, seek, speedChanged }

enum MediaState {
  idle,
  loading,
  buffering,
  ready,
  completed;
}
