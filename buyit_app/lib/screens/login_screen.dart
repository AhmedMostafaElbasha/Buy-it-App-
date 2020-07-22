import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: height * 0.2,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Image(image: AssetImage('images/icons/buyicon.png')),
                  Positioned(
                    bottom: 0,
                    child: Text(
                      'Buy it',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              onPressed: () {},
              color: Colors.black,
              child: Text(
                'Login',
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
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
