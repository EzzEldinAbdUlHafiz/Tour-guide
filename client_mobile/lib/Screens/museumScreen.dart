// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/artifactScreen.dart';
import 'package:tutguide/models/Museum.dart';

class MuseumScreen extends StatefulWidget {
  final Museum museum;
  const MuseumScreen({super.key, required this.museum});

  @override
  State<MuseumScreen> createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(13),
          ),
        ),
        title: Text(widget.museum.name),
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(widget.museum.image),
                const SizedBox(height: 15.0),
                const Text(
                  "Description:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 140,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                      widget.museum.description,
                      style: const TextStyle(fontSize: 17),
                    ),
                  ),
                ),
                Text(
                  'Location Address: ${widget.museum.address}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    height: 1.5,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: widget.museum.artifacts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300)),
                    child: ListTile(
                      leading: Image.asset(
                        "assets/images/artifact.png",
                        width: 50,
                        height: 50,
                      ),
                      title: Text(widget.museum.artifacts[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ArtifactScreen(
                              name: widget.museum.artifacts[index],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
