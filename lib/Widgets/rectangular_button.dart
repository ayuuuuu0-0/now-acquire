import 'package:flutter/material.dart';

class RectangularButton extends StatelessWidget {
  final String? text;
  final VoidCallback press;
  final textColor;

  RectangularButton({
    required this.text,
    required this.press,
    this.textColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical:10,horizontal: 10),
      width: size.width * 0.40,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF441256),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            ),
            onPressed: press,
            child: Text(
              text!,
              style: TextStyle(
                color: textColor,
                fontSize: 20.0,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
            ),
          )
      ),
    );
  }
}
