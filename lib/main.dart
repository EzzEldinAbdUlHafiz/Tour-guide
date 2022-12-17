import 'package:flutter/material.dart';
import 'package:tutguide/Screens/homeScreen.dart';
import 'Screens/loginScreen.dart';
import 'Screens/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Tut-Guide',
      theme: ThemeData(),
      home: HomeScreen(),
    );
  }
}
