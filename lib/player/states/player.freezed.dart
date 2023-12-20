// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlayerState {
// player display properties
  bool get isMini => throw _privateConstructorUsedError;
  double? get top => throw _privateConstructorUsedError;
  bool get isDragging => throw _privateConstructorUsedError;
  int get selectedFullScreenIndex => throw _privateConstructorUsedError;
  bool get isHidden => throw _privateConstructorUsedError;
  bool get isClosing => throw _privateConstructorUsedError;
  double get dragDistance => throw _privateConstructorUsedError;
  bool get showMiniPlaceholder => throw _privateConstructorUsedError;
  bool get dragStartMini => throw _privateConstructorUsedError;
  double get height => throw _privateConstructorUsedError;
  FullScreenState get fullScreenState => throw _privateConstructorUsedError;
  bool get muted => throw _privateConstructorUsedError;
  double get aspectRatio =>
      throw _privateConstructorUsedError; // videos to play
  Video? get currentlyPlaying => throw _privateConstructorUsedError;
  DownloadedVideo? get offlineCurrentlyPlaying =>
      throw _privateConstructorUsedError;
  List<BaseVideo> get videos => throw _privateConstructorUsedError;
  List<DownloadedVideo> get offlineVideos =>
      throw _privateConstructorUsedError; // playlist controls
  List<String> get playedVideos => throw _privateConstructorUsedError;
  ListQueue<String> get playQueue => throw _privateConstructorUsedError;
  bool get isAudio => throw _privateConstructorUsedError; // playing video data
  bool get isPip => throw _privateConstructorUsedError;
  Offset get offset => throw _privateConstructorUsedError;
  Duration? get startAt => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get bufferedPosition => throw _privateConstructorUsedError;
  bool get isPlaying => throw _privateConstructorUsedError;
  double get speed => throw _privateConstructorUsedError; // events
