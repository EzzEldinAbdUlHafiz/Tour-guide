// ignore_for_file: file_names
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/profileCards.dart';
import 'ProfileSettings.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final user = FirebaseAuth.instance.currentUser!;
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.fromLTRB(20, 50, 20, 10),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 40),
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
                      const Text(
                        'Youssef Amr',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        user.email!,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade500,
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileEditPage()),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        color: Colors.grey.shade200,
                        child: const Icon(
                          Icons.keyboard_arrow_right_rounded,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
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
                signUserOut();
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
