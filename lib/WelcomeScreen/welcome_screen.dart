import 'package:flutter/material.dart';
import 'welcomebody.dart';

class WelcomeScreen extends StatefulWidget {
  //late var investor;
  WelcomeScreen({/*required this.investor,*/ super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    //late var InvDetails = widget.investor;
    return Scaffold(
      body: WelcomeBody(/*investor: InvDetails,*/),
    );
  }
}

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//     body: WelcomeBody(),
//     );
//   }
// }
