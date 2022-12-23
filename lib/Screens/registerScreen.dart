// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/myTextField.dart';
import 'package:tutguide/Screens/mainScreen.dart';
import 'registerScreen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final email = TextEditingController();
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // logo & name
                SizedBox(height: 25),
                Image.asset(
                  "assets/images/pharaoh.png",
                  scale: 5,
                ),
                SizedBox(height: 20),
                Text(
                  'TUT-GUIDE',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
                SizedBox(height: 10),

                // welcome
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),

                // username
                MyTextField(
                  controller: name,
                  obscureText: false,
                  hintText: 'Enter your name',
                  keyboardType: TextInputType.name,
                ),

                MyTextField(
                  controller: email,
                  obscureText: false,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                ),

                MyTextField(
                    controller: password,
                    obscureText: true,
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword),

                MyTextField(
                  controller: phoneNumber,
                  obscureText: false,
                  hintText: 'Enter your phone number',
                  keyboardType: TextInputType.phone,
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent,
                    padding: EdgeInsets.fromLTRB(150, 25, 150, 25),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MainScreen()),
                    );
                  },
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Already Registered'),
                ),
                SizedBox(height: 10),
                // signin with
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Sign up with',
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                // google facebook
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/images/google.png",
                        scale: 15,
                      ),
                    ),
                    SizedBox(width: 25),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Image.asset(
                        "assets/images/facebook.png",
                        scale: 15,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
