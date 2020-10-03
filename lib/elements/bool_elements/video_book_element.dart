import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
//import 'package:video_player_web/video_player_web.dart';

class VideoBookElement extends StatefulWidget {
  VideoBookElement({
    Key key,
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
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
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
  // VideoPlayerController _controller;
  // Future<void> _initializeVideoPlayerFuture;

  // @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //     'https://www.sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4',
  //     //closedCaptionFile: _loadCaptions(),
  //     videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
  //   )..initialize().then((_) {
  //       // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
  //       setState(() {});
  //     });

  //   _initializeVideoPlayerFuture = _controller.initialize();

  //   _controller.addListener(() {
  //     setState(() {});
  //   });
  //   _controller.setLooping(true);
  //   _controller.initialize();
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   _controller.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(20),
      child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            VideoPlayer(_controller),
            VideoProgressIndicator(_controller, allowScrubbing: true),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  _controller.value.isPlaying
                      ? _controller.pause()
                      : _controller.play();
                });
              },
              child: Icon(
                _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _ControlsOverlay extends StatelessWidget {
//   const _ControlsOverlay({Key key, this.controller}) : super(key: key);

//   static const _examplePlaybackRates = [
//     0.25,
//     0.5,
//     1.0,
//     1.5,
//     2.0,
//     3.0,
//     5.0,
//     10.0,
//   ];

//   final VideoPlayerController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: <Widget>[
//         AnimatedSwitcher(
//           duration: Duration(milliseconds: 50),
//           reverseDuration: Duration(milliseconds: 200),
//           child: controller.value.isPlaying
//               ? SizedBox.shrink()
//               : Container(
//                   color: Colors.black26,
//                   child: Center(
//                     child: Icon(
//                       Icons.play_arrow,
//                       color: Colors.white,
//                       size: 100.0,
//                     ),
//                   ),
//                 ),
//         ),
//         GestureDetector(
//           onTap: () {
//             controller.value.isPlaying ? controller.pause() : controller.play();
//           },
//         ),
//         Align(
//           alignment: Alignment.topRight,
//           child: PopupMenuButton<double>(
//             initialValue: controller.value.playbackSpeed,
//             tooltip: 'Playback speed',
//             onSelected: (speed) {
//               controller.setPlaybackSpeed(speed);
//             },
//             itemBuilder: (context) {
//               return [
//                 for (final speed in _examplePlaybackRates)
//                   PopupMenuItem(
//                     value: speed,
//                     child: Text('${speed}x'),
//                   )
//               ];
//             },
//             child: Padding(
//               padding: const EdgeInsets.symmetric(
//                 // Using less vertical padding as the text is also longer
//                 // horizontally, so it feels like it would need more spacing
//                 // horizontally (matching the aspect ratio of the video).
//                 vertical: 12,
//                 horizontal: 16,
//               ),
//               child: Text('${controller.value.playbackSpeed}x'),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
