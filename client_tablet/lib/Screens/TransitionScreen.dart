import 'package:client_tablet/Screens/VideoScreen.dart';
import 'package:client_tablet/storage.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:client_tablet/mqtt.dart';

class TransitionScreen extends StatefulWidget {
  const TransitionScreen({super.key});

  @override
  State<TransitionScreen> createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {
  double h = 0, w = 0, topPadding = 0;
  final Storage storage = Storage();

  void mqttCustomSubscribe() {
    Mqtt.client.subscribe('my/topic', MqttQos.atLeastOnce);
    Mqtt.client.updates!
        .listen((List<MqttReceivedMessage<MqttMessage>> messages) {
      final message = messages[0].payload as MqttPublishMessage;
      final payload =
          MqttPublishPayload.bytesToStringAsString(message.payload.message);
      debugPrint(
          'Received message: $payload from topic: ${message.variableHeader!.topicName}');
      Mqtt.client.unsubscribe('my/topic');
      if (payload.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(
              rfid: payload,
            ),
          ),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    mqttCustomSubscribe();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Image.asset("assets/images/movigRobot.gif");
  }
}
