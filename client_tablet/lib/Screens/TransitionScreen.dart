import 'dart:convert';
import 'package:client_tablet/Screens/HomeScreen.dart';
import 'package:client_tablet/Screens/videoScreen.dart';
import 'package:http/http.dart' as http;
import 'package:client_tablet/Globals.dart';
import 'package:client_tablet/models/Artifact.dart';
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
  Mqtt myClient = Mqtt();

  Future<void> getArtifact(String rfid) async {
    if (rfid == "238c98e") {
      mqttCustomConnectEnd();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    } else {
      final response =
          await http.get(Uri.parse('${Globals().uri}/artifact/rfid/$rfid'));
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoScreen(
              videoUrl: Artifact.fromJson(jsonDecode(response.body)).video,
            ),
          ),
        );
      } else {
        mqttCustomConnect();
      }
    }
  }

  Future<void> mqttCustomConnect() async {
    Mqtt.client.keepAlivePeriod = 20;
    await Mqtt.client.connect();
    debugPrint(
        '${Mqtt.client.clientIdentifier} connected to MQTT server *************************************************');
    myClient.mqttPublish("move");
    mqttCustomSubscribe();
  }

  Future<void> mqttCustomConnectEnd() async {
    Mqtt.client.keepAlivePeriod = 20;
    await Mqtt.client.connect();
    debugPrint(
        '${Mqtt.client.clientIdentifier} connected to MQTT server *************************************************');
    myClient.mqttPublish("end");
  }

  void mqttCustomSubscribe() {
    Mqtt.client.subscribe('my/topic', MqttQos.atLeastOnce);
    Mqtt.client.updates!.listen(
      (List<MqttReceivedMessage<MqttMessage>> messages) {
        final message = messages[0].payload as MqttPublishMessage;
        final payload =
            MqttPublishPayload.bytesToStringAsString(message.payload.message);
        debugPrint(
            'Received message: $payload from topic: ${message.variableHeader!.topicName}');
        Mqtt.client.unsubscribe('my/topic');
        // if (payload.isNotEmpty) {
        getArtifact(payload);
        // }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    debugPrint("hello to Transition Screen ------------------------------");
    mqttCustomConnect();
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Image.asset("assets/images/movigRobot.gif");
  }
}
