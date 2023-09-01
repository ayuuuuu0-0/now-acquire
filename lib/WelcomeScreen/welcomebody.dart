import 'package:flutter/material.dart';
import 'package:now_acquire_app/Startup%20Register/startupsignin_page.dart';
import 'package:now_acquire_app/Startup_Login/startuplogin_page.dart';
import 'package:now_acquire_app/Startup_Login/startuploginbody.dart';
import '../Widgets/rectangular_button.dart';
import 'package:now_acquire_app/Investor LoginScreen/Login_Screen.dart';
import 'package:now_acquire_app/Investor SignUpScreen/signin_page.dart';

class WelcomeBody extends StatefulWidget {
  //late var investor;
   WelcomeBody({/*required this.investor,*/ super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  @override
  Widget build(BuildContext context) {
    //late var InvDetails = widget.investor;
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
                              (context) => LoginScreen(/*investor: InvDetails,*/)));
                    }
                ),
                RectangularButton(
                  text: 'STARTUP \n  LOGIN',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => StartupLoginScreen(/*investor: InvDetails,*/)));
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
                              (context) => SignUpScreen(/*investor: InvDetails,*/)));
                    }
                ),
                RectangularButton(
                  text: 'STARTUP \nREGISTER',
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                            (context) => StartupRegisterScreen(/*investor: InvDetails,*/)));
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


// class WelcomeBody extends StatelessWidget {
//   late var investor;
//    WelcomeBody({required this.investor, super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//
//     Size size = MediaQuery
//         .of(context)
//         .size;
//     return Container(
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             SizedBox(height: size.height * 0.1,),
//             Image.asset('assets/images/logo192.png',
//               height: size.height * 0.40,
//             ),
//             SizedBox(height: size.height * 0.02,),
//             const Text('NowAcquire',
//               style: TextStyle(
//                 fontSize: 50.0,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF441256),
//                 fontStyle: FontStyle.italic,
//                 fontFamily: "Poppins",
//               ),
//             ),
//             SizedBox(height: size.height * 0.05,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RectangularButton(
//                     text: 'INVESTOR \n   LOGIN',
//                     press: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder:
//                               (context) => const LoginScreen()));
//                     }
//                 ),
//                 RectangularButton(
//                   text: 'STARTUP \n  LOGIN',
//                   press: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder:
//                             (context) => const StartupLoginScreen()));
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: size.height * 0.03,),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 RectangularButton(
//                     text: 'INVESTOR \n REGISTER',
//                     press: () {
//                       Navigator.push(context,
//                           MaterialPageRoute(builder:
//                               (context) => const SignUpScreen()));
//                     }
//                 ),
//                 RectangularButton(
//                   text: 'STARTUP \nREGISTER',
//                   press: () {
//                     Navigator.push(context,
//                         MaterialPageRoute(builder:
//                             (context) => StartupRegisterScreen(investor: InvDetails,)));
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
