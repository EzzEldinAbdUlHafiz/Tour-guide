// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/Screens/components/eventBigCard.dart';
import 'package:tutguide/Screens/eventScreen.dart';
import 'package:tutguide/models/Event.dart';
import 'package:tutguide/storage.dart';
import 'package:http/http.dart' as http;

class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  static List<Event> eventList = [];
  late List<Event> displayEvent = [];

  Future<void> getEvents() async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/event/getEvents'));
    if (response.statusCode == 200) {
      eventList = Event.fromJsonList(jsonDecode(response.body));
      // return Museum.fromJsonList(jsonDecode(response.body));
      setState(() {
        displayEvent = List.from(eventList);
      });
    } else {
      throw Exception("Failed to load Events");
    }
  }

  void updateList(String value) {
    setState(
      () {
        displayEvent = eventList
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(15, 50, 15, 15),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'My Favorites',
            //   style: TextStyle(
            //     fontWeight: FontWeight.bold,
            //     fontSize: 20,
            //   ),
            // ),
            // // SizedBox(height: 10),
            // SizedBox(
            //   // color: Colors.amber,
            //   height: 110,
            //   child: SingleChildScrollView(
            //     scrollDirection: Axis.horizontal,
            //     child: Row(
            //       children: [
            //         // Favorites(img: 'assets/images/img3.jpg'),
            //         // Favorites(img: 'assets/images/img3.jpg'),
            //         // Favorites(img: 'assets/images/img3.jpg'),
            //         // Favorites(img: 'assets/images/img3.jpg'),
            //       ],
            //     ),
            //   ),
            // ),
            // Divider(thickness: 0.5, color: Colors.grey.shade300),
            // SizedBox(height: 10),
            Text(
              "Search for an Event",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.shade300,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintText: "Search",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: displayEvent.isEmpty
                  ? Center(
                      child: eventList.isNotEmpty
                          ? Text(
                              "No results found",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: displayEvent.length,
                      itemBuilder: (context, index) => EventBigCard(
                        date: displayEvent[index].eventDate,
                        img: displayEvent[index].image,
                        location: displayEvent[index].location,
                        name: displayEvent[index].name,
                        time: displayEvent[index].eventTime,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
