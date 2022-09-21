// import 'package:flutter/material.dart';

// class RemoveString extends StatelessWidget {
//   const RemoveString({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Tooltip(
//                   message: "Close",
//                   decoration: BoxDecoration(
//                       color: Colors.grey[900],
//                       borderRadius: BorderRadius.circular(16)),
//                   child: IconButton(
//                     splashColor: Colors.grey,
//                     splashRadius: 24,
//                     icon: const Icon(Icons.close),
//                     color: Colors.green,
//                     iconSize: 24,
//                     onPressed: () {
//                       setState(() {
//                         try {
//                           userQuestion = userQuestion.substring(
//                               0, userQuestion.length - 1);
//                         } catch (e) {
//                           userAnswer = "";
//                         }
//                       });
//                     },
//                   ),
//                 ),
//   }
// }