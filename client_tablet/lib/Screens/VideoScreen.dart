// ignore_for_file: library_private_types_in_public_api
import 'package:client_tablet/Globals.dart';
import 'package:client_tablet/Screens/TransitionScreen.dart';
import 'package:client_tablet/storage.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  double h = 0, w = 0, topPadding = 0;
  late VideoPlayerController _controller;
  final Storage storage = Storage();
  final client = MqttServerClient(Globals().mqtt, 'client1');

  Future<void> mqttConnect() async {
    client.keepAlivePeriod = 20;
    await client.connect();
    client.subscribe('my/topic', MqttQos.atLeastOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      final message = messages[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      debugPrint(
          'Received message: $payload from topic: ${message.variableHeader!.topicName}');
    });
  }

  void mqttPublish() {
    final builder = MqttClientPayloadBuilder();
    builder.addString('video Ended');
    client.publishMessage('my/topic', MqttQos.atLeastOnce, builder.payload!);
  }

  void mqttSubscribe() {
    client.subscribe('my/topic', MqttQos.atLeastOnce);
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      final message = messages[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      debugPrint(
          'Received message: $payload from topic: ${message.variableHeader!.topicName}');
    });
  }

  void checkVideo() {
    if (_controller.value.position ==
        const Duration(seconds: 0, minutes: 0, hours: 0)) {
      debugPrint(
          'video Started...........................................................................');
    }

    if (_controller.value.position == _controller.value.duration) {
      debugPrint(
          'video Ended.............................................................................');
      mqttConnect();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const TransitionScreen()),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://drive.google.com/uc?export=view&id=1XgJ7rxNeLA_BoHJM6PNxYIJEizz-jUWF')
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
