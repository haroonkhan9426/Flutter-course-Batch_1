import 'package:antonx_calculator/core/constants/colors.dart';
import 'package:flutter/material.dart';

class WhiteRoundedButton extends StatelessWidget {
  final value;
  final Function onPressed;

  WhiteRoundedButton({this.value, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w500,
              color: darkGreyBgColor,
            ),
          ),
        ),
      ),
    );
  }
}
