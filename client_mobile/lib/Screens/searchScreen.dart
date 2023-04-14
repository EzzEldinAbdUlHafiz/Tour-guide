// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/models/Museum.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<Museum> museumsList = [];
  late List<Museum> displayMuseums = [];

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
              element.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    getMuseums();
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
              child: displayMuseums.isEmpty
                  ? Center(
                      child: museumsList.isNotEmpty
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
                      itemCount: displayMuseums.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(
                          displayMuseums[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          displayMuseums[index].city,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        leading: Image.asset(
                          displayMuseums[index].image,
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
