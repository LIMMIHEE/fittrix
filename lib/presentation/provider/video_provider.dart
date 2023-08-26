import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController _videoPlayerController;

  get videoPlayerController => _videoPlayerController;

  bool initialized = false;
  int videoIndex = 1;

  void initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset('assets/images/ad_video$videoIndex.mp4');
    videoIndex = videoIndex == 1 ? 2 : 1;

    initialized = true;
    await _videoPlayerController.initialize();
    addControllerListener();
    _videoPlayerController.play();
  }

  void playVideo() {
    _videoPlayerController.play();
  }

  void pauseVideo() {
    _videoPlayerController.pause();
  }

  void addControllerListener({Function()? listener}) {
    _videoPlayerController.addListener(() {
      if (_videoPlayerController.value.position ==
          _videoPlayerController.value.duration) {
        if (listener != null) {
          listener();
        } else {
          _videoPlayerController.dispose();
          initVideoPlayer();
        }
      }
    });
  }

  void controllerDispose() {
    _videoPlayerController.dispose();
  }
}
