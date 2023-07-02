// ignore_for_file: prefer_const_constructors, must_be_immutable
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tutguide/models/Event.dart';
import 'package:tutguide/storage.dart';
import 'package:http/http.dart' as http;

import '../Globals.dart';

class EventScreen extends StatefulWidget {
  final String? name;
  const EventScreen({super.key, required this.name});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  double h = 0, w = 0, topPadding = 0;
  final Storage storage = Storage();

  Future<Event> getEvent() async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/event/${widget.name}'));
    if (response.statusCode == 200) {
      return Event.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Artifact");
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getEvent();
  // }

  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    h = MediaQuery.of(context).size.height - topPadding;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: getEvent(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done &&
                snapshot.hasData) {
              return Stack(
                children: [
                  Row(
                    children: [
                      Container(
                        height: h,
                        width: w * 0.5,
                        color: Colors.black,
                      ),
                      Container(
                        height: h,
                        width: w * 0.5,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  Container(
                    height: h * 0.5,
                    width: w,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      // borderRadius: BorderRadius.only(
                      //   bottomRight: Radius.circular(75),
                      // ),
                    ),
                    child: FutureBuilder(
                      future: storage.downloadURL(snapshot.data!.image),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done &&
                            snapshot.hasData) {
                          return Image.network(
                            snapshot.data!,
                            fit: BoxFit.fill,
                          );
                        }
                        return Container();
                      },
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        child: Container(
                          height: h * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                      child: Text(
                                        snapshot.data!.name,
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Container(
                                      height: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey.shade300),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(
                                              left: 20,
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            width: w * 0.35,
                                            alignment: Alignment.center,
                                            child: Text(
                                              snapshot.data!.location,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            padding: EdgeInsets.all(5),
                                            child: VerticalDivider(
                                                thickness: 0.5,
                                                color: Colors.grey.shade700),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              snapshot.data!.eventDate,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 50,
                                            padding: EdgeInsets.all(5),
                                            child: VerticalDivider(
                                                thickness: 0.5,
                                                color: Colors.grey.shade700),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                              right: 20,
                                              top: 8,
                                              bottom: 8,
                                            ),
                                            alignment: Alignment.center,
                                            child: Text(
                                              snapshot.data!.eventTime,
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.33,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        snapshot.data!.description,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(3),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.keyboard_arrow_left_rounded,
                      ),
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
