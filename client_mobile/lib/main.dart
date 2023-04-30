import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/videoPlayer.dart';
import 'package:tutguide/Screens/eventScreen.dart';
import 'package:tutguide/Screens/events.dart';
import 'package:tutguide/Screens/homeScreen.dart';
import 'package:tutguide/Screens/mainScreen.dart';
import 'package:tutguide/Screens/searchScreen.dart';
import 'package:tutguide/authPage.dart';
import 'Screens/loginScreen.dart';
import 'Screens/profileScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tut-Guide',
      theme: ThemeData(),
      home: Auth(),
    );
  }
}
