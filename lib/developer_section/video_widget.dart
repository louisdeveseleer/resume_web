import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

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
    _controller.close();
  }
}