// command we send down the stack, namely video / audio player
  MediaCommand<dynamic>? get mediaCommand =>
      throw _privateConstructorUsedError; // events we receive from bottom of stack
  MediaEvent<dynamic> get mediaEvent =>
      throw _privateConstructorUsedError; // sponsor block variables
  List<Pair<int>> get sponsorSegments => throw _privateConstructorUsedError;
  Pair<int> get nextSegment =>
      throw _privateConstructorUsedError; // step in seconds when fast forawrd or fast rewind
  int get forwardStep => throw _privateConstructorUsedError;
  dynamic get rewindStep => throw _privateConstructorUsedError;
  int get totalFastForward => throw _privateConstructorUsedError;
  dynamic get totalRewind => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) then) =
      _$PlayerStateCopyWithImpl<$Res, PlayerState>;
  @useResult
  $Res call(
      {bool isMini,
      double? top,
      bool isDragging,
      int selectedFullScreenIndex,
      bool isHidden,
      bool isClosing,
      double dragDistance,
      bool showMiniPlaceholder,
      bool dragStartMini,
      double height,
      FullScreenState fullScreenState,
      bool muted,
      double aspectRatio,
      Video? currentlyPlaying,
      DownloadedVideo? offlineCurrentlyPlaying,
      List<BaseVideo> videos,
      List<DownloadedVideo> offlineVideos,
      List<String> playedVideos,
      ListQueue<String> playQueue,
      bool isAudio,
      bool isPip,
      Offset offset,
      Duration? startAt,
      Duration position,
      Duration bufferedPosition,
      bool isPlaying,
      double speed,
      MediaCommand<dynamic>? mediaCommand,
      MediaEvent<dynamic> mediaEvent,
      List<Pair<int>> sponsorSegments,
      Pair<int> nextSegment,
      int forwardStep,
      dynamic rewindStep,
      int totalFastForward,
      dynamic totalRewind});
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res, $Val extends PlayerState>
    implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMini = null,
    Object? top = freezed,
    Object? isDragging = null,
    Object? selectedFullScreenIndex = null,
    Object? isHidden = null,
    Object? isClosing = null,
    Object? dragDistance = null,
    Object? showMiniPlaceholder = null,
    Object? dragStartMini = null,
    Object? height = null,
    Object? fullScreenState = null,
    Object? muted = null,
    Object? aspectRatio = null,
    Object? currentlyPlaying = freezed,
    Object? offlineCurrentlyPlaying = freezed,
    Object? videos = null,
    Object? offlineVideos = null,
    Object? playedVideos = null,
    Object? playQueue = null,
    Object? isAudio = null,
    Object? isPip = null,
    Object? offset = null,
    Object? startAt = freezed,
    Object? position = null,
    Object? bufferedPosition = null,
    Object? isPlaying = null,
    Object? speed = null,
    Object? mediaCommand = freezed,
    Object? mediaEvent = null,
    Object? sponsorSegments = null,
    Object? nextSegment = null,
    Object? forwardStep = null,
    Object? rewindStep = freezed,
    Object? totalFastForward = null,
    Object? totalRewind = freezed,
  }) {
    return _then(_value.copyWith(
      isMini: null == isMini
          ? _value.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
      top: freezed == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      isDragging: null == isDragging
          ? _value.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFullScreenIndex: null == selectedFullScreenIndex
          ? _value.selectedFullScreenIndex
          : selectedFullScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosing: null == isClosing
          ? _value.isClosing
          : isClosing // ignore: cast_nullable_to_non_nullable
              as bool,
      dragDistance: null == dragDistance
          ? _value.dragDistance
          : dragDistance // ignore: cast_nullable_to_non_nullable
              as double,
      showMiniPlaceholder: null == showMiniPlaceholder
          ? _value.showMiniPlaceholder
          : showMiniPlaceholder // ignore: cast_nullable_to_non_nullable
              as bool,
      dragStartMini: null == dragStartMini
          ? _value.dragStartMini
          : dragStartMini // ignore: cast_nullable_to_non_nullable
              as bool,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      fullScreenState: null == fullScreenState
          ? _value.fullScreenState
          : fullScreenState // ignore: cast_nullable_to_non_nullable
              as FullScreenState,
      muted: null == muted
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      currentlyPlaying: freezed == currentlyPlaying
          ? _value.currentlyPlaying
          : currentlyPlaying // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineCurrentlyPlaying: freezed == offlineCurrentlyPlaying
          ? _value.offlineCurrentlyPlaying
          : offlineCurrentlyPlaying // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      videos: null == videos
          ? _value.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<BaseVideo>,
      offlineVideos: null == offlineVideos
          ? _value.offlineVideos
          : offlineVideos // ignore: cast_nullable_to_non_nullable
              as List<DownloadedVideo>,
      playedVideos: null == playedVideos
          ? _value.playedVideos
          : playedVideos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playQueue: null == playQueue
          ? _value.playQueue
          : playQueue // ignore: cast_nullable_to_non_nullable
              as ListQueue<String>,
      isAudio: null == isAudio
          ? _value.isAudio
          : isAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isPip: null == isPip
          ? _value.isPip
          : isPip // ignore: cast_nullable_to_non_nullable
              as bool,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      mediaCommand: freezed == mediaCommand
          ? _value.mediaCommand
          : mediaCommand // ignore: cast_nullable_to_non_nullable
              as MediaCommand<dynamic>?,
      mediaEvent: null == mediaEvent
          ? _value.mediaEvent
          : mediaEvent // ignore: cast_nullable_to_non_nullable
              as MediaEvent<dynamic>,
      sponsorSegments: null == sponsorSegments
          ? _value.sponsorSegments
          : sponsorSegments // ignore: cast_nullable_to_non_nullable
              as List<Pair<int>>,
      nextSegment: null == nextSegment
          ? _value.nextSegment
          : nextSegment // ignore: cast_nullable_to_non_nullable
              as Pair<int>,
      forwardStep: null == forwardStep
          ? _value.forwardStep
          : forwardStep // ignore: cast_nullable_to_non_nullable
              as int,
      rewindStep: freezed == rewindStep
          ? _value.rewindStep
          : rewindStep // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalFastForward: null == totalFastForward
          ? _value.totalFastForward
          : totalFastForward // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewind: freezed == totalRewind
          ? _value.totalRewind
          : totalRewind // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerStateImplCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$$PlayerStateImplCopyWith(
          _$PlayerStateImpl value, $Res Function(_$PlayerStateImpl) then) =
      __$$PlayerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isMini,
      double? top,
      bool isDragging,
      int selectedFullScreenIndex,
      bool isHidden,
      bool isClosing,
      double dragDistance,
      bool showMiniPlaceholder,
      bool dragStartMini,
      double height,
      FullScreenState fullScreenState,
      bool muted,
      double aspectRatio,
      Video? currentlyPlaying,
      DownloadedVideo? offlineCurrentlyPlaying,
      List<BaseVideo> videos,
      List<DownloadedVideo> offlineVideos,
      List<String> playedVideos,
      ListQueue<String> playQueue,
      bool isAudio,
      bool isPip,
      Offset offset,
      Duration? startAt,
      Duration position,
      Duration bufferedPosition,
      bool isPlaying,
      double speed,
      MediaCommand<dynamic>? mediaCommand,
      MediaEvent<dynamic> mediaEvent,
      List<Pair<int>> sponsorSegments,
      Pair<int> nextSegment,
      int forwardStep,
      dynamic rewindStep,
      int totalFastForward,
      dynamic totalRewind});
}

