import 'package:flutter/material.dart';

class AlreadyHaveAnAccount extends StatelessWidget {

  final bool login;
  final VoidCallback press;

  AlreadyHaveAnAccount({
    this.login = true,
    required this.press,
});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? 'Do not have an Account?' : 'Already have an Account',
          style: TextStyle(color:  Colors.black87, fontStyle: FontStyle.italic,
          ),
           ),
        GestureDetector(
           onTap: press,
          child: Text(
            login ? ' Sign Up' : ' Log In',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
