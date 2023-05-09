import 'package:client_tablet/Screens/welcomeScreen.dart';
import 'package:client_tablet/mqtt.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Mqtt mqtt = Mqtt();

  @override
  void initState() {
    super.initState();
    mqtt.mqttConnect();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          'assets/images/background.jpg',
        ),
        fit: BoxFit.cover,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                repeatForever: true,
                animatedTexts: [
                  TyperAnimatedText(
                    'Welcome to the Tour Guide Robot!',
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold),
                    speed: const Duration(milliseconds: 50),
                  )
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Press the button below to start the journey.',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  // ignore: deprecated_member_use
                  primary:
                      Colors.grey[800], // Change the button background color

                  padding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 24), // Change the button size
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomeScreen()),
                  );
                },
                child: const Text('Start Journey'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
