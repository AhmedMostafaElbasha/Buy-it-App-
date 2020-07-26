import 'package:buyit_app/widgets/app_logo.dart';
import 'package:buyit_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import 'package:buyit_app/constants.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = 'SignupScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: kMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: <Widget>[
            AppLogo(height),
            SizedBox(
              height: height * 0.1,
            ),
            CustomTextField(
              icon: Icons.perm_identity,
              hint: 'Enter your name.',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              icon: Icons.email,
              hint: 'Enter your email.',
            ),
            SizedBox(
              height: height * 0.02,
            ),
            CustomTextField(
              hint: 'Enter your password.',
              icon: Icons.lock,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  if (_globalKey.currentState.validate()) {
                    // Do Something
                  }
                },
                color: Colors.black,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Do you have an account?  ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
