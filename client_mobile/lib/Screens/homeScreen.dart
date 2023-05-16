// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/Screens/components/eventCard.dart';
import 'package:tutguide/Screens/components/smallCard.dart';
import 'package:tutguide/Screens/qrcodeScreen.dart';
import 'package:tutguide/models/Event.dart';
import 'package:tutguide/models/Museum.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tutguide/storage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Storage storage = Storage();
  static List<Museum> museumsList = [];
  late List<Museum> displayMuseums = [];
  static List<Event> eventList = [];

  Future<void> getMuseums() async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/museum/getMuseums'));
    if (response.statusCode == 200) {
      museumsList = Museum.fromJsonList(jsonDecode(response.body));
      // return Museum.fromJsonList(jsonDecode(response.body));
      setState(() {
        displayMuseums = List.from(museumsList);
      });
    } else {
      throw Exception("Failed to load Museums");
    }
  }

  void updateList(String value) {
    setState(() {
      displayMuseums = museumsList
          .where((element) =>
              element.name.toLowerCase().contains(value.toLowerCase()) ||
              element.city.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  Future<void> getEvents() async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/event/getEvents'));
    if (response.statusCode == 200) {
      eventList = Event.fromJsonList(jsonDecode(response.body));
      // return Event.fromJsonList(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Events");
    }
  }

  @override
  void initState() {
    super.initState();
    getMuseums();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(15, 50, 15, 15),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
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
                    // Container(
                    //   padding: EdgeInsets.all(15),
                    //   decoration: BoxDecoration(
                    //     color: Colors.amber,
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Icon(
                    //     Icons.person,
                    //   ),
                    // ),
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
                      SizedBox(
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/qr-code.gif"),
                      ),
                      SizedBox(width: 25),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // Text(
                            //   "scaning",
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
                                'SCAN NOW',
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => QRCodeScreen()),
                                );
                              },
                            ),
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
                    onChanged: (value) => updateList(value),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade300,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search for museums",
                      prefixIcon: Icon(Icons.search),
                      prefixIconColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Museum list',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: displayMuseums.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future: storage
                                  .downloadURL(displayMuseums[index].image),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  return SmallCard(
                                    img: snapshot.data!,
                                    txt: displayMuseums[index].name,
                                    museum: displayMuseums[index],
                                  );
                                }
                                return Container();
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: 25),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Event list',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: 200,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: eventList.length,
                          itemBuilder: (context, index) {
                            return FutureBuilder(
                              future:
                                  storage.downloadURL(eventList[index].image),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  return EventCard(
                                    img: snapshot.data!,
                                    name: eventList[index].name,
                                  );
                                }
                                return Container();
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
