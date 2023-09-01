import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:now_acquire_app/Startup%20Register/small_Rectangular_input.dart';
import 'package:now_acquire_app/Startup%20Register/startup_register_url.dart';
import 'package:now_acquire_app/Startup_Login/startupapi.dart';
import '../Investor LoginScreen/Login_Screen.dart';
import '../Investor SignUpScreen/TermsandConditions.dart';
import '../Startup_Login/startuplogin_page.dart';
import '../Startup_Login/startuploginbody.dart';
import '../WelcomeScreen/welcome_screen.dart';
import '../Widgets/Already_Registered.dart';
import '../Widgets/rectangular_button.dart';
import 'longrectangularinput.dart';
import 'package:http/http.dart' as http;

class StartupSignIn extends StatefulWidget {
   //late var investor;
   StartupSignIn({/*required this.investor,*/ super.key});

  @override
  State<StartupSignIn> createState() => _StartupSignInState();
}

class _StartupSignInState extends State<StartupSignIn> {

  //late var InvDetails = widget.investor;
  _StartupSignInState() {
    _selectedVal = _productSizesList[0];
  }

  final signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _companynameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _videolinkController = TextEditingController();
  final TextEditingController _industryController = TextEditingController();
  final TextEditingController _agentnameController = TextEditingController();
  final TextEditingController _registrationNumberController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();
  final _productSizesList = [
    'Website',
    'Social Media',
    'Conferences',
    'Newspaper',
    'Now Acquire Agent'
  ];
  String? _selectedVal = '';
  bool _isNotValidate = false;
  bool? value = false;
  TextEditingController dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  String? _emailErrorText;
  String? _userNameErrorText;

