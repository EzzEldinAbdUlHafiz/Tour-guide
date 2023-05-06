// ignore_for_file: prefer_const_constructors
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/models/Artifact.dart';

class ArtifactScreen extends StatefulWidget {
  final String? name;
  const ArtifactScreen({super.key, required this.name});

  @override
  State<ArtifactScreen> createState() => _ArtifactScreenState();
}

class _ArtifactScreenState extends State<ArtifactScreen> {
  Future<Artifact> getArtifact() async {
    final response =
        await http.get(Uri.parse('${Globals().uri}/artifact/${widget.name!}'));
    if (response.statusCode == 200) {
      return Artifact.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to load Artifact");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(13),
          ),
        ),
        title: Text(widget.name!),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: FutureBuilder(
          future: getArtifact(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 450,
                            child: Row(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: snapshot.data!.images.length,
                                  itemBuilder: (context, index) {
                                    return Image.network(
                                      snapshot.data!.images[index],
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        const Text(
                          "Description:",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 140,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              snapshot.data!.description,
                              style: const TextStyle(fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
