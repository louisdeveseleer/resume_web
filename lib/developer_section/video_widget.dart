import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  const VideoWidget(this.url);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(initialVideoId: widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: YoutubePlayerIFrame(
          controller: _controller,
          aspectRatio: 9 / 16,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.close();
  }
}

class VideoPlayer extends StatefulWidget {
  final String url;
  final Widget backgroundPlaceholder;
  const VideoPlayer({
    @required this.url,
    this.backgroundPlaceholder,
  });

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  VideoPlayerController videoPlayerController;
  ChewieController chewieController;

  Future<void> initializePlayer() async {
    // videoPlayerController = VideoPlayerController.file(file);
    videoPlayerController = VideoPlayerController.network(widget.url);
    await videoPlayerController.initialize();
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: false,
      looping: false,
      allowMuting: false,
      showControlsOnInitialize: false,
    );
    setState(() {});
  }

  @override
  void initState() {
    initializePlayer();
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (chewieController != null &&
        chewieController.videoPlayerController.value.isInitialized) {
      return Chewie(controller: chewieController);
    } else {
      return Stack(
        fit: StackFit.expand,
        children: [
          widget.backgroundPlaceholder,
          Positioned(
            top: 0,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LinearProgressIndicator(),
                SizedBox(height: 8),
                Text(
                  'Downloading video...',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      );
    }
  }
}
