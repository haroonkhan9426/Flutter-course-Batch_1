import 'package:antonx_calculator/core/constants/colors.dart';
import 'package:flutter/material.dart';

class GreenRoundedButton extends StatelessWidget {
  final value;
  final Function onPressed;

  GreenRoundedButton({this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 170,
        width: 70,
        decoration: BoxDecoration(
            color: Colors.lightGreenAccent,
            borderRadius: BorderRadius.circular(40)),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
