import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final Function onChange;
  final Function validator;
  final bool isPassword;

  CustomTextField({
    @required this.label,
    this.onChange,
    this.validator,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          validator: validator,
          onChanged: onChange,
          obscureText: isPassword,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.grey, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
