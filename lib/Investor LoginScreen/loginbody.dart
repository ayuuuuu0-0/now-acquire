import 'package:flutter/material.dart';
import 'package:now_acquire_app/Investor LoginScreen/rectangular_password_field.dart';
import 'package:now_acquire_app/Investor SignUpScreen/signin_page.dart';
import 'package:now_acquire_app/Widgets/Already_Registered.dart';
import 'package:now_acquire_app/Widgets/rectangular_button.dart';
import 'package:now_acquire_app/Widgets/rectangular_input_field.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isNotValidate = false;

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // void _login() async {
  //   showDialog(
  //       context: context,
  //       builder: (_) {
  //         return LoadingAlertDialog(message: 'Please wait',);
  //       }
  //   );

    //   User? currentUser;
    //   await _auth.signInWithEmailAndPassword(
    //     email: _emailController.text.trim(),
    //     password: _passwordController.text.trim(),
    //   ).then((auth) {
    //     currentUser = auth.user;
    //   }).catchError((error) {
    //     Navigator.pop(context);
    //     showDialog(context: context, builder: (context) {
    //       return ErrorAlertDialog(Message: error.message.toString());
    //     });
    //   });
    //   if(currentUser != null){
    //     //ignore: use_build_context_synchronously
    //     Navigator.pop(context);
    //     //ignore: use_build_Context_synchronously
    //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    //   }
    //   else {
    //     print('error');
    //   }
    // }


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
                height: size.height * 0.32,
              ),
              SizedBox(height: size.height * 0.02,),
              const Text('Investor Login',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.03,),
              RectangularInputField(
                labelText: ' Username *',
                onChanged: (value) {
                  _emailController.text = value;
                },
                errorText: _isNotValidate ? "Enter proper info" : null,
              ),
              const SizedBox(height: 6,),
              RectangularPasswordField(
                onChanged: (value) {
                  _passwordController.text = value;
                }, errorText: _isNotValidate ? "Enter proper info" : null,
              ),
              const SizedBox(height: 4),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: TextButton(
              //     onPressed: () {
              //       Navigator.push(context, MaterialPageRoute(
              //           builder: (context) => ForgotPassword()));
              //     },
              //     child: const Text('Forgot Password?',
              //       style: TextStyle(
              //         color: Colors.black,
              //         fontSize: 19,
              //         fontStyle: FontStyle.italic,
              //       ),
              //     ),
              //   ),
              // ),
              RectangularButton(
                text: 'LOG-IN',
                press: () {},),

              SizedBox(height: size.height * 0.03,),
              AlreadyHaveAnAccount(
                login: true,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      );
    }
  }

