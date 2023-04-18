// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import '../MuseumsPage.dart';

class SmallCard extends StatelessWidget {
  // const SmallCard({super.key});
  final String img;
  final String txt;

  SmallCard({
    super.key,
    required this.img,
    required this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MuseumPage()),
          );
        },
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
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
