import 'package:flutter/material.dart';

class smallRectangularInput extends StatelessWidget {

  final String labelText;
  final ValueChanged<String> onChanged;
  final String? errorText;

  smallRectangularInput({
    required this.labelText,
    required this.onChanged,
    required this.errorText,

  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      child: TextField(
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          errorText: errorText,
          labelText: labelText,
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
        onChanged: onChanged,
      ),
    );
  }
}
