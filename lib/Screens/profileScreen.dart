// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/profileCards.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 40),
              child: Text(
                'Profile',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            'assets/images/pharaoh.png',
                            scale: 7,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Youssef Amr',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'youssefamr@mail.com',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        color: Colors.grey.shade200,
                        child: Icon(
                          Icons.keyboard_arrow_right_rounded,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40),
            ProfileCards(
              txt: 'Dark Mode',
              color: Colors.purple.shade900,
              colorShade: Colors.purple.shade100,
              icon: Icons.dark_mode_rounded,
            ),
            ProfileCards(
              txt: 'Help',
              color: Colors.orange,
              colorShade: Colors.orange.shade100,
              icon: Icons.help,
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: ProfileCards(
                txt: 'Log out',
                color: Colors.red,
                colorShade: Colors.red.shade100,
                icon: Icons.logout_rounded,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
