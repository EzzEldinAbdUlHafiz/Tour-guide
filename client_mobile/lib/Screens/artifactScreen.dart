// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tutguide/Screens/components/videoPlayer.dart';

class ArtifactScreen extends StatelessWidget {
  final String? name;
  final List<String> dummyImages = [
    'assets/images/img1.jpg',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
    'assets/images/artifact.png',
  ];

  ArtifactScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
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
                      name!,
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
      ),
    );
  }
}

class ArtifactDetailPage extends StatelessWidget {
  final String artifactName;

  const ArtifactDetailPage({super.key, required this.artifactName});

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
