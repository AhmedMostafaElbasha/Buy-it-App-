import 'package:buyit_app/providers/admin_mode.dart';
import 'package:buyit_app/providers/model_hud.dart';
import 'package:buyit_app/screens/admin_home_screen.dart';
import 'package:buyit_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:buyit_app/widgets/app_logo.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import '../widgets/custom_textfield.dart';
import './signup_screen.dart';
import 'package:buyit_app/services/auth.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  String _email, _password;
  final _auth = Auth();
  bool isAdmin = false;
  final _adminPassword = 'Admin1234*';
  final _adminEmail = 'buyit.admin1@gmail.com';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kMainColor,
      body: ModalProgressHUD(
        inAsyncCall: Provider.of<ModelHud>(context).isLoading,
        child: Form(
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
                onClick: (value) {
                  _email = value;
                },
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextField(
                hint: 'Enter your password.',
                icon: Icons.lock,
                onClick: (value) {
                  _password = value;
                },
              ),
              SizedBox(
                height: height * 0.05,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 120),
                child: Builder(
                  builder: (context) => FlatButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () async {
                      _validate(context);
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                child: Center(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AdminMode>(context, listen: false)
                                .changeIsAdmin(true);
                          },
                          child: Text(
                            'I\'m an admin',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? kMainColor
                                  : Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Provider.of<AdminMode>(context, listen: false)
                                .changeIsAdmin(false);
                          },
                          child: Text(
                            'I\'m a user',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Provider.of<AdminMode>(context).isAdmin
                                  ? Colors.white
                                  : kMainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _validate(BuildContext context) async {
    final modelHud = Provider.of<ModelHud>(context, listen: false);
    final adminMode = Provider.of<AdminMode>(context, listen: false);

    modelHud.changeIsLoading(true);

    if (_globalKey.currentState.validate()) {
      _globalKey.currentState.save();

      if (adminMode.isAdmin) {
        if (_password == _adminPassword) {
          try {
            await _auth.signIn(email: _email, password: _password);
            modelHud.changeIsLoading(false);
            Navigator.of(context).pushNamed(AdminHomeScreen.routeName);
          } catch (e) {
            modelHud.changeIsLoading(false);
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(e.message),
              ),
            );
          }
        } else {
          modelHud.changeIsLoading(false);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content:
                  Text('Login failed. You\'re not authorized as an admin.'),
            ),
          );
        }
      } else {
        try {
          await _auth.signIn(email: _email, password: _password);
          modelHud.changeIsLoading(false);
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        } catch (e) {
          modelHud.changeIsLoading(false);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(e.message),
            ),
          );
        }
      }
    }

    modelHud.changeIsLoading(false);
  }
}
