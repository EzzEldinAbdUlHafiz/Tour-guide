// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/videoPlayer.dart';

class ObjectScreen extends StatelessWidget {
  double h = 0, w = 0, topPadding = 0;

  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    h = MediaQuery.of(context).size.height - topPadding;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: Colors.amber,
                child: VideoPlayerWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