/// @nodoc
class __$$PlayerStateImplCopyWithImpl<$Res>
    extends _$PlayerStateCopyWithImpl<$Res, _$PlayerStateImpl>
    implements _$$PlayerStateImplCopyWith<$Res> {
  __$$PlayerStateImplCopyWithImpl(
      _$PlayerStateImpl _value, $Res Function(_$PlayerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMini = null,
    Object? top = freezed,
    Object? isDragging = null,
    Object? selectedFullScreenIndex = null,
    Object? isHidden = null,
    Object? isClosing = null,
    Object? dragDistance = null,
    Object? showMiniPlaceholder = null,
    Object? dragStartMini = null,
    Object? height = null,
    Object? fullScreenState = null,
    Object? muted = null,
    Object? aspectRatio = null,
    Object? currentlyPlaying = freezed,
    Object? offlineCurrentlyPlaying = freezed,
    Object? videos = null,
    Object? offlineVideos = null,
    Object? playedVideos = null,
    Object? playQueue = null,
    Object? isAudio = null,
    Object? isPip = null,
    Object? offset = null,
    Object? startAt = freezed,
    Object? position = null,
    Object? bufferedPosition = null,
    Object? isPlaying = null,
    Object? speed = null,
    Object? mediaCommand = freezed,
    Object? mediaEvent = null,
    Object? sponsorSegments = null,
    Object? nextSegment = null,
    Object? forwardStep = null,
    Object? rewindStep = freezed,
    Object? totalFastForward = null,
    Object? totalRewind = freezed,
  }) {
    return _then(_$PlayerStateImpl(
      isMini: null == isMini
          ? _value.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
      top: freezed == top
          ? _value.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      isDragging: null == isDragging
          ? _value.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFullScreenIndex: null == selectedFullScreenIndex
          ? _value.selectedFullScreenIndex
          : selectedFullScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: null == isHidden
          ? _value.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosing: null == isClosing
          ? _value.isClosing
          : isClosing // ignore: cast_nullable_to_non_nullable
              as bool,
      dragDistance: null == dragDistance
          ? _value.dragDistance
          : dragDistance // ignore: cast_nullable_to_non_nullable
              as double,
      showMiniPlaceholder: null == showMiniPlaceholder
          ? _value.showMiniPlaceholder
          : showMiniPlaceholder // ignore: cast_nullable_to_non_nullable
              as bool,
      dragStartMini: null == dragStartMini
          ? _value.dragStartMini
          : dragStartMini // ignore: cast_nullable_to_non_nullable
              as bool,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      fullScreenState: null == fullScreenState
          ? _value.fullScreenState
          : fullScreenState // ignore: cast_nullable_to_non_nullable
              as FullScreenState,
      muted: null == muted
          ? _value.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      aspectRatio: null == aspectRatio
          ? _value.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      currentlyPlaying: freezed == currentlyPlaying
          ? _value.currentlyPlaying
          : currentlyPlaying // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineCurrentlyPlaying: freezed == offlineCurrentlyPlaying
          ? _value.offlineCurrentlyPlaying
          : offlineCurrentlyPlaying // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      videos: null == videos
          ? _value._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<BaseVideo>,
      offlineVideos: null == offlineVideos
          ? _value._offlineVideos
          : offlineVideos // ignore: cast_nullable_to_non_nullable
              as List<DownloadedVideo>,
      playedVideos: null == playedVideos
          ? _value._playedVideos
          : playedVideos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playQueue: null == playQueue
          ? _value.playQueue
          : playQueue // ignore: cast_nullable_to_non_nullable
              as ListQueue<String>,
      isAudio: null == isAudio
          ? _value.isAudio
          : isAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isPip: null == isPip
          ? _value.isPip
          : isPip // ignore: cast_nullable_to_non_nullable
              as bool,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      startAt: freezed == startAt
          ? _value.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _value.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _value.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      mediaCommand: freezed == mediaCommand
          ? _value.mediaCommand
          : mediaCommand // ignore: cast_nullable_to_non_nullable
              as MediaCommand<dynamic>?,
      mediaEvent: null == mediaEvent
          ? _value.mediaEvent
          : mediaEvent // ignore: cast_nullable_to_non_nullable
              as MediaEvent<dynamic>,
      sponsorSegments: null == sponsorSegments
          ? _value._sponsorSegments
          : sponsorSegments // ignore: cast_nullable_to_non_nullable
              as List<Pair<int>>,
      nextSegment: null == nextSegment
          ? _value.nextSegment
          : nextSegment // ignore: cast_nullable_to_non_nullable
              as Pair<int>,
      forwardStep: null == forwardStep
          ? _value.forwardStep
          : forwardStep // ignore: cast_nullable_to_non_nullable
              as int,
      rewindStep: freezed == rewindStep ? _value.rewindStep! : rewindStep,
      totalFastForward: null == totalFastForward
          ? _value.totalFastForward
          : totalFastForward // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewind: freezed == totalRewind ? _value.totalRewind! : totalRewind,
    ));
  }
}

