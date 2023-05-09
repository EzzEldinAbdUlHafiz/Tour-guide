import 'package:client_tablet/Screens/components/video_player.dart';
import 'package:client_tablet/models/Artifact.dart';
import 'package:client_tablet/storage.dart';
import 'package:client_tablet/Globals.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class VideoScreen extends StatefulWidget {
  final String rfid;
  const VideoScreen({super.key, required this.rfid});
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  Storage storage = Storage();

  Future<Artifact> getArtifact(String rfid) async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/artifact/rfid/$rfid'));
    if (response.statusCode == 200) {
      return Artifact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Artifact");
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getArtifact(widget.rfid),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return FutureBuilder(
            future: storage.downloadURL(snapshot.data!.video),
            builder: ((context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                return Video_player(videoUrl: snapshot.data!);
              } else {
                return const CircularProgressIndicator();
              }
            }),
          );
        }
        return Container();
      },
    );
  }
}
