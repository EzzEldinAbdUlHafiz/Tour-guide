// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/eventScreen.dart';
import 'package:tutguide/storage.dart';

class EventBigCard extends StatefulWidget {
  final String name;
  final String img;
  final String location;
  final String date;
  final String time;
  const EventBigCard(
      {super.key,
      required this.name,
      required this.img,
      required this.location,
      required this.date,
      required this.time});
  @override
  State<EventBigCard> createState() => _EventBigCardState();
}

class _EventBigCardState extends State<EventBigCard> {
  double h = 0, w = 0, topPadding = 0;
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    h = MediaQuery.of(context).size.height - topPadding;
    w = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventScreen(
                name: widget.name,
              ),
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: FutureBuilder(
                          future: storage.downloadURL(widget.img),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return Image.network(
                                snapshot.data!,
                                fit: BoxFit.cover,
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, top: 5),
                        child: Container(
                          width: w - 200,
                          child: Text(
                            widget.name,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, top: 10),
                        child: Text(
                          widget.location,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.date,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                    child: VerticalDivider(
                        thickness: 0.5, color: Colors.grey.shade700),
                  ),
                  Column(
                    children: [
                      Text(
                        widget.time,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Time',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
