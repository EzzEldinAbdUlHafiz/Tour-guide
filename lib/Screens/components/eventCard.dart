import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  // const EventCard({super.key});
  final String img;
  final String txt;

  EventCard({
    required this.img,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 125,
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.asset(
              img,
            ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text(txt),
          )
        ],
      ),
    );
  }
}
