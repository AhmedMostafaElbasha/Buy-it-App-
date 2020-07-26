import 'package:buyit_app/widgets/app_logo.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_textfield.dart';
import './signup_screen.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';
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
                  if(_globalKey.currentState.validate()) {
                    // Do Something
                  }
                },
                color: Colors.black,
                child: Text(
                  'Sign in',
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
                  'Don\'t have an account?  ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignupScreen.routeName);
                  },
                  child: Text(
                    'Sign up',
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
