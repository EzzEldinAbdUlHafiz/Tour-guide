// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  // const SmallCard({super.key});
  final String img;
  final String txt;

  SmallCard({
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
            height: 100,
            width: 125,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
            child: Image.asset(
              img,
              fit: BoxFit.cover,
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
