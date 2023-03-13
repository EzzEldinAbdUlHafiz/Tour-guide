// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/eventScreen.dart';

class EventBigCard extends StatefulWidget {
  @override
  State<EventBigCard> createState() => _EventBigCardState();
}

class _EventBigCardState extends State<EventBigCard> {
  Icon ic = Icon(Icons.favorite_border);
  bool flag = false;

  void iconChange() {
    setState(
      () {
        if (flag) {
          ic = Icon(Icons.favorite_border);
          flag = false;
        } else {
          ic = Icon(
            Icons.favorite,
            color: Colors.red,
          );
          flag = true;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EventScreen()),
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
                        child: Image.asset(
                          "assets/images/img3.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 2, top: 10),
                        child: Text(
                          'PARTY',
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, top: 5),
                        child: Text(
                          'My First Event',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 2, top: 10),
                        child: Text(
                          'Alexandria',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // SizedBox(width: 120),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: InkWell(
                          onTap: () {
                            iconChange();
                          },
                          child: ic,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '15 Mar 2023',
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
                  ),
                  Container(
                    height: 50,
                    child: VerticalDivider(
                        thickness: 0.5, color: Colors.grey.shade700),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          '21:00',
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
