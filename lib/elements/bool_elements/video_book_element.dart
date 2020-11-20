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
    var url =
        "https://firebasestorage.googleapis.com/v0/b/push-notifications-ee58a.appspot.com/o/No%20Copyright%2C%20Copyright%20Free%20Videos%2C%20Motion%20Graphics%2C%20Background%2C%20Animation%2C%20Video%20Clips%2C%20Download-2Gg6Seob5Mg.mp4?alt=media&token=f9bc7412-f96f-49b9-af41-bc4c5ae86e16";
    _controller = VideoPlayerController.network(
      url,
      //widget.videoUrl,
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
