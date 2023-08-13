class MediaEvent {
  MediaEventType? type;
  MediaState state;

  MediaEvent({this.type, required this.state});
}

enum MediaEventType { play, pause, seek, speedChanged, progress, volumeChanged }

enum MediaState {
  idle,
  loading,
  buffering,
  playing,
  ready,
  error,
  completed, miniDisplayChanged;
}