/// @nodoc

class _$PlayerStateImpl extends _PlayerState {
  const _$PlayerStateImpl(
      {this.isMini = true,
      this.top,
      this.isDragging = false,
      this.selectedFullScreenIndex = 0,
      this.isHidden = true,
      this.isClosing = false,
      this.dragDistance = 0,
      this.showMiniPlaceholder = false,
      this.dragStartMini = true,
      this.height = targetHeight,
      this.fullScreenState = FullScreenState.notFullScreen,
      this.muted = false,
      this.aspectRatio = 16 / 9,
      this.currentlyPlaying,
      this.offlineCurrentlyPlaying,
      final List<BaseVideo> videos = const [],
      final List<DownloadedVideo> offlineVideos = const [],
      final List<String> playedVideos = const [],
      required this.playQueue,
      this.isAudio = false,
      this.isPip = false,
      this.offset = Offset.zero,
      this.startAt,
      this.position = Duration.zero,
      this.bufferedPosition = Duration.zero,
      this.isPlaying = false,
      this.speed = 1.0,
      this.mediaCommand,
      this.mediaEvent = const MediaEvent(state: MediaState.idle),
      final List<Pair<int>> sponsorSegments = const [],
      this.nextSegment = const Pair(0, 0),
      this.forwardStep = defaultStep,
      this.rewindStep = defaultStep,
      this.totalFastForward = 0,
      this.totalRewind = 0})
      : _videos = videos,
        _offlineVideos = offlineVideos,
        _playedVideos = playedVideos,
        _sponsorSegments = sponsorSegments,
        super._();

// player display properties
  @override
  @JsonKey()
  final bool isMini;
  @override
  final double? top;
  @override
  @JsonKey()
  final bool isDragging;
  @override
  @JsonKey()
  final int selectedFullScreenIndex;
  @override
  @JsonKey()
  final bool isHidden;
  @override
  @JsonKey()
  final bool isClosing;
  @override
  @JsonKey()
  final double dragDistance;
  @override
  @JsonKey()
  final bool showMiniPlaceholder;
  @override
  @JsonKey()
  final bool dragStartMini;
  @override
  @JsonKey()
  final double height;
  @override
  @JsonKey()
  final FullScreenState fullScreenState;
  @override
  @JsonKey()
  final bool muted;
  @override
  @JsonKey()
  final double aspectRatio;
// videos to play
  @override
  final Video? currentlyPlaying;
  @override
  final DownloadedVideo? offlineCurrentlyPlaying;
  final List<BaseVideo> _videos;
  @override
  @JsonKey()
  List<BaseVideo> get videos {
    if (_videos is EqualUnmodifiableListView) return _videos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videos);
  }

  final List<DownloadedVideo> _offlineVideos;
  @override
  @JsonKey()
  List<DownloadedVideo> get offlineVideos {
    if (_offlineVideos is EqualUnmodifiableListView) return _offlineVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_offlineVideos);
  }

