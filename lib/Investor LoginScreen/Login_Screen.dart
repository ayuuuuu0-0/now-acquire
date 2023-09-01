import 'package:flutter/material.dart';
import 'loginbody.dart';

class LoginScreen extends StatefulWidget {
  //late var investor;
  LoginScreen({/*required this.investor,*/ super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    //late var InvDetails = widget.investor;
    return Scaffold(
      body: LoginBody(),
    );
  }
}

