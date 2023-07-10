import 'package:flutter/material.dart';
import 'package:now_acquire_app/Widgets/text_field_container.dart';

class RectangularInputField extends StatelessWidget {

  final String labelText;
  final ValueChanged<String> onChanged;
  final String? errorText;

  RectangularInputField({
    required this.errorText,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        cursorColor: Colors.indigoAccent,
        decoration: InputDecoration(
          errorStyle: TextStyle(color: Colors.red),
          errorText: errorText,
          labelText: labelText , labelStyle: TextStyle(color: Color(0xFF441256)),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, color: Color(0xFF441256),
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              width: 1, color: Colors.grey
            ),
          ),
        ),
      ),
    );
  }
}
