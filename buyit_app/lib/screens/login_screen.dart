import 'package:flutter/material.dart';

import '../constants.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.2,
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
        ],
      ),
    );
  }
}
