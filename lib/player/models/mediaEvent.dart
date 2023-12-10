class MediaEvent<T> {
 final  MediaEventType? type;
 final  MediaState state;
 final  T? value;

 const MediaEvent({this.type, required this.state, this.value});
}

enum MediaEventType {
  aspectRatioChanged,
  play,
  pause,
  seek,
  speedChanged,
  durationChanged,
  bufferChanged,
  progress,
  volumeChanged,
  fullScreenChanged,
  enteredPip,
  exitedPip,
  miniDisplayChanged,
  sponsorSkipped,
}

enum MediaState {
  idle,
  loading,
  buffering,
  playing,
  pause,
  ready,
  error,
  completed;
}