// playlist controls
  final List<String> _playedVideos;
// playlist controls
  @override
  @JsonKey()
  List<String> get playedVideos {
    if (_playedVideos is EqualUnmodifiableListView) return _playedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_playedVideos);
  }

  @override
  final ListQueue<String> playQueue;
  @override
  @JsonKey()
  final bool isAudio;
// playing video data
  @override
  @JsonKey()
  final bool isPip;
  @override
  @JsonKey()
  final Offset offset;
  @override
  final Duration? startAt;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration bufferedPosition;
  @override
  @JsonKey()
  final bool isPlaying;
  @override
  @JsonKey()
  final double speed;
// events
// command we send down the stack, namely video / audio player
  @override
  final MediaCommand<dynamic>? mediaCommand;
// events we receive from bottom of stack
  @override
  @JsonKey()
  final MediaEvent<dynamic> mediaEvent;
// sponsor block variables
  final List<Pair<int>> _sponsorSegments;
// sponsor block variables
  @override
  @JsonKey()
  List<Pair<int>> get sponsorSegments {
    if (_sponsorSegments is EqualUnmodifiableListView) return _sponsorSegments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sponsorSegments);
  }

  @override
  @JsonKey()
  final Pair<int> nextSegment;
// step in seconds when fast forawrd or fast rewind
  @override
  @JsonKey()
  final int forwardStep;
  @override
  @JsonKey()
  final dynamic rewindStep;
  @override
  @JsonKey()
  final int totalFastForward;
  @override
  @JsonKey()
  final dynamic totalRewind;

  @override
  String toString() {
    return 'PlayerState(isMini: $isMini, top: $top, isDragging: $isDragging, selectedFullScreenIndex: $selectedFullScreenIndex, isHidden: $isHidden, isClosing: $isClosing, dragDistance: $dragDistance, showMiniPlaceholder: $showMiniPlaceholder, dragStartMini: $dragStartMini, height: $height, fullScreenState: $fullScreenState, muted: $muted, aspectRatio: $aspectRatio, currentlyPlaying: $currentlyPlaying, offlineCurrentlyPlaying: $offlineCurrentlyPlaying, videos: $videos, offlineVideos: $offlineVideos, playedVideos: $playedVideos, playQueue: $playQueue, isAudio: $isAudio, isPip: $isPip, offset: $offset, startAt: $startAt, position: $position, bufferedPosition: $bufferedPosition, isPlaying: $isPlaying, speed: $speed, mediaCommand: $mediaCommand, mediaEvent: $mediaEvent, sponsorSegments: $sponsorSegments, nextSegment: $nextSegment, forwardStep: $forwardStep, rewindStep: $rewindStep, totalFastForward: $totalFastForward, totalRewind: $totalRewind)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerStateImpl &&
            (identical(other.isMini, isMini) || other.isMini == isMini) &&
            (identical(other.top, top) || other.top == top) &&
            (identical(other.isDragging, isDragging) ||
                other.isDragging == isDragging) &&
            (identical(
                    other.selectedFullScreenIndex, selectedFullScreenIndex) ||
                other.selectedFullScreenIndex == selectedFullScreenIndex) &&
            (identical(other.isHidden, isHidden) ||
                other.isHidden == isHidden) &&
            (identical(other.isClosing, isClosing) ||
                other.isClosing == isClosing) &&
            (identical(other.dragDistance, dragDistance) ||
                other.dragDistance == dragDistance) &&
            (identical(other.showMiniPlaceholder, showMiniPlaceholder) ||
                other.showMiniPlaceholder == showMiniPlaceholder) &&
            (identical(other.dragStartMini, dragStartMini) ||
                other.dragStartMini == dragStartMini) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.fullScreenState, fullScreenState) ||
                other.fullScreenState == fullScreenState) &&
            (identical(other.muted, muted) || other.muted == muted) &&
            (identical(other.aspectRatio, aspectRatio) ||
                other.aspectRatio == aspectRatio) &&
            (identical(other.currentlyPlaying, currentlyPlaying) ||
                other.currentlyPlaying == currentlyPlaying) &&
            (identical(
                    other.offlineCurrentlyPlaying, offlineCurrentlyPlaying) ||
                other.offlineCurrentlyPlaying == offlineCurrentlyPlaying) &&
            const DeepCollectionEquality().equals(other._videos, _videos) &&
            const DeepCollectionEquality()
                .equals(other._offlineVideos, _offlineVideos) &&
            const DeepCollectionEquality()
                .equals(other._playedVideos, _playedVideos) &&
            const DeepCollectionEquality().equals(other.playQueue, playQueue) &&
            (identical(other.isAudio, isAudio) || other.isAudio == isAudio) &&
            (identical(other.isPip, isPip) || other.isPip == isPip) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.startAt, startAt) || other.startAt == startAt) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.bufferedPosition, bufferedPosition) ||
                other.bufferedPosition == bufferedPosition) &&
            (identical(other.isPlaying, isPlaying) ||
                other.isPlaying == isPlaying) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.mediaCommand, mediaCommand) ||
                other.mediaCommand == mediaCommand) &&
            (identical(other.mediaEvent, mediaEvent) ||
                other.mediaEvent == mediaEvent) &&
            const DeepCollectionEquality()
                .equals(other._sponsorSegments, _sponsorSegments) &&
            (identical(other.nextSegment, nextSegment) ||
                other.nextSegment == nextSegment) &&
            (identical(other.forwardStep, forwardStep) ||
                other.forwardStep == forwardStep) &&
            const DeepCollectionEquality()
                .equals(other.rewindStep, rewindStep) &&
            (identical(other.totalFastForward, totalFastForward) ||
                other.totalFastForward == totalFastForward) &&
            const DeepCollectionEquality()
                .equals(other.totalRewind, totalRewind));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isMini,
        top,
        isDragging,
        selectedFullScreenIndex,
        isHidden,
        isClosing,
        dragDistance,
        showMiniPlaceholder,
        dragStartMini,
        height,
        fullScreenState,
        muted,
        aspectRatio,
        currentlyPlaying,
        offlineCurrentlyPlaying,
        const DeepCollectionEquality().hash(_videos),
        const DeepCollectionEquality().hash(_offlineVideos),
        const DeepCollectionEquality().hash(_playedVideos),
        const DeepCollectionEquality().hash(playQueue),
        isAudio,
        isPip,
        offset,
        startAt,
        position,
        bufferedPosition,
        isPlaying,
        speed,
        mediaCommand,
        mediaEvent,
        const DeepCollectionEquality().hash(_sponsorSegments),
        nextSegment,
        forwardStep,
        const DeepCollectionEquality().hash(rewindStep),
        totalFastForward,
        const DeepCollectionEquality().hash(totalRewind)
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      __$$PlayerStateImplCopyWithImpl<_$PlayerStateImpl>(this, _$identity);
}

