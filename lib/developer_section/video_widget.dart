import 'package:ext_video_player/ext_video_player.dart';
import 'package:flutter/material.dart';

class VideoWidget extends StatefulWidget {
  final String url;
  const VideoWidget(this.url);

  @override
  _VideoWidgetState createState() => _VideoWidgetState();
}

class _VideoWidgetState extends State<VideoWidget> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.initialized
        ? Column(
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.center,
                    child: AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )),
              ),
              SizedBox(height: 8),
              FlatButton(
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                  child: _controller.value.isPlaying
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Pause'),
                            SizedBox(width: 8),
                            Icon(Icons.pause),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Play'),
                            SizedBox(width: 8),
                            Icon(Icons.play_arrow),
                          ],
                        )),
            ],
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
