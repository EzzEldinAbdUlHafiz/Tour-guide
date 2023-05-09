import 'package:client_tablet/Globals.dart';
import 'package:flutter/material.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'dart:math';

class Mqtt {
  static final client =
      MqttServerClient(Globals().mqtt, 'client_tablet${Random().nextInt(100)}');

  Future<void> mqttConnect() async {
    client.keepAlivePeriod = 20;
    await client.connect();
    debugPrint('${client.clientIdentifier} connected to MQTT server');
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
      client.unsubscribe('my/topic');
    });
  }
}
