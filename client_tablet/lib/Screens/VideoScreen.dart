import 'package:client_tablet/Screens/components/video_player.dart';
import 'package:client_tablet/storage.dart';
import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  const VideoScreen({super.key, required this.videoUrl});
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Storage storage = Storage();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: storage.downloadURL(widget.videoUrl),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return Video_player(videoUrl: snapshot.data!);
        }
        return const CircularProgressIndicator();
      }),
    );
  }
}
