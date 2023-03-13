// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ProfileCards extends StatelessWidget {
  final txt;
  final icon;
  final Color color;
  final Color colorShade;

  const ProfileCards({
    super.key,
    required this.txt,
    required this.icon,
    this.color = Colors.transparent,
    this.colorShade = Colors.transparent,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          padding: EdgeInsets.fromLTRB(5, 5, 20, 5),
          color: Colors.grey.shade200,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      // alignment: Alignment.centerRight,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        txt,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      color: colorShade,
                      child: Icon(
                        icon,
                        color: color,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
