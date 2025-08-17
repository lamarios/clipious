// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerState {
// player display properties
  bool get isMini;
  bool get hasTimer;
  double? get top;
  bool get isDragging;
  int get selectedFullScreenIndex;
  bool get isHidden;
  bool get isClosing;
  double get dragDistance;
  bool get showMiniPlaceholder;
  bool get dragStartMini;
  double get height;
  FullScreenState get fullScreenState;
  bool get muted;
  double get aspectRatio; // videos to play
  Video? get currentlyPlaying;
  DownloadedVideo? get offlineCurrentlyPlaying;
  List<Video> get videos;
  List<DownloadedVideo> get offlineVideos; // playlist controls
  List<String> get playedVideos;
  ListQueue<String> get playQueue;
  bool get isAudio; // playing video data
  bool get isPip;
  Offset get offset;
  Duration? get startAt;
  Duration get position;
  Duration get bufferedPosition;
  bool get isPlaying;
  double get speed; // events
// command we send down the stack, namely video / audio player
  MediaCommand? get mediaCommand; // events we receive from bottom of stack
  MediaEvent get mediaEvent; // sponsor block variables
  List<Pair<int>> get sponsorSegments;
  Pair<int> get nextSegment; // step in seconds when fast forawrd or fast rewind
  int get forwardStep;
  dynamic get rewindStep;
  int get totalFastForward;
  dynamic get totalRewind;
  Orientation get orientation;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PlayerStateCopyWith<PlayerState> get copyWith =>
      _$PlayerStateCopyWithImpl<PlayerState>(this as PlayerState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PlayerState &&
            (identical(other.isMini, isMini) || other.isMini == isMini) &&
            (identical(other.hasTimer, hasTimer) ||
                other.hasTimer == hasTimer) &&
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
            const DeepCollectionEquality().equals(other.videos, videos) &&
            const DeepCollectionEquality()
                .equals(other.offlineVideos, offlineVideos) &&
            const DeepCollectionEquality()
                .equals(other.playedVideos, playedVideos) &&
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
                .equals(other.sponsorSegments, sponsorSegments) &&
            (identical(other.nextSegment, nextSegment) ||
                other.nextSegment == nextSegment) &&
            (identical(other.forwardStep, forwardStep) ||
                other.forwardStep == forwardStep) &&
            const DeepCollectionEquality()
                .equals(other.rewindStep, rewindStep) &&
            (identical(other.totalFastForward, totalFastForward) ||
                other.totalFastForward == totalFastForward) &&
            const DeepCollectionEquality()
                .equals(other.totalRewind, totalRewind) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isMini,
        hasTimer,
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
        const DeepCollectionEquality().hash(videos),
        const DeepCollectionEquality().hash(offlineVideos),
        const DeepCollectionEquality().hash(playedVideos),
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
        const DeepCollectionEquality().hash(sponsorSegments),
        nextSegment,
        forwardStep,
        const DeepCollectionEquality().hash(rewindStep),
        totalFastForward,
        const DeepCollectionEquality().hash(totalRewind),
        orientation
      ]);

  @override
  String toString() {
    return 'PlayerState(isMini: $isMini, hasTimer: $hasTimer, top: $top, isDragging: $isDragging, selectedFullScreenIndex: $selectedFullScreenIndex, isHidden: $isHidden, isClosing: $isClosing, dragDistance: $dragDistance, showMiniPlaceholder: $showMiniPlaceholder, dragStartMini: $dragStartMini, height: $height, fullScreenState: $fullScreenState, muted: $muted, aspectRatio: $aspectRatio, currentlyPlaying: $currentlyPlaying, offlineCurrentlyPlaying: $offlineCurrentlyPlaying, videos: $videos, offlineVideos: $offlineVideos, playedVideos: $playedVideos, playQueue: $playQueue, isAudio: $isAudio, isPip: $isPip, offset: $offset, startAt: $startAt, position: $position, bufferedPosition: $bufferedPosition, isPlaying: $isPlaying, speed: $speed, mediaCommand: $mediaCommand, mediaEvent: $mediaEvent, sponsorSegments: $sponsorSegments, nextSegment: $nextSegment, forwardStep: $forwardStep, rewindStep: $rewindStep, totalFastForward: $totalFastForward, totalRewind: $totalRewind, orientation: $orientation)';
  }
}

