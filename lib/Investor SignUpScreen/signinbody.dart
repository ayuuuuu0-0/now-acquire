import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:now_acquire_app/Investor LoginScreen/Login_Screen.dart';
import 'package:now_acquire_app/Investor SignUpScreen/TermsandConditions.dart';
import 'package:now_acquire_app/Widgets/Already_Registered.dart';
import 'package:now_acquire_app/Widgets/rectangular_button.dart';
import 'package:now_acquire_app/Widgets/rectangular_input_field.dart';
import '../Investor LoginScreen/rectangular_password_field.dart';
import '../WelcomeScreen/welcome_screen.dart';
import 'user_model.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({Key? key}) : super(key: key);

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {

  bool _isLoading = false;

  final signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  bool _isNotValidate = false;
  bool? value = false;


  Future<void> registerUser(BuildContext context) async {
    if(_firstnameController.text.isNotEmpty
        && _lastnameController.text.isNotEmpty
        && _emailController.text.isNotEmpty
        && _passwordController.text.isNotEmpty
        && _phoneController.text.isNotEmpty
        && _userNameController.text.isNotEmpty){
      var regBody = {
        "firstName": _firstnameController.text,
        "lastName": _lastnameController.text,
        "email": _emailController.text,
        "password": _passwordController.text,
        "contactNo": _phoneController.text,
        "userName": _userNameController.text,
      };
      
      var response = await http.post(Uri.parse(registration),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(regBody),

      );
      print(response);

      var jsonResponse = json.decode(response.body);
      print(jsonResponse);

      void showConfirmationDialog(BuildContext context) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registration Successful'),
              content: Text('Thank you for signing up!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomeScreen()));
                  },
                  child: Text('Welcome Screen'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text('Login Screen'),
                ),
              ],
            );
          },
        );
      }

      if(response.statusCode == 200){
        showConfirmationDialog(context);
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
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width,
        screenHeight = MediaQuery
            .of(context)
            .size
            .height;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.02,),
            Image.asset('assets/images/logo192.png', height: screenHeight * 0.3,),
            SizedBox(height: screenHeight * 0.02,),
            const Text('Investor Signup', style: TextStyle(
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: screenHeight * 0.02,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Flexible(
              child: SizedBox(
                width: 140,
                child: TextField(
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.red),
                    errorText: _isNotValidate ? "Enter proper info" : null,
                    labelText: 'First Name*', labelStyle: TextStyle(color: Color(0xFF441256)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1, color: Color(0xFF441256),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1, color: Colors.grey,
                      ),
                    ),
                      contentPadding: EdgeInsets.all(15),
                  ),
                  onChanged: (value) {
                    _firstnameController.text = value;
                  },
                ),
              ),
            ),
            SizedBox(width: 5.0,),
            Flexible(
              child: SizedBox(
                width: 145,
                child: TextField(
                  decoration: InputDecoration(
                    errorStyle: TextStyle(color: Colors.red),
                    errorText: _isNotValidate ? "Enter proper info" : null,
                    labelText: 'Last Name*', labelStyle: TextStyle(color: Color(0xFF441256)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1, color: Color(0xFF441256),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1, color: Colors.grey,
                      ),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                  onChanged: (value) {
                    _lastnameController.text = value;
                  },
                ),
              ),
              ),
             ],
            ),
            SizedBox(height: screenHeight * 0.01,),
            RectangularInputField(
              labelText: 'Email *',
              onChanged: (value) {
                _emailController.text = value;
              },
              errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            RectangularInputField(
              labelText: 'Phone *',
              onChanged: (value) {
                _phoneController.text = value;
              },
                errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            RectangularPasswordField(
              onChanged: (value) {
                _passwordController.text = value;
              }, errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            RectangularInputField(
              labelText: 'UserName *',
              onChanged: (value) {
                _userNameController.text = value;
              },
              errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            //const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Checkbox(
                  value: this.value,
                  onChanged: (bool? value){
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
                const Text('I Agree to the '),
                InkWell(
                    child: Text('Terms and Conditions.', style: TextStyle(color: Colors.indigoAccent),),
                    onTap: (){
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => TermsandConditions());
                    }
                ),
              ],
            ),
            RectangularButton(
              text: 'SIGN UP',
              press: () {
                registerUser(context);
              },
            ),
            //SizedBox(height: screenHeight * 0.03,),
            AlreadyHaveAnAccount(
                login: false,
                press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
            ),
          ],
        ),
      ),
    );
  }
}