abstract class _PlayerState extends PlayerState {
  const factory _PlayerState(
      {final bool isMini,
      final double? top,
      final bool isDragging,
      final int selectedFullScreenIndex,
      final bool isHidden,
      final bool isClosing,
      final double dragDistance,
      final bool showMiniPlaceholder,
      final bool dragStartMini,
      final double height,
      final FullScreenState fullScreenState,
      final bool muted,
      final double aspectRatio,
      final Video? currentlyPlaying,
      final DownloadedVideo? offlineCurrentlyPlaying,
      final List<BaseVideo> videos,
      final List<DownloadedVideo> offlineVideos,
      final List<String> playedVideos,
      required final ListQueue<String> playQueue,
      final bool isAudio,
      final bool isPip,
      final Offset offset,
      final Duration? startAt,
      final Duration position,
      final Duration bufferedPosition,
      final bool isPlaying,
      final double speed,
      final MediaCommand<dynamic>? mediaCommand,
      final MediaEvent<dynamic> mediaEvent,
      final List<Pair<int>> sponsorSegments,
      final Pair<int> nextSegment,
      final int forwardStep,
      final dynamic rewindStep,
      final int totalFastForward,
      final dynamic totalRewind}) = _$PlayerStateImpl;
  const _PlayerState._() : super._();

