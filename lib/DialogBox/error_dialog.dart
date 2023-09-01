import 'package:flutter/material.dart';
import 'package:now_acquire_app/Startup%20Register/startupsigninbody.dart';
import 'package:now_acquire_app/WelcomeScreen/welcome_screen.dart';

class ErrorAlertDialog extends StatelessWidget {

  final String Message;
  const ErrorAlertDialog({required this.Message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Text(Message),
      actions: [
        ElevatedButton(onPressed: (){
          // Navigator.pushReplacement
          //   (context, MaterialPageRoute(
          //     builder: (context) => ,)));
        }, child: const
        Center(child: Text('Try again'),))
      ],
    );
  }
}
