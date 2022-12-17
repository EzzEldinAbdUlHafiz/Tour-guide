import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavBarWidget2 extends StatefulWidget {
  const NavBarWidget2({super.key});

  @override
  State<NavBarWidget2> createState() => _NavBarWidget2State();
}

class _NavBarWidget2State extends State<NavBarWidget2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        color: Colors.deepPurple,
        height: 60,
        // onTap: ,
        items: [
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.settings,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
