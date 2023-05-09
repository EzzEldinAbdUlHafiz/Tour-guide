// ignore_for_file: library_private_types_in_public_api, camel_case_types
import 'package:client_tablet/Screens/TransitionScreen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_player extends StatefulWidget {
  final String videoUrl;
  const Video_player({super.key, required this.videoUrl});
  @override
  _Video_playerState createState() => _Video_playerState();
}

class _Video_playerState extends State<Video_player> {
  double h = 0, w = 0, topPadding = 0;
  late VideoPlayerController _controller;

  void checkVideo() {
    if (_controller.value.position ==
        const Duration(seconds: 0, minutes: 0, hours: 0)) {
      debugPrint(
          'video Started...........................................................................');
    }

    if (_controller.value.position == _controller.value.duration) {
      debugPrint(
          'video Ended.............................................................................');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TransitionScreen(),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
    _controller.addListener(checkVideo);
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_controller.value.isInitialized)
              SizedBox(
                width: w,
                height: h,
                child: AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                ),
              )
            else
              Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

// FloatingActionButton(
//   onPressed: () {
//     setState(() {
//       _controller.value.isPlaying
//           ? _controller.pause()
//           : _controller.play();
//     });
//   },
//   child: Icon(
//     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//   ),
// ),
