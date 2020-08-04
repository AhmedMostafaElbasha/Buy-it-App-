import 'package:buyit_app/providers/model_hud.dart';
import 'package:buyit_app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'package:buyit_app/constants.dart';
import 'package:buyit_app/widgets/app_logo.dart';
import 'package:buyit_app/widgets/custom_textfield.dart';
import 'package:buyit_app/services/auth.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = 'SignupScreen';
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
                  icon: Icons.perm_identity,
                  hint: 'Enter your name.',
                  onClick: (value) {},
                ),
                SizedBox(
                  height: height * 0.02,
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
                        final modalHud = Provider.of<ModelHud>(context, listen: false);
                        modalHud.changeIsLoading(true);
                        if (_globalKey.currentState.validate()) {
                          // Do Something
                          _globalKey.currentState.save();
                          try {
                            final authResult = await _auth.signUp(
                                email: _email, password: _password);
                            modalHud.changeIsLoading(false);
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          } on PlatformException catch (e) {
                            modalHud.changeIsLoading(false);
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(e.message),
                            ));
                          }
                        }
                        modalHud.changeIsLoading(false);
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
                        Navigator.of(context).pushNamed(LoginScreen.routeName);
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
        ),
      );
  }
}
