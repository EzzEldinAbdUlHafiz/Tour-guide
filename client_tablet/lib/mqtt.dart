// import 'package:flutter/foundation.dart';
// import 'package:mqtt_client/mqtt_client.dart';
// import 'package:mqtt_client/mqtt_server_client.dart';

// class Mqtt {
//   // connection succeeded
//   void onConnected() {
//     debugPrint('Connected');
//   }

// // unconnected
//   void onDisconnected() {
//     debugPrint('Disconnected');
//   }

// // subscribe to topic succeeded
//   void onSubscribed(String topic) {
//     debugPrint('Subscribed topic: $topic');
//   }

// // subscribe to topic failed
//   void onSubscribeFail(String topic) {
//     debugPrint('Failed to subscribe $topic');
//   }

// // unsubscribe succeeded

// // PING response received
//   void pong() {
//     debugPrint('Ping response client callback invoked');
//   }

//   Future<MqttServerClient> connect() async {
//     MqttServerClient client =
//         MqttServerClient.withPort('broker.emqx.io', 'flutter_client', 1883);
//     client.logging(on: true);
//     client.onConnected = onConnected;
//     client.onDisconnected = onDisconnected;
//     client.onSubscribed = onSubscribed;
//     client.onSubscribeFail = onSubscribeFail;
//     client.pongCallback = pong;

//     final connMessage = MqttConnectMessage()
//         .authenticateAs('username', 'password')
//         .keepAliveFor(60)
//         .withWillTopic('willtopic')
//         .withWillMessage('Will message')
//         .startClean()
//         .withWillQos(MqttQos.atLeastOnce);
//     client.connectionMessage = connMessage;
//     try {
//       await client.connect();
//     } catch (e) {
//       print('Exception: $e');
//       client.disconnect();
//     }

//     client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
//       final MqttPublishMessage message = c[0].payload;
//       final payload =
//           MqttPublishPayload.bytesToStringAsString(message.payload.message);

//       print('Received message:$payload from topic: ${c[0].topic}>');
//     });

//     return client;
//   }
// }
