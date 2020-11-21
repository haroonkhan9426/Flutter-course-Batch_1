import 'package:flutter/material.dart';

import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      Navigator.pushAndRemoveUntil(
          context, MaterialPageRoute(builder: (context) => LoginScreen()), (
          route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('@splashScreen');
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Center(
        child: Text(
          'Splash Screen',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
