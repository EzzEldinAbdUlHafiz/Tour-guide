// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/eventBigCard.dart';
import 'package:tutguide/Screens/eventScreen.dart';
import 'components/favorites.dart';

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(15, 50, 15, 15),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Favorites',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // SizedBox(height: 10),
            Container(
              // color: Colors.amber,
              height: 110,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Favorites(img: 'assets/images/img3.jpg'),
                    Favorites(img: 'assets/images/img3.jpg'),
                    Favorites(img: 'assets/images/img3.jpg'),
                    Favorites(img: 'assets/images/img3.jpg'),
                  ],
                ),
              ),
            ),
            Divider(thickness: 0.5, color: Colors.grey.shade300),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search',
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  EventBigCard(),
                  EventBigCard(),
                  EventBigCard(),
                  EventBigCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
