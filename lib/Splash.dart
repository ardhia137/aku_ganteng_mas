// // import 'package:flutter/material.dart';
// // import 'package:login/Home.dart';
// // import 'dart:async';


// // class Splash extends StatefulWidget {
// //   @override
// //   _SplashState createState() => _SplashState();
// // }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() { 
//     super.initState();
//     mulai();
//   }
//     mulai()async{
//       var duration = const Duration(seconds: 2);
//       return Timer(duration, (){
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(builder:(_){
//             return LoginPage();
//           })
//         );
//       });
//     }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//           child:  Image.asset('images/flutter.png',width: 200,height: 100),
//         ),
//     );
//   }
// }