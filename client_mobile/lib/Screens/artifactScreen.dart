// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/Screens/components/imageDialog.dart';
import 'package:tutguide/Screens/components/video_player.dart';
import 'package:tutguide/models/Artifact.dart';
import 'package:tutguide/storage.dart';

class ArtifactScreen extends StatefulWidget {
  final String? name;
  const ArtifactScreen({super.key, required this.name});

  @override
  State<ArtifactScreen> createState() => _ArtifactScreenState();
}

class _ArtifactScreenState extends State<ArtifactScreen> {
  double h = 0, w = 0, topPadding = 0;
  final Storage storage = Storage();

  Future<Artifact> getArtifact() async {
    final response = await http
        .get(Uri.parse('${Globals().uri}/artifact/name/${widget.name!}'));
    if (response.statusCode == 200) {
      return Artifact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Artifact");
    }
  }

  @override
  Widget build(BuildContext context) {
    topPadding = MediaQuery.of(context).padding.top;
    h = MediaQuery.of(context).size.height - topPadding;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.keyboard_arrow_left_rounded,
                  ),
                ),
              ),
              FutureBuilder(
                future: getArtifact(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              enlargeCenterPage: true,
                              enableInfiniteScroll: false,
                              autoPlay: true,
                            ),
                            items: snapshot.data!.images
                                .map(
                                  (element) => ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: FutureBuilder(
                                      future: storage.downloadURL(element),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                                ConnectionState.done &&
                                            snapshot.hasData) {
                                          return GestureDetector(
                                            child: Image.network(
                                              snapshot.data!,
                                              fit: BoxFit.cover,
                                            ),
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (_) => ImageDialog(
                                                  link: snapshot.data!,
                                                ),
                                              );
                                            },
                                          );
                                        }
                                        return Container();
                                      },
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                snapshot.data!.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          const Text(
                            "Description:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: 200,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Text(
                                snapshot.data!.description,
                                style: const TextStyle(fontSize: 17),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Video:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: FutureBuilder(
                              future: storage.downloadURL(snapshot.data!.video),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                        ConnectionState.done &&
                                    snapshot.hasData) {
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) => Video_player(
                                          videoUrl: snapshot.data!,
                                        ),
                                      );
                                    },
                                    child: Icon(
                                      Icons.play_circle_outline,
                                      size: 100,
                                    ),
                                  );
                                } else {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 150, vertical: 50),
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
