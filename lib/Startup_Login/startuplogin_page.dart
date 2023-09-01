import 'package:flutter/material.dart';
import 'package:now_acquire_app/Startup_Login/startuploginbody.dart';

class StartupLoginScreen extends StatefulWidget {
  //late var investor;
  StartupLoginScreen({/*required this.investor,*/ super.key});

  @override
  State<StartupLoginScreen> createState() => _StartupLoginScreenState();
}

class _StartupLoginScreenState extends State<StartupLoginScreen> {
  @override
  Widget build(BuildContext context) {
    //late var InvDetails = widget.investor;
    return Scaffold(
      body: StartupLogin(/*investor: InvDetails,*/),
    );
  }
}

// class StartupLoginScreen extends StatelessWidget {
//   const StartupLoginScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: StartupLogin(),
//     );
//   }
// }