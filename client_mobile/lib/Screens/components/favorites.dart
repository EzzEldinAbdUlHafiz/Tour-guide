// // ignore_for_file: prefer_const_literals_to_create_immutables
// // ignore_for_file: prefer_const_constructors
// import 'package:flutter/material.dart';
// import 'package:tutguide/Screens/eventScreen.dart';

// class Favorites extends StatelessWidget {
//   final String img;

//   Favorites({
//     required this.img,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(5.0),
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => EventScreen(),
//             ),
//           );
//         },
//         child: Container(
//           height: 100,
//           width: 100,
//           padding: EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: Colors.transparent,
//           ),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Image.asset(
//               img,
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
