import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoBookElement extends StatefulWidget {
  // This will contain the URL/asset path which we want to play\
  VideoPlayerController videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/videos/butterfly.mp4');

  VideoBookElement({
    Key key,
  }) : super(key: key);

  @override
  _VideoBookElementState createState() => _VideoBookElementState();
}

class _VideoBookElementState extends State<VideoBookElement> {
  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    // Wrapper on top of the videoPlayerController
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      aspectRatio: 16 / 9,
      autoPlay: true,
      autoInitialize: true,
      looping: false,
      // errorBuilder: (context, errorMessage) {
      //   return Center(
      //     child: Text(
      //       errorMessage,
      //       style: TextStyle(color: Colors.white),
      //     ),
      //   );
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.amber,
        child: Chewie(
          controller: _chewieController,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    widget.videoPlayerController.dispose();
    // IMPORTANT to dispose of all the used resources
    _chewieController.dispose();
  }
}
