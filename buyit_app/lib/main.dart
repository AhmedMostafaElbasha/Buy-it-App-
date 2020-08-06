import 'package:buyit_app/providers/admin_mode.dart';
import 'package:buyit_app/providers/model_hud.dart';
import 'package:buyit_app/screens/admin_home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/signup_screen.dart';
import './screens/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ModelHud>(
          create: (context) => ModelHud(),
        ),
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
      ],
      child: MaterialApp(
        initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          SignupScreen.routeName: (context) => SignupScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          AdminHomeScreen.routeName: (context) => AdminHomeScreen(),
        },
      ),
    );
  }
}
