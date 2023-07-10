import 'package:flutter/material.dart';
import 'package:now_acquire_app/Startup%20Register/startupsignin_page.dart';
import 'package:now_acquire_app/Startup_Login/startuplogin_page.dart';
import 'package:now_acquire_app/Startup_Login/startuploginbody.dart';
import '../Widgets/rectangular_button.dart';
import 'package:now_acquire_app/Investor LoginScreen/Login_Screen.dart';
import 'package:now_acquire_app/Investor SignUpScreen/signin_page.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1,),
            Image.asset('assets/images/logo192.png',
              height: size.height * 0.40,
            ),
            SizedBox(height: size.height * 0.02,),
            const Text('NowAcquire',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF441256),
                fontStyle: FontStyle.italic,
                fontFamily: "Poppins",
              ),
            ),
            SizedBox(height: size.height * 0.05,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangularButton(
                    text: 'INVESTOR \n   LOGIN',
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) => const LoginScreen()));
                    }
                ),
                RectangularButton(
                  text: 'STARTUP \n  LOGIN',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => const StartupLoginScreen()));
                  },
                ),
              ],
            ),
            SizedBox(height: size.height * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RectangularButton(
                    text: 'INVESTOR \n REGISTER',
                    press: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder:
                              (context) => const SignUpScreen()));
                    }
                ),
                RectangularButton(
                  text: 'STARTUP \nREGISTER',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => const StartupRegisterScreen()));
                  },
                ),
              ],
            ),
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child:
            //     Container(
            //       width: 500,
            //       height: 20,
            //       decoration: BoxDecoration(
            //         color: Color(0xFFCEC2E3),
            //       ),
            //       child: Center(
            //         child: Text(
            //           'Get your First Equity Free*. Limitations Apply* \n'
            //               'Right Reserved',
            //         ),
            //       ),
            //     ),
            // ),
          ],
        ),
      ),
    );
  }
}
