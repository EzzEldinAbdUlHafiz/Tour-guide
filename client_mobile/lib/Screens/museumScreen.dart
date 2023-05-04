import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutguide/Screens/artifactScreen.dart';

class MuseumScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String museumName = "National Museum of Natural History";
    final String museumImage = "assets/images/img3.jpg";
    final String museumInfo =
        "The National Museum of Natural History is a natural history museum administered by the Smithsonian Institution, located on the National Mall in Washington, D.C., United States. With free admission and open doors 364 days a year, it is the third most visited museum in the world.";
    final String museumAddress =
        "10th St. & Constitution Ave. NW, Washington, DC 20560";
    final List<Map<String, dynamic>> artifacts = [
      {
        'name': 'Hope Diamond',
        'image': 'assets/images/artifact.png',
      },
      {
        'name': 'Hall of Mammals',
        'image': 'assets/images/artifact.png',
      },
      {
        'name': 'Butterfly Pavilion',
        'image': 'assets/images/artifact.png',
      },
      {
        'name': 'Ocean Hall',
        'image': 'assets/images/artifact.png',
      },
      {
        'name': 'Dinosaurs',
        'image': 'assets/images/artifact.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(museumName),
      ),
      body: Column(
        children: [
          // Museum Image and Information Section
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(museumImage),
                SizedBox(height: 16.0),
                Text(museumInfo),
                Text(
                  'Location Address: $museumAddress',
                  style: TextStyle(fontWeight: FontWeight.bold, height: 1.5),
                ),
              ],
            ),
          ),

          // Artifacts List Section
          Expanded(
            child: ListView.builder(
              itemCount: artifacts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    artifacts[index]['image'],
                    width: 50,
                    height: 50,
                  ),
                  title: Text(artifacts[index]['name']),
                  onTap: () {
                    // Navigate to artifact details page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ArtifactScreen(
                          name: artifacts[index]['name'],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // Museum Location Map Section
        ],
      ),
    );
  }
}
