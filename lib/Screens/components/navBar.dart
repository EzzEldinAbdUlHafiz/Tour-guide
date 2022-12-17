import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../homeScreen.dart';
import '../searchScreen.dart';
import '../page3.dart';
import '../profileScreen.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  int screenIndex = 0;

  void selectScreen(int index) {
    setState(() {
      screenIndex = index;
    });
  }

  final List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    Settings(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        color: Colors.deepPurple,
        height: 60,
        index: screenIndex,
        onTap: selectScreen,
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
          Icon(
            Icons.account_circle,
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
