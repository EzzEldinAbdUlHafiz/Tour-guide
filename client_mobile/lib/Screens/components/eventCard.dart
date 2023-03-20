// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../eventScreen.dart';

class EventCard extends StatelessWidget {
  // const EventCard({super.key});
  String img;
  String txt;

  EventCard(this.img, {this.txt = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventScreen()),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 160,
              width: 125,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  img,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.only(left: 5),
              child: Text(txt),
            )
          ],
        ),
      ),
    );
  }
}
