import 'package:flutter/material.dart';
import '../Widgets/text_field_container.dart';

class RectangularPasswordField extends StatelessWidget {

  final ValueChanged<String> onChanged;
  final String? errorText;

  RectangularPasswordField({
    required this.onChanged,
    required this.errorText,
  });

bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: obscureText,
        onChanged: onChanged,
        cursorColor: Colors.indigoAccent,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          errorText: errorText,
          hintText: ' Password *',
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
        ),
      ),
    );
  }
}
