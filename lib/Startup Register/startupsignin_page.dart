import 'package:flutter/material.dart';
import 'package:now_acquire_app/Startup%20Register/startupsigninbody.dart';

class StartupRegisterScreen extends StatefulWidget {
  //late var investor;
  StartupRegisterScreen({/*required this.investor,*/ super.key});

  @override
  State<StartupRegisterScreen> createState() => _StartupRegisterScreenState();
}

class _StartupRegisterScreenState extends State<StartupRegisterScreen> {
  @override
  Widget build(BuildContext context) {
    //late var InvDetails = widget.investor;
    return  Scaffold(
       body: StartupSignIn(/*investor: InvDetails,*/),
     );
  }
}

// class StartupRegisterScreen extends StatelessWidget {
//   late var investor;
//    StartupRegisterScreen({required this.investor, super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     late var InvDetails = widget.investor;
//     return  Scaffold(
//       body: StartupSignIn(investor: InvDetails,),
//     );
//   }
// }
