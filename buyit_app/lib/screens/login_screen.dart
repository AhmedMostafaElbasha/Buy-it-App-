import 'package:buyit_app/providers/model_hud.dart';
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
                      final modelHud = Provider.of<ModelHud>(context, listen: false);
                      modelHud.changeIsLoading(true);

                      if (_globalKey.currentState.validate()) {
                        // Do Something
                        try {
                          _globalKey.currentState.save();
                          final result = await _auth.signIn(
                              email: _email, password: _password);
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

                      modelHud.changeIsLoading(false);
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
            ],
          ),
        ),
      ),
    );
  }
}
