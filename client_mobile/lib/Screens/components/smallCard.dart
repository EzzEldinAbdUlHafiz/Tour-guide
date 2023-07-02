// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:tutguide/models/Museum.dart';
import '../museumScreen.dart';

class SmallCard extends StatelessWidget {
  final String img;
  final String txt;
  final Museum museum;

  SmallCard({
    Key? key,
    required this.img,
    required this.txt,
    required this.museum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MuseumScreen(
                museum: museum,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 125,
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  img,
                  fit: BoxFit.cover,
                  loadingBuilder: (_, child, progress) {
                    if (progress == null) {
                      return child;
                    }
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 30),
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
                txt,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
