import 'package:buyit_app/providers/model_hud.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ModelHud>(
      create: (context) => ModelHud(),
      child: MaterialApp(
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
        },
      ),
    );
  }
}

