// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'components/navBar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBarWidget(),
    );
  }
}
