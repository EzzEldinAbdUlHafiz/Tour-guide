// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tutguide/models/Museum.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<Museum> dummyMuseums = [
    Museum(
      name: "aaa",
      city: "alex",
      image: "assets/images/img3.jpg",
    ),
    Museum(
      name: "b",
      city: "cairo",
      image: "assets/images/img4.jpg",
    ),
  ];

  List<Museum> displayMuseums = List.from(dummyMuseums);

  void updateList(String value) {
    setState(() {
      displayMuseums = dummyMuseums
          .where((element) =>
              element.name!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(15, 50, 15, 15),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   // backgroundColor: Colors.transparent,
        //   elevation: 0.0,
        // ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for a Museum",
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
                hintText: "eg: Grand Egyptian Museum",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: displayMuseums.length == 0
                  ? Center(
                      child: Text(
                        "No results found",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: displayMuseums.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(
                          displayMuseums[index].name!,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          displayMuseums[index].city!,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        leading: Image.asset(
                          displayMuseums[index].image!,
                          height: 60,
                          width: 60,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
