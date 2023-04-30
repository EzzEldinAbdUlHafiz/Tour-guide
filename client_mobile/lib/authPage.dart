import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutguide/Screens/homeScreen.dart';
import 'package:tutguide/Screens/loginScreen.dart';
import 'package:tutguide/Screens/mainScreen.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const MainScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
