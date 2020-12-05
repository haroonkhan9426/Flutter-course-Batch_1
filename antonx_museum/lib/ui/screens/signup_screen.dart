import 'package:antonx_museum/core/services/auth_service.dart';
import 'package:antonx_museum/ui/custom_widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'home_screen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ModalProgressHUD(
        inAsyncCall: showProgress,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.fromLTRB(20, 150, 30, 50),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  /// Login message
                  Text(
                    'Sing Up to Use AntonX Museum',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Email TextField
                  CustomTextField(
                    label: 'Email Address',
                    onChange: (val) {
                      email = val;
//                  print('email Field: $val');
                    },
                    validator: (String val) {
                      if (val == null || val.length < 1) {
                        return 'Please enter a valid email address';
                      }
                    },
                  ),
                  SizedBox(height: 30),

                  /// Password TextField
                  CustomTextField(
                    isPassword: true,
                    label: 'Password',
                    onChange: (val) {
                      password = val;
//                  print('Password Field: $val');
                    },
                    validator: (String val) {
                      if (val == null || val.length < 6) {
                        return 'Minimum password length is 6';
                      }
                    },
                  ),

                  SizedBox(height: 20),

                  /// Forgot password text link
                  Text(
                    'SignUp',
                    style: TextStyle(
                      color: Colors.blueAccent,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  Spacer(),

                  /// Signup Button
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'SingUp',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          showProgress = true;
                        });
                        final isAccountCreated = await AuthService()
                            .createAccountWithEmail(email, password);
                        setState(() {
                          showProgress = false;
                        });
                        if (isAccountCreated) {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()),
                              (route) => false);
                        } else {
                          showDialog(
                            context: context,
                            child: AlertDialog(
                              title: Text('Account creation Failed'),
                              content: Text(
                                  'Please check if you have entered correct email and password'),
                            ),
                          );
                        }
                      }

                      print('Login Button Pressed');
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
