import 'package:fittrix/presentation/provider/video_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    if (!context.read<VideoProvider>().initialized) {
      context.read<VideoProvider>().initVideoPlayer();
    }
    context.read<VideoProvider>().addControllerListener(listener: checkVideo);
    super.initState();
  }

  void checkVideo() {
    if (this.mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final videoPlayerController = context
        .select((VideoProvider provider) => provider.videoPlayerController);
    return VideoPlayer(videoPlayerController);
  }
}
