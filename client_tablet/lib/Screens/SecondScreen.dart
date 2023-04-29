import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Videoscreen extends StatefulWidget {
  const Videoscreen({super.key});

  @override
  State<Videoscreen> createState() => _VideoscreenState();
}

class _VideoscreenState extends State<Videoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
