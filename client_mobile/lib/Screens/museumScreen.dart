// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/artifactScreen.dart';
import 'package:tutguide/models/Museum.dart';
import 'package:tutguide/storage.dart';

class MuseumScreen extends StatefulWidget {
  final Museum museum;
  const MuseumScreen({super.key, required this.museum});

  @override
  State<MuseumScreen> createState() => _MuseumScreenState();
}

class _MuseumScreenState extends State<MuseumScreen> {
  final Storage storage = Storage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder(
                  future: storage.downloadURL(widget.museum.image),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      return Image.network(snapshot.data!);
                    }
                    return Container();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    widget.museum.name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    "Description:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SizedBox(
                    height: 140,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Text(
                        widget.museum.description,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(
                    'Location Address: ${widget.museum.address}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: Text(
                    "Artifacts:",
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.museum.artifacts.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300)),
                        child: FutureBuilder(
                          future: storage.downloadURL(
                              widget.museum.artifacts[index].images[0]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return ListTile(
                                leading: Image.network(
                                  snapshot.data!,
                                  width: 50,
                                  height: 50,
                                ),
                                title:
                                    Text(widget.museum.artifacts[index].name),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ArtifactScreen(
                                        name:
                                            widget.museum.artifacts[index].name,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            return Container();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
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
          ],
        ),
      ),
    );
  }
}
