// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/eventCard.dart';
import 'package:tutguide/Screens/components/smallCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(15, 50, 15, 15),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello,',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "Youssef Amr",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      )
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(
                      Icons.person,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.cyanAccent.shade100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      child: Icon(
                        Icons.qr_code_scanner_rounded,
                        size: 75,
                      ),
                    ),
                    SizedBox(width: 25),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Text(
                          //   "مش عارف اكتب ايه شوفوا انتم بقا 😊😊",
                          //   style: TextStyle(
                          //     fontSize: 15,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // SizedBox(height: 10),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amberAccent,
                              padding: EdgeInsets.all(15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'SCAN & 🥸🥸',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 25),
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
              SizedBox(height: 25),
              Container(
                height: 150,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SmallCard(img: 'assets/images/img3.jpg', txt: 'museum1'),
                      SmallCard(img: 'assets/images/img3.jpg', txt: 'museum1'),
                      SmallCard(img: 'assets/images/img4.jpg', txt: 'museum2'),
                      SmallCard(img: 'assets/images/img5.jpg', txt: 'museum3'),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Event list',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Container(
                height: 200,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      EventCard(img: 'assets/images/img1.jpg', txt: 'event1'),
                      EventCard(img: 'assets/images/img2.jpg', txt: 'event2'),
                      EventCard(img: 'assets/images/img1.jpg', txt: 'event1'),
                      EventCard(img: 'assets/images/img2.jpg', txt: 'event2'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
