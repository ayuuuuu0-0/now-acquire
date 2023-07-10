import 'package:flutter/material.dart';
import '../Investor LoginScreen/rectangular_password_field.dart';
import '../Investor SignUpScreen/signin_page.dart';
import '../Widgets/Already_Registered.dart';
import '../Widgets/rectangular_button.dart';
import '../Widgets/rectangular_input_field.dart';

class StartupLogin extends StatefulWidget {
  const StartupLogin({super.key});

  @override
  State<StartupLogin> createState() => _StartupLoginState();
}

class _StartupLoginState extends State<StartupLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isNotValidate = false;

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
            const Text('Startup Login',
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
              },
              errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            const SizedBox(height: 4),
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
