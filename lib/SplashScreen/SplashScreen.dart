import 'dart:async';
import 'package:flutter/material.dart';
import 'package:now_acquire_app/SplashScreen/rotateimage.dart';
import '../WelcomeScreen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  //late var investor;
  SplashScreen({/*required this.investor,*/ super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //late var InvDetails = widget.investor;

  startTimer() {
    Timer(const Duration(seconds: 4), () async {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen(/*investor: InvDetails,*/)));
      }
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startTimer();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                RotatingImage(),
              const SizedBox(height: 10.0,),
              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Center(
                  child: Text(" NowAcquire",
                    style: TextStyle(
                      fontSize: 40.0,
                      color: Color(0xFF441256),
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: "Varela",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
