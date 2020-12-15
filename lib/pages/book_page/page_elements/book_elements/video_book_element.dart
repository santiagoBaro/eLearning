import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBookElement extends StatefulWidget {
  final String videoUrl;
  VideoBookElement({
    Key key,
    @required this.videoUrl,
  }) : super(key: key);

  @override
  _VideoBookElementState createState() => _VideoBookElementState();
}

class _VideoBookElementState extends State<VideoBookElement> {
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      widget.videoUrl,
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              VideoPlayer(_controller),
              VideoProgressIndicator(_controller, allowScrubbing: true),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    },
                    child: Icon(
                      _controller.value.isPlaying
                          ? Icons.pause
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
