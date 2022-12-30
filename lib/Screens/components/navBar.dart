// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import '../events.dart';
import '../homeScreen.dart';
import '../searchScreen.dart';
import '../eventScreen.dart';
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
    Events(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[screenIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 500),
        color: Colors.amber,
        height: 50,
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
            Icons.event,
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
