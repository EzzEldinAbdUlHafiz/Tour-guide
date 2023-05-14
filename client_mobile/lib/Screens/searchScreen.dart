// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/Screens/artifactScreen.dart';
import 'package:tutguide/models/Artifact.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:tutguide/storage.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  static List<Artifact> artifactList = [];
  late List<Artifact> displayArtifact = [];
  final Storage storage = Storage();

  Future<void> getArtifacts() async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/artifact/getArtifacts'));
    if (response.statusCode == 200) {
      artifactList = Artifact.fromJsonList(jsonDecode(response.body));
      // return Museum.fromJsonList(jsonDecode(response.body));
      setState(() {
        displayArtifact = List.from(artifactList);
      });
    } else {
      throw Exception("Failed to load Artifacts");
    }
  }

  void updateList(String value) {
    setState(
      () {
        displayArtifact = artifactList
            .where((element) =>
                element.name.toLowerCase().contains(value.toLowerCase()) ||
                element.museum.toLowerCase().contains(value.toLowerCase()))
            .toList();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getArtifacts();
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
              "Search for an Artifact",
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
                hintText: "eg: throne of tutankhamun",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.black,
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: displayArtifact.isEmpty
                  ? Center(
                      child: artifactList.isNotEmpty
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
                      itemCount: displayArtifact.length,
                      itemBuilder: (context, index) => ListTile(
                        contentPadding: EdgeInsets.all(10),
                        title: Text(
                          displayArtifact[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          displayArtifact[index].museum,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        leading: FutureBuilder(
                          future: storage
                              .downloadURL(displayArtifact[index].images[0]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return Image.network(
                                snapshot.data!,
                                fit: BoxFit.cover,
                                loadingBuilder: (_, child, progress) {
                                  if (progress == null) {
                                    return child;
                                  }
                                  return CircularProgressIndicator();
                                },
                              );
                            }
                            return CircularProgressIndicator();
                          },
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ArtifactScreen(
                                name: displayArtifact[index].name,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}



// FadeInImage(
//                           placeholder: AssetImage('assets/images/loading.gif'),
//                           image: NetworkImage(
//                             displayArtifact[index].images[0],
//                           ),
//                           fit: BoxFit.scaleDown,
//                           width: 60,
//                           height: 60,
//                         ),