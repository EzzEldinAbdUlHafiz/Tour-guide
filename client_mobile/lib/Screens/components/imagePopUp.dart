import 'package:flutter/material.dart';

class ImagePopUp extends StatelessWidget {
  final String imageUrl;
  const ImagePopUp({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Dialog(
      child: Image.network(
        imageUrl,
        width: w,
        fit: BoxFit.cover,
      ),
    );
  }
}
