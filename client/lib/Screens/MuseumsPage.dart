import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MuseumPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String museumName = "National Museum of Natural History";
    final String museumImage = "assets/images/img3.jpg";
    final String museumInfo = "The National Museum of Natural History is a natural history museum administered by the Smithsonian Institution, located on the National Mall in Washington, D.C., United States. With free admission and open doors 364 days a year, it is the third most visited museum in the world.";
    final String museumAddress = "10th St. & Constitution Ave. NW, Washington, DC 20560";
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
      {        'name': 'Ocean Hall',
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
              style: TextStyle(
                fontWeight: FontWeight.bold,
                height: 1.5
              ),
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
                        builder: (context) => ArtifactsPage(
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

class ArtifactsPage extends StatelessWidget {
  final String name;
  final List<String> dummyImages = [
    'assets/images/img1.jpg',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
  ];

  ArtifactsPage({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Stack(
                children: [
                  PageView(
                    children: dummyImages.map((image) {
                      return Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Positioned(
                    top: 32.0,
                    left: 16.0,
                    child: IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    bottom: 32.0,
                    left: 16.0,
                    child: Text(
                      name,
                      style: GoogleFonts.roboto(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.white,
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at nunc velit. Aenean volutpat, odio ut molestie aliquam, quam risus gravida felis, sit amet dapibus ipsum sapien in libero. Curabitur quis consequat metus, ut finibus risus. Sed vel lectus quis eros tristique mollis in eu libero. Nulla facilisi. Sed vehicula dolor nisi, vel tincidunt enim pharetra ut. Donec vitae erat in purus lacinia aliquet. Proin vel ligula a justo viverra posuere. Curabitur pharetra urna ut consequat efficitur. Sed et gravida mauris. Nam sit amet malesuada est, ut rhoncus felis. In vulputate euismod turpis eu rhoncus. Nulla malesuada quam sapien, nec bibendum augue blandit ut.',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


// class ArtifactsPage extends StatelessWidget {
//   final String name;
//   final String image;
//
//   ArtifactsPage({required this.name, required this.image});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(name),
//       ),
//       body: Center(
//         child: Image.asset(image),
//       ),
//     );
//   }
// }
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Museum Page Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MuseumPage(),
    );
  }
}
class ArtifactDetailPage extends StatelessWidget {
  final String artifactName;

  const ArtifactDetailPage({required this.artifactName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(artifactName),
      ),
      body: Center(
        child: Text('This is the $artifactName detail page.'),
      ),
    );
  }
}