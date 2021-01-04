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
      ..addListener(() {
        setState(() {});
      })
      ..setLooping(true)
      ..initialize();
    // ..initialize().then((_) {
    //   // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AspectRatio(
          aspectRatio: _controller.value.aspectRatio,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              VideoPlayer(_controller),
              _ControlsOverlay(controller: _controller),
              VideoProgressIndicator(_controller, allowScrubbing: true),
            ],
          ),
        ),
      ),
    );

    // return _controller.value.initialized
    //     ? Column(
    //         children: [
    //           Expanded(
    //             child: Container(
    //                 alignment: Alignment.center,
    //                 child: AspectRatio(
    //                   aspectRatio: _controller.value.aspectRatio,
    //                   child: VideoPlayer(_controller),
    //                 )),
    //           ),
    //           SizedBox(height: 8),
    //           FlatButton(
    //               onPressed: () {
    //                 setState(() {
    //                   _controller.value.isPlaying
    //                       ? _controller.pause()
    //                       : _controller.play();
    //                 });
    //               },
    //               child: _controller.value.isPlaying
    //                   ? Row(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text('Pause'),
    //                         SizedBox(width: 8),
    //                         Icon(Icons.pause),
    //                       ],
    //                     )
    //                   : Row(
    //                       mainAxisAlignment: MainAxisAlignment.center,
    //                       children: [
    //                         Text('Play'),
    //                         SizedBox(width: 8),
    //                         Icon(Icons.play_arrow),
    //                       ],
    //                     )),
    //         ],
    //       )
    //     : Center(
    //         child: CircularProgressIndicator(),
    //       );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key key, @required this.controller})
      : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
