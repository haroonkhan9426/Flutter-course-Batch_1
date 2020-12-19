import 'package:antonx_museum/core/models/museum.dart';
import 'package:antonx_museum/core/services/custom_database_services.dart';
import 'package:antonx_museum/core/services/firebase_database_services.dart';
import 'package:antonx_museum/ui/custom_widgets/custom_text_field.dart';
import 'package:antonx_museum/ui/screens/home/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';

class AddMuseumScreen extends StatefulWidget {
  @override
  _AddMuseumScreenState createState() => _AddMuseumScreenState();
}

class _AddMuseumScreenState extends State<AddMuseumScreen> {
  final _formKey = GlobalKey<FormState>();
  Museum museum = Museum();
  bool showProgressHud = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ModalProgressHUD(
        inAsyncCall: showProgressHud,
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
                    'Add Museum',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  /// Email TextField
                  CustomTextField(
                    label: 'Title',
                    onChange: (val) {
                      museum.title = val;
                    },
                    validator: (String val) {},
                  ),
                  SizedBox(height: 30),

                  /// Password TextField
                  CustomTextField(
                    label: 'Address',
                    onChange: (val) {
                      museum.address = val;
                    },
                    validator: (String val) {},
                  ),
                  SizedBox(height: 20),

                  CustomTextField(
                    label: 'Img Url',
                    onChange: (val) {
                      museum.imgUrl = val;
                    },
                    validator: (String val) {},
                  ),

                  SizedBox(height: 20),

                  /// Forgot password text link
                  Spacer(),

                  /// Login Button
                  FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Colors.red[100],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        'ADD',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    onPressed: () async {
//                      setState(() {
//                        showProgressHud = true;
//                      });
//                      await CustomDatabaseServices().addMuseum(museum);
                      Provider.of<HomeProvider>(context, listen: false)
                          .addMuseum(museum);
//                      setState(() {
//                        showProgressHud = false;
//                      });
                      Navigator.pop(context);
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
