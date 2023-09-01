import 'package:flutter/material.dart';
import '../Widgets/text_field_container.dart';

class RectangularPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String? errorText;

  RectangularPasswordField({
    required this.onChanged,
    required this.errorText,
  });

  @override
  _RectangularPasswordFieldState createState() =>
      _RectangularPasswordFieldState();
}

class _RectangularPasswordFieldState extends State<RectangularPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextFormField(
            obscureText: obscureText,
            onChanged: widget.onChanged,
            cursorColor: Colors.indigoAccent,
            decoration: InputDecoration(
              errorStyle: TextStyle(color: Colors.red),
              errorText: widget.errorText,
              hintText: 'Password *',
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Color(0xFF441256),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
