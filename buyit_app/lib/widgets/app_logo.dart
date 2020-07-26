import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final double screenHeight;

  AppLogo(this.screenHeight);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        height: screenHeight * 0.2,
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
    );

  }
}