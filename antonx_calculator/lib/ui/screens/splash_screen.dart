import 'package:antonx_calculator/core/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'calculator_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CalculatorScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mainThemeColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// Rounded Container
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add, size: 30),
                        Icon(Icons.clear, size: 30),
                      ],
                    ),
                    Icon(Icons.minimize, size: 30),
                    Icon(Icons.minimize, size: 30),
                  ],
                ),
              ),
              SizedBox(height: 20),

              /// Calculator Text
              Text(
                'Calculator',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              )
            ],
          ),
        ));
  }
}