/// @nodoc
abstract mixin class $PlayerStateCopyWith<$Res> {
  factory $PlayerStateCopyWith(
          PlayerState value, $Res Function(PlayerState) _then) =
      _$PlayerStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isMini,
      bool hasTimer,
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
      List<Video> videos,
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
      MediaCommand? mediaCommand,
      MediaEvent mediaEvent,
      List<Pair<int>> sponsorSegments,
      Pair<int> nextSegment,
      int forwardStep,
      dynamic rewindStep,
      int totalFastForward,
      dynamic totalRewind,
      Orientation orientation});

  $VideoCopyWith<$Res>? get currentlyPlaying;
  $DownloadedVideoCopyWith<$Res>? get offlineCurrentlyPlaying;
}

/// @nodoc
class _$PlayerStateCopyWithImpl<$Res> implements $PlayerStateCopyWith<$Res> {
  _$PlayerStateCopyWithImpl(this._self, this._then);

  final PlayerState _self;
  final $Res Function(PlayerState) _then;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isMini = null,
    Object? hasTimer = null,
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
    Object? orientation = null,
  }) {
    return _then(_self.copyWith(
      isMini: null == isMini
          ? _self.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
      hasTimer: null == hasTimer
          ? _self.hasTimer
          : hasTimer // ignore: cast_nullable_to_non_nullable
              as bool,
      top: freezed == top
          ? _self.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      isDragging: null == isDragging
          ? _self.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFullScreenIndex: null == selectedFullScreenIndex
          ? _self.selectedFullScreenIndex
          : selectedFullScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: null == isHidden
          ? _self.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosing: null == isClosing
          ? _self.isClosing
          : isClosing // ignore: cast_nullable_to_non_nullable
              as bool,
      dragDistance: null == dragDistance
          ? _self.dragDistance
          : dragDistance // ignore: cast_nullable_to_non_nullable
              as double,
      showMiniPlaceholder: null == showMiniPlaceholder
          ? _self.showMiniPlaceholder
          : showMiniPlaceholder // ignore: cast_nullable_to_non_nullable
              as bool,
      dragStartMini: null == dragStartMini
          ? _self.dragStartMini
          : dragStartMini // ignore: cast_nullable_to_non_nullable
              as bool,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      fullScreenState: null == fullScreenState
          ? _self.fullScreenState
          : fullScreenState // ignore: cast_nullable_to_non_nullable
              as FullScreenState,
      muted: null == muted
          ? _self.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      aspectRatio: null == aspectRatio
          ? _self.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      currentlyPlaying: freezed == currentlyPlaying
          ? _self.currentlyPlaying
          : currentlyPlaying // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineCurrentlyPlaying: freezed == offlineCurrentlyPlaying
          ? _self.offlineCurrentlyPlaying
          : offlineCurrentlyPlaying // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      videos: null == videos
          ? _self.videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      offlineVideos: null == offlineVideos
          ? _self.offlineVideos
          : offlineVideos // ignore: cast_nullable_to_non_nullable
              as List<DownloadedVideo>,
      playedVideos: null == playedVideos
          ? _self.playedVideos
          : playedVideos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playQueue: null == playQueue
          ? _self.playQueue
          : playQueue // ignore: cast_nullable_to_non_nullable
              as ListQueue<String>,
      isAudio: null == isAudio
          ? _self.isAudio
          : isAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isPip: null == isPip
          ? _self.isPip
          : isPip // ignore: cast_nullable_to_non_nullable
              as bool,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      startAt: freezed == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _self.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _self.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      mediaCommand: freezed == mediaCommand
          ? _self.mediaCommand
          : mediaCommand // ignore: cast_nullable_to_non_nullable
              as MediaCommand?,
      mediaEvent: null == mediaEvent
          ? _self.mediaEvent
          : mediaEvent // ignore: cast_nullable_to_non_nullable
              as MediaEvent,
      sponsorSegments: null == sponsorSegments
          ? _self.sponsorSegments
          : sponsorSegments // ignore: cast_nullable_to_non_nullable
              as List<Pair<int>>,
      nextSegment: null == nextSegment
          ? _self.nextSegment
          : nextSegment // ignore: cast_nullable_to_non_nullable
              as Pair<int>,
      forwardStep: null == forwardStep
          ? _self.forwardStep
          : forwardStep // ignore: cast_nullable_to_non_nullable
              as int,
      rewindStep: freezed == rewindStep
          ? _self.rewindStep
          : rewindStep // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalFastForward: null == totalFastForward
          ? _self.totalFastForward
          : totalFastForward // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewind: freezed == totalRewind
          ? _self.totalRewind
          : totalRewind // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orientation: null == orientation
          ? _self.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
    ));
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res>? get currentlyPlaying {
    if (_self.currentlyPlaying == null) {
      return null;
    }

    return $VideoCopyWith<$Res>(_self.currentlyPlaying!, (value) {
      return _then(_self.copyWith(currentlyPlaying: value));
    });
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get offlineCurrentlyPlaying {
    if (_self.offlineCurrentlyPlaying == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.offlineCurrentlyPlaying!,
        (value) {
      return _then(_self.copyWith(offlineCurrentlyPlaying: value));
    });
  }
}

/// Adds pattern-matching-related methods to [PlayerState].
extension PlayerStatePatterns on PlayerState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_PlayerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayerState() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_PlayerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerState():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_PlayerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerState() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            bool isMini,
            bool hasTimer,
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
            List<Video> videos,
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
            MediaCommand? mediaCommand,
            MediaEvent mediaEvent,
            List<Pair<int>> sponsorSegments,
            Pair<int> nextSegment,
            int forwardStep,
            dynamic rewindStep,
            int totalFastForward,
            dynamic totalRewind,
            Orientation orientation)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PlayerState() when $default != null:
        return $default(
            _that.isMini,
            _that.hasTimer,
            _that.top,
            _that.isDragging,
            _that.selectedFullScreenIndex,
            _that.isHidden,
            _that.isClosing,
            _that.dragDistance,
            _that.showMiniPlaceholder,
            _that.dragStartMini,
            _that.height,
            _that.fullScreenState,
            _that.muted,
            _that.aspectRatio,
            _that.currentlyPlaying,
            _that.offlineCurrentlyPlaying,
            _that.videos,
            _that.offlineVideos,
            _that.playedVideos,
            _that.playQueue,
            _that.isAudio,
            _that.isPip,
            _that.offset,
            _that.startAt,
            _that.position,
            _that.bufferedPosition,
            _that.isPlaying,
            _that.speed,
            _that.mediaCommand,
            _that.mediaEvent,
            _that.sponsorSegments,
            _that.nextSegment,
            _that.forwardStep,
            _that.rewindStep,
            _that.totalFastForward,
            _that.totalRewind,
            _that.orientation);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            bool isMini,
            bool hasTimer,
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
            List<Video> videos,
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
            MediaCommand? mediaCommand,
            MediaEvent mediaEvent,
            List<Pair<int>> sponsorSegments,
            Pair<int> nextSegment,
            int forwardStep,
            dynamic rewindStep,
            int totalFastForward,
            dynamic totalRewind,
            Orientation orientation)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerState():
        return $default(
            _that.isMini,
            _that.hasTimer,
            _that.top,
            _that.isDragging,
            _that.selectedFullScreenIndex,
            _that.isHidden,
            _that.isClosing,
            _that.dragDistance,
            _that.showMiniPlaceholder,
            _that.dragStartMini,
            _that.height,
            _that.fullScreenState,
            _that.muted,
            _that.aspectRatio,
            _that.currentlyPlaying,
            _that.offlineCurrentlyPlaying,
            _that.videos,
            _that.offlineVideos,
            _that.playedVideos,
            _that.playQueue,
            _that.isAudio,
            _that.isPip,
            _that.offset,
            _that.startAt,
            _that.position,
            _that.bufferedPosition,
            _that.isPlaying,
            _that.speed,
            _that.mediaCommand,
            _that.mediaEvent,
            _that.sponsorSegments,
            _that.nextSegment,
            _that.forwardStep,
            _that.rewindStep,
            _that.totalFastForward,
            _that.totalRewind,
            _that.orientation);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            bool isMini,
            bool hasTimer,
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
            List<Video> videos,
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
            MediaCommand? mediaCommand,
            MediaEvent mediaEvent,
            List<Pair<int>> sponsorSegments,
            Pair<int> nextSegment,
            int forwardStep,
            dynamic rewindStep,
            int totalFastForward,
            dynamic totalRewind,
            Orientation orientation)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PlayerState() when $default != null:
        return $default(
            _that.isMini,
            _that.hasTimer,
            _that.top,
            _that.isDragging,
            _that.selectedFullScreenIndex,
            _that.isHidden,
            _that.isClosing,
            _that.dragDistance,
            _that.showMiniPlaceholder,
            _that.dragStartMini,
            _that.height,
            _that.fullScreenState,
            _that.muted,
            _that.aspectRatio,
            _that.currentlyPlaying,
            _that.offlineCurrentlyPlaying,
            _that.videos,
            _that.offlineVideos,
            _that.playedVideos,
            _that.playQueue,
            _that.isAudio,
            _that.isPip,
            _that.offset,
            _that.startAt,
            _that.position,
            _that.bufferedPosition,
            _that.isPlaying,
            _that.speed,
            _that.mediaCommand,
            _that.mediaEvent,
            _that.sponsorSegments,
            _that.nextSegment,
            _that.forwardStep,
            _that.rewindStep,
            _that.totalFastForward,
            _that.totalRewind,
            _that.orientation);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _PlayerState extends PlayerState {
  const _PlayerState(
      {this.isMini = true,
      this.hasTimer = false,
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
      final List<Video> videos = const [],
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
      this.totalRewind = 0,
      this.orientation = Orientation.portrait})
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
  @JsonKey()
  final bool hasTimer;
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
  final List<Video> _videos;
  @override
  @JsonKey()
  List<Video> get videos {
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
  final MediaCommand? mediaCommand;
// events we receive from bottom of stack
  @override
  @JsonKey()
  final MediaEvent mediaEvent;
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
  @JsonKey()
  final Orientation orientation;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PlayerStateCopyWith<_PlayerState> get copyWith =>
      __$PlayerStateCopyWithImpl<_PlayerState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PlayerState &&
            (identical(other.isMini, isMini) || other.isMini == isMini) &&
            (identical(other.hasTimer, hasTimer) ||
                other.hasTimer == hasTimer) &&
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
                .equals(other.totalRewind, totalRewind) &&
            (identical(other.orientation, orientation) ||
                other.orientation == orientation));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        isMini,
        hasTimer,
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
        const DeepCollectionEquality().hash(totalRewind),
        orientation
      ]);

  @override
  String toString() {
    return 'PlayerState(isMini: $isMini, hasTimer: $hasTimer, top: $top, isDragging: $isDragging, selectedFullScreenIndex: $selectedFullScreenIndex, isHidden: $isHidden, isClosing: $isClosing, dragDistance: $dragDistance, showMiniPlaceholder: $showMiniPlaceholder, dragStartMini: $dragStartMini, height: $height, fullScreenState: $fullScreenState, muted: $muted, aspectRatio: $aspectRatio, currentlyPlaying: $currentlyPlaying, offlineCurrentlyPlaying: $offlineCurrentlyPlaying, videos: $videos, offlineVideos: $offlineVideos, playedVideos: $playedVideos, playQueue: $playQueue, isAudio: $isAudio, isPip: $isPip, offset: $offset, startAt: $startAt, position: $position, bufferedPosition: $bufferedPosition, isPlaying: $isPlaying, speed: $speed, mediaCommand: $mediaCommand, mediaEvent: $mediaEvent, sponsorSegments: $sponsorSegments, nextSegment: $nextSegment, forwardStep: $forwardStep, rewindStep: $rewindStep, totalFastForward: $totalFastForward, totalRewind: $totalRewind, orientation: $orientation)';
  }
}