  @override // player display properties
  bool get isMini;
  @override
  double? get top;
  @override
  bool get isDragging;
  @override
  int get selectedFullScreenIndex;
  @override
  bool get isHidden;
  @override
  bool get isClosing;
  @override
  double get dragDistance;
  @override
  bool get showMiniPlaceholder;
  @override
  bool get dragStartMini;
  @override
  double get height;
  @override
  FullScreenState get fullScreenState;
  @override
  bool get muted;
  @override
  double get aspectRatio;
  @override // videos to play
  Video? get currentlyPlaying;
  @override
  DownloadedVideo? get offlineCurrentlyPlaying;
  @override
  List<BaseVideo> get videos;
  @override
  List<DownloadedVideo> get offlineVideos;
  @override // playlist controls
  List<String> get playedVideos;
  @override
  ListQueue<String> get playQueue;
  @override
  bool get isAudio;
  @override // playing video data
  bool get isPip;
  @override
  Offset get offset;
  @override
  Duration? get startAt;
  @override
  Duration get position;
  @override
  Duration get bufferedPosition;
  @override
  bool get isPlaying;
  @override
  double get speed;
  @override // events
// command we send down the stack, namely video / audio player
  MediaCommand<dynamic>? get mediaCommand;
  @override // events we receive from bottom of stack
  MediaEvent<dynamic> get mediaEvent;
  @override // sponsor block variables
  List<Pair<int>> get sponsorSegments;
  @override
  Pair<int> get nextSegment;
  @override // step in seconds when fast forawrd or fast rewind
  int get forwardStep;
  @override
  dynamic get rewindStep;
  @override
  int get totalFastForward;
  @override
  dynamic get totalRewind;
  @override
  @JsonKey(ignore: true)
  _$$PlayerStateImplCopyWith<_$PlayerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
