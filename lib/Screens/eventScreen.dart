// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/eventCard.dart';

class EventScreen extends StatelessWidget {
  double h = 0, w = 0, topPadding = 0;
  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    h = MediaQuery.of(context).size.height - topPadding;
    w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Stack(
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
                  color: Colors.white,
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  height: h * 0.45,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    // borderRadius: BorderRadius.only(
                    //   bottomRight: Radius.circular(75),
                    // ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(75),
                    ),
                    child: Image.asset(
                      "assets/images/img1.jpg",
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Container(
                  height: h * 0.55,
                  width: w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // borderRadius: BorderRadius.only(
                    //   topLeft: Radius.circular(50),
                    // ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Event name',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Center(
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  width: 80,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Alexandria',
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
                                    top: 8,
                                    bottom: 8,
                                  ),
                                  width: 100,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '15 Mar 2023',
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
                                  width: 80,
                                  alignment: Alignment.center,
                                  child: Text(
                                    '21:00',
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
                        Text(
                          'Pictures',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 200,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                EventCard('assets/images/img4.jpg'),
                                EventCard('assets/images/img4.jpg'),
                                EventCard('assets/images/img4.jpg'),
                                EventCard('assets/images/img4.jpg'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
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
            ),
          ],
        ),
      ),
    );
  }
}