/// @nodoc
abstract mixin class _$PlayerStateCopyWith<$Res>
    implements $PlayerStateCopyWith<$Res> {
  factory _$PlayerStateCopyWith(
          _PlayerState value, $Res Function(_PlayerState) _then) =
      __$PlayerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {bool isMini,
      bool hasTimer,
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
      List<Video> videos,
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
      MediaCommand? mediaCommand,
      MediaEvent mediaEvent,
      List<Pair<int>> sponsorSegments,
      Pair<int> nextSegment,
      int forwardStep,
      dynamic rewindStep,
      int totalFastForward,
      dynamic totalRewind,
      Orientation orientation});

  @override
  $VideoCopyWith<$Res>? get currentlyPlaying;
  @override
  $DownloadedVideoCopyWith<$Res>? get offlineCurrentlyPlaying;
}

/// @nodoc
class __$PlayerStateCopyWithImpl<$Res> implements _$PlayerStateCopyWith<$Res> {
  __$PlayerStateCopyWithImpl(this._self, this._then);

  final _PlayerState _self;
  final $Res Function(_PlayerState) _then;

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isMini = null,
    Object? hasTimer = null,
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
    Object? orientation = null,
  }) {
    return _then(_PlayerState(
      isMini: null == isMini
          ? _self.isMini
          : isMini // ignore: cast_nullable_to_non_nullable
              as bool,
      hasTimer: null == hasTimer
          ? _self.hasTimer
          : hasTimer // ignore: cast_nullable_to_non_nullable
              as bool,
      top: freezed == top
          ? _self.top
          : top // ignore: cast_nullable_to_non_nullable
              as double?,
      isDragging: null == isDragging
          ? _self.isDragging
          : isDragging // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedFullScreenIndex: null == selectedFullScreenIndex
          ? _self.selectedFullScreenIndex
          : selectedFullScreenIndex // ignore: cast_nullable_to_non_nullable
              as int,
      isHidden: null == isHidden
          ? _self.isHidden
          : isHidden // ignore: cast_nullable_to_non_nullable
              as bool,
      isClosing: null == isClosing
          ? _self.isClosing
          : isClosing // ignore: cast_nullable_to_non_nullable
              as bool,
      dragDistance: null == dragDistance
          ? _self.dragDistance
          : dragDistance // ignore: cast_nullable_to_non_nullable
              as double,
      showMiniPlaceholder: null == showMiniPlaceholder
          ? _self.showMiniPlaceholder
          : showMiniPlaceholder // ignore: cast_nullable_to_non_nullable
              as bool,
      dragStartMini: null == dragStartMini
          ? _self.dragStartMini
          : dragStartMini // ignore: cast_nullable_to_non_nullable
              as bool,
      height: null == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double,
      fullScreenState: null == fullScreenState
          ? _self.fullScreenState
          : fullScreenState // ignore: cast_nullable_to_non_nullable
              as FullScreenState,
      muted: null == muted
          ? _self.muted
          : muted // ignore: cast_nullable_to_non_nullable
              as bool,
      aspectRatio: null == aspectRatio
          ? _self.aspectRatio
          : aspectRatio // ignore: cast_nullable_to_non_nullable
              as double,
      currentlyPlaying: freezed == currentlyPlaying
          ? _self.currentlyPlaying
          : currentlyPlaying // ignore: cast_nullable_to_non_nullable
              as Video?,
      offlineCurrentlyPlaying: freezed == offlineCurrentlyPlaying
          ? _self.offlineCurrentlyPlaying
          : offlineCurrentlyPlaying // ignore: cast_nullable_to_non_nullable
              as DownloadedVideo?,
      videos: null == videos
          ? _self._videos
          : videos // ignore: cast_nullable_to_non_nullable
              as List<Video>,
      offlineVideos: null == offlineVideos
          ? _self._offlineVideos
          : offlineVideos // ignore: cast_nullable_to_non_nullable
              as List<DownloadedVideo>,
      playedVideos: null == playedVideos
          ? _self._playedVideos
          : playedVideos // ignore: cast_nullable_to_non_nullable
              as List<String>,
      playQueue: null == playQueue
          ? _self.playQueue
          : playQueue // ignore: cast_nullable_to_non_nullable
              as ListQueue<String>,
      isAudio: null == isAudio
          ? _self.isAudio
          : isAudio // ignore: cast_nullable_to_non_nullable
              as bool,
      isPip: null == isPip
          ? _self.isPip
          : isPip // ignore: cast_nullable_to_non_nullable
              as bool,
      offset: null == offset
          ? _self.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as Offset,
      startAt: freezed == startAt
          ? _self.startAt
          : startAt // ignore: cast_nullable_to_non_nullable
              as Duration?,
      position: null == position
          ? _self.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      bufferedPosition: null == bufferedPosition
          ? _self.bufferedPosition
          : bufferedPosition // ignore: cast_nullable_to_non_nullable
              as Duration,
      isPlaying: null == isPlaying
          ? _self.isPlaying
          : isPlaying // ignore: cast_nullable_to_non_nullable
              as bool,
      speed: null == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as double,
      mediaCommand: freezed == mediaCommand
          ? _self.mediaCommand
          : mediaCommand // ignore: cast_nullable_to_non_nullable
              as MediaCommand?,
      mediaEvent: null == mediaEvent
          ? _self.mediaEvent
          : mediaEvent // ignore: cast_nullable_to_non_nullable
              as MediaEvent,
      sponsorSegments: null == sponsorSegments
          ? _self._sponsorSegments
          : sponsorSegments // ignore: cast_nullable_to_non_nullable
              as List<Pair<int>>,
      nextSegment: null == nextSegment
          ? _self.nextSegment
          : nextSegment // ignore: cast_nullable_to_non_nullable
              as Pair<int>,
      forwardStep: null == forwardStep
          ? _self.forwardStep
          : forwardStep // ignore: cast_nullable_to_non_nullable
              as int,
      rewindStep: freezed == rewindStep
          ? _self.rewindStep
          : rewindStep // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalFastForward: null == totalFastForward
          ? _self.totalFastForward
          : totalFastForward // ignore: cast_nullable_to_non_nullable
              as int,
      totalRewind: freezed == totalRewind
          ? _self.totalRewind
          : totalRewind // ignore: cast_nullable_to_non_nullable
              as dynamic,
      orientation: null == orientation
          ? _self.orientation
          : orientation // ignore: cast_nullable_to_non_nullable
              as Orientation,
    ));
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VideoCopyWith<$Res>? get currentlyPlaying {
    if (_self.currentlyPlaying == null) {
      return null;
    }

    return $VideoCopyWith<$Res>(_self.currentlyPlaying!, (value) {
      return _then(_self.copyWith(currentlyPlaying: value));
    });
  }

  /// Create a copy of PlayerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DownloadedVideoCopyWith<$Res>? get offlineCurrentlyPlaying {
    if (_self.offlineCurrentlyPlaying == null) {
      return null;
    }

    return $DownloadedVideoCopyWith<$Res>(_self.offlineCurrentlyPlaying!,
        (value) {
      return _then(_self.copyWith(offlineCurrentlyPlaying: value));
    });
  }
}

// dart format on
