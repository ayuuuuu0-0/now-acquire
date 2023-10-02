import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:now_acquire_app/Investor LoginScreen/rectangular_password_field.dart';
import 'package:now_acquire_app/Investor SignUpScreen/signin_page.dart';
import 'package:now_acquire_app/Widgets/Already_Registered.dart';
import 'package:now_acquire_app/Widgets/rectangular_button.dart';
import 'package:now_acquire_app/Widgets/rectangular_input_field.dart';
import 'loginapi.dart';
import 'package:now_acquire_app/Investor HomeScreen/invhomescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBody extends StatefulWidget {
  LoginBody({ super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {


  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isNotValidate = false;

  Future<void> loginUser() async {
    if(_userNameController.text.isNotEmpty
        && _passwordController.text.isNotEmpty){
      var reqBody = {
        "userName": _userNameController.text,
        "password": _passwordController.text,
      };

      var response = await http.post(Uri.parse(login),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(reqBody),
      );
      print(response);

      var jsonResponse = json.decode(response.body);
      print(jsonResponse['user1']['_doc']);

      if(response.statusCode == 200){
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => InvhomeScreen(
              investor : jsonResponse['user1']['_doc'],
            )));
      }
      else {
        final snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text('$jsonResponse'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }else{
      setState(() {
        _isNotValidate = true;
      });
    }
  }


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
                  _userNameController.text = value;
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
              RectangularButton(
                text: 'LOG-IN',
                press: () {
                  loginUser();
                },),

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

