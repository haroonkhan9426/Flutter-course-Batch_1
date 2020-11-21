import 'package:antonx_calculator/core/constants/colors.dart';
import 'package:flutter/material.dart';

class GreyRoundedButton extends StatelessWidget {
  final value;
  final Function onPressed;

  GreyRoundedButton({this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: mainThemeColor,
          shape: BoxShape.circle,
        ),
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
