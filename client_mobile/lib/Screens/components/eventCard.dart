// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

import '../eventScreen.dart';

class EventCard extends StatelessWidget {
  final String name;
  final String img;

  const EventCard({super.key, required this.img, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventScreen(
                      name: name,
                    )),
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
                child: Image.network(
                  img,
                  fit: BoxFit.fitHeight,
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) {
                      return child;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 30),
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              width: 125,
              padding: EdgeInsets.only(left: 5),
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
