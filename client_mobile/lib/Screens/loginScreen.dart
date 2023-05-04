// ignore_for_file: prefer_const_constructors, use_build_context_synchronously
// ignore_for_file: prefer_const_literals_to_create_immutables
// NUF ==> no user found
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutguide/Screens/components/myTextField.dart';
import 'registerScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  // bool flag = false;

  // Future<void> userLogin() async {
  //   final response = await http.post(
  //     Uri.parse('${Globals().uri}/user/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       'email': email.text,
  //       'password': password.text,
  //     }),
  //   );
  //   String responseBody = utf8.decode(response.bodyBytes);
  //   debugPrint(responseBody);
  //   if (response.statusCode == 200) {
  //     if (responseBody == "NUF") {
  //       debugPrint('Response is empty');
  //     } else {
  //       debugPrint('user found');
  //       flag = true;
  //     }
  //   } else {
  //     throw Exception("Failed to load Users");
  //   }
  // }

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
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
                    'Welcome back',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 10),

                  // username
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

                  // password
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

                  // forget password
                  // TextButton(
                  //   onPressed: () {},
                  //   child: Text('Forgot your password?'),
                  // ),
                  SizedBox(height: 10),

                  // signin button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amberAccent,
                      padding: EdgeInsets.fromLTRB(150, 25, 150, 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        signUserIn();
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  // register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen()),
                          );
                        },
                        child: Text('Register now'),
                      ),
                    ],
                  ),

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
                  //           'Sign in with',
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