  selectDate(BuildContext context) async {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width,
        screenHeight = MediaQuery
            .of(context)
            .size
            .height;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  Future <void> startupRegisterUser(BuildContext context) async {
    if (_companynameController.text.isNotEmpty
        && _contactNumberController.text.isNotEmpty
        && _usernameController.text.isNotEmpty
        && _emailController.text.isNotEmpty
        && _addressController.text.isNotEmpty
        && _industryController.text.isNotEmpty
        && _selectedVal
            .toString()
            .isNotEmpty
        && _registrationNumberController.text.isNotEmpty
        && _passwordController.text.isNotEmpty
        && _videolinkController.text.isNotEmpty
        && _agentnameController.text.isNotEmpty
    ) {
      var registrationBody = {
        "name": _companynameController.text,
        "userName": _usernameController.text,
        "password": _passwordController.text,
        "registrationNo": _registrationNumberController.text,
        "email": _emailController.text,
        "contactNo": _contactNumberController.text,
        "address": _addressController.text,
        "industry": _industryController.text,
        "dateofIncorp": dateController.text,
        "modeOfReach": _selectedVal,
        "agentName": _agentnameController.text,
        "videoLink": _videolinkController.text,
      };

      //print(registrationBody);

      var response = await http.post(Uri.parse(startupRegister),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(registrationBody),
      );
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);

      void showConfirmationDialog(BuildContext context, String username) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Thank you for signing up!\n Your Username is $username'),
              content: Text('Welcome to nowAcquire'),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF441256)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => WelcomeScreen(/*investor: InvDetails,*/)));
                  },
                  child: Text('Welcome Screen'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF441256)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => StartupLoginScreen(/*investor: InvDetails,*/)));
                  },
                  child: Text('Login Screen'),
                ),
              ],
            );
          },
        );
      }

      if (response.statusCode == 200) {
        showConfirmationDialog(context, _usernameController.text);
      }
      else {
        if (response.statusCode == 500) {
          setState(() {
            _emailErrorText = 'Enter Proper Email';
          });
        } else {
          if(response.statusCode == 400){
            setState(() {
              _userNameErrorText = 'UserName already in use';
            });
          }
          final snackBar = SnackBar(
            backgroundColor: Colors.red,
            content: Text('$jsonResponse'),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
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
            Image.asset(
              'assets/images/logo192.png', height: screenHeight * 0.3,),
            SizedBox(height: screenHeight * 0.02,),
            const Text('Startup Signup', style: TextStyle(
              fontSize: 30,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,),
            ),
            SizedBox(height: screenHeight * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: smallRectangularInput(
                    labelText: 'Company Name *',
                    onChanged: (value) {
                      _companynameController.text = value;
                    }, errorText: _isNotValidate ? "Enter proper info" : null,
                  ),
                ),
                SizedBox(width: 12.0,),
                Flexible(
                  child: smallRectangularInput(
                    labelText: 'Username *',
                    onChanged: (value) {
                      _usernameController.text = value;
                    }, errorText: _isNotValidate ? "Enter proper info" : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: smallRectangularInput(
                    labelText: 'Email Address *',
                    onChanged: (value) {
                      _emailController.text = value;
                    }, errorText: _isNotValidate ? "Enter proper info" : _emailErrorText,
                  ),
                ),
                SizedBox(width: 12.0,),
                Flexible(
                  child: smallRectangularInput(
                    labelText: 'Password *',
                    onChanged: (value) {
                      _passwordController.text = value;
                    }, errorText: _isNotValidate ? "Enter proper info" : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: smallRectangularInput(
                    labelText: 'Registration No. *',
                    onChanged: (value) {
                      _registrationNumberController.text = value;
                    }, errorText: _isNotValidate ? "Enter proper info" : null,
                  ),
                ),
                SizedBox(width: 12.0,),
                Flexible(
                  child: smallRectangularInput(
                    labelText: 'Contact Number *',
                    onChanged: (value) {
                      _contactNumberController.text = value;
                    }, errorText: _isNotValidate ? "Enter proper info" : null,
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02,),
            LongRectangularInput(
              labelText: 'Address *',
              onChanged: (value) {
                _addressController.text = value;
              }, errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            SizedBox(height: screenHeight * 0.02,),
            LongRectangularInput(
              labelText: 'Video Link *',
              onChanged: (value) {
                _videolinkController.text = value;
              }, errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            SizedBox(height: screenHeight * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Flexible(
                  child: SizedBox(
                    width: 135,
                    child: TextField(
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.red),
                        errorText: _isNotValidate ? "Enter proper info" : null,
                        labelText: 'Industry *',
                        labelStyle: const TextStyle(color: Color(0xFF441256)),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, color: Color(0xFF441256),
                          ),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1, color: Colors.grey,
                          ),
                        ),
                        contentPadding: const EdgeInsets.all(18),
                      ),
                      onChanged: (value) {
                        _industryController.text = value;
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8.0,),
                SizedBox(
                  width: 222,
                  child: TextField(
                    controller: dateController,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.red),
                      errorText: _isNotValidate ? "Enter proper info" : null,
                      contentPadding: EdgeInsets.all(18),
                      labelText: 'Date of Incopration',
                      labelStyle: TextStyle(color: Color(0xFF441256)),
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
                      suffixIcon: GestureDetector(
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              //get today's date
                              firstDate: DateTime(2000),
                              //DateTime.now() - not to allow to choose before today.
                              lastDate: DateTime(2101)
                          );

                          if (pickedDate != null) {
                            print(
                                pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                            String formattedDate = DateFormat('yyyy-MM-dd')
                                .format(
                                pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                            print(
                                formattedDate); //formatted date output using intl package =>  2022-07-04
                            //You can format date as per your need

                            setState(() {
                              dateController.text =
                                  formattedDate; //set formatted date to TextField value.
                            });
                          } else {
                            print("Date is not selected");
                          }
                        },
                        child: Icon(Icons.calendar_today, color: Color(
                            0xFF441256),),
                      ), //icon of text field
                    ),
                    readOnly: true,
                    // when true user cannot edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          //get today's date
                          firstDate: DateTime(2000),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime(2101)
                      );

                      if (pickedDate != null) {
                        print(
                            pickedDate); //get the picked date in the format => 2022-07-04 00:00:00.000
                        String formattedDate = DateFormat('yyyy-MM-dd')
                            .format(
                            pickedDate); // format date in required form here we use yyyy-MM-dd that means time is removed
                        print(
                            formattedDate); //formatted date output using intl package =>  2022-07-04
                        //You can format date as per your need

                        setState(() {
                          dateController.text =
                              formattedDate; //set formatted date to TextField value.
                        });
                      } else {
                        print("Date is not selected");
                      }
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: SizedBox(
                    width: 360,
                    child: DropdownButtonFormField(
                      value: _selectedVal,
                      items: _productSizesList.map((e) =>
                          DropdownMenuItem(child: Text(e), value: e,)).toList(),
                      onChanged: (val) {
                        _selectedVal = val as String;
                      },
                      decoration: InputDecoration(
                        errorStyle: const TextStyle(color: Colors.red),
                        errorText: _isNotValidate ? "Enter proper info" : null,
                        labelText: 'How did you know about NowAcquire',
                        labelStyle: TextStyle(color: Color(0xFF441256)),
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
                        contentPadding: EdgeInsets.all(18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02,),
            LongRectangularInput(
              labelText: 'Agent Name *',
              onChanged: (value) {
                _agentnameController.text = value;
              }, errorText: _isNotValidate ? "Enter proper info" : null,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Checkbox(
                  value: this.value,
                  onChanged: (bool? value) {
                    setState(() {
                      this.value = value;
                    });
                  },
                ),
                const Text('I Agree to the '),
                InkWell(
                    child: Text('Terms and Conditions.',
                      style: TextStyle(color: Colors.indigoAccent),),
                    onTap: () {
                      showDialog<String>(
                          context: context,
                          builder: (BuildContext context) =>
                              TermsandConditions());
                    }
                ),
              ],
            ),
            RectangularButton(
              text: 'SIGN UP',
              press: () {
                startupRegisterUser(context);
              },
            ),
            SizedBox(height: screenHeight * 0.03,),
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

