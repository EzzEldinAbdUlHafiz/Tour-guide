// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutguide/Globals.dart';
import 'package:tutguide/Screens/components/myTextField.dart';
import 'package:tutguide/Screens/mainScreen.dart';
import 'package:http/http.dart' as http;
import '../models/User.dart';
import 'dart:convert';

// ignore: must_be_immutable
class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final password2 = TextEditingController();
  // final phoneNumber = TextEditingController();

  // late Future<User> futureUser;
  // bool flag = false;

  // Future<void> userRegister() async {
  //   http.Response response = await http.post(
  //     Uri.parse('${Globals().uri}/user/register'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'name': name.text,
  //       'email': email.text,
  //       'password': password.text,
  //     }),
  //   );
  //   if (response.statusCode == 200) {
  //     if (response.body.isEmpty) {
  //       debugPrint('Response is empty');
  //     } else {
  //       debugPrint(response.body);
  //       flag = true;
  //     }
  //   } else {
  //     debugPrint('Error: ${response.statusCode}');
  //   }
  // }

  void signUserUp() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (password.text == password2.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text,
          password: password.text,
        );
      } else {
        showErrorMessage("Passwords don't match");
      }
      Navigator.pop(context);
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.redAccent,
          title: Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  // logo & name
                  SizedBox(height: 50),
                  Image.asset(
                    "assets/images/pharaoh.png",
                    scale: 3,
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

                  MyTextField(
                    controller: email,
                    obscureText: false,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter an email';
                      } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                          .hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),

                  MyTextField(
                    controller: password,
                    obscureText: true,
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                        return 'Password must contain at least one letter';
                      } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      }
                      return null; // return null if the password is valid
                    },
                  ),

                  MyTextField(
                    controller: password2,
                    obscureText: true,
                    hintText: 'Confirm password',
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Password is required';
                      } else if (value.length < 8) {
                        return 'Password must be at least 8 characters long';
                      } else if (!RegExp(r'[a-zA-Z]').hasMatch(value)) {
                        return 'Password must contain at least one letter';
                      } else if (!RegExp(r'[0-9]').hasMatch(value)) {
                        return 'Password must contain at least one number';
                      }
                      return null; // return null if the password is valid
                    },
                  ),

                  // MyTextField(
                  //   controller: phoneNumber,
                  //   obscureText: false,
                  //   hintText: 'Enter your phone number',
                  //   keyboardType: TextInputType.phone,
                  // ),

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
                      if (_formKey.currentState!.validate()) {
                        signUserUp();
                      }
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
                  // Padding(
                  //   padding: EdgeInsets.symmetric(horizontal: 25),
                  //   child: Row(
                  //     children: [
                  //       Expanded(
                  //         child: Divider(
                  //           thickness: 0.5,
                  //           color: Colors.grey.shade400,
                  //         ),
                  //       ),
                  //       Padding(
                  //         padding: EdgeInsets.symmetric(horizontal: 10),
                  //         child: Text(
                  //           'Sign up with',
                  //           style: TextStyle(color: Colors.grey.shade700),
                  //         ),
                  //       ),
                  //       Expanded(
                  //         child: Divider(
                  //           thickness: 0.5,
                  //           color: Colors.grey.shade400,
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(height: 20),

                  // // google facebook
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     Container(
                  //       padding: EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Image.asset(
                  //         "assets/images/google.png",
                  //         scale: 15,
                  //       ),
                  //     ),
                  //     SizedBox(width: 25),
                  //     Container(
                  //       padding: EdgeInsets.all(20),
                  //       decoration: BoxDecoration(
                  //         border: Border.all(color: Colors.grey),
                  //         borderRadius: BorderRadius.circular(15),
                  //       ),
                  //       child: Image.asset(
                  //         "assets/images/facebook.png",
                  //         scale: 15,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
