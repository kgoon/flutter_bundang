import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/login_page.dart';
import 'package:flutter_bundang/src/screens/sign_up_page.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HeadingOneText(
              title: 'Awesome App',
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 80.0,
              ),
              child: CustomMaterialButton(
                title: 'Sign up for account',
                onSubmit: () {
                  _pushToSignUp(context);
                },
              ),
            ),
            CustomMaterialButton(
              title: 'Already have account? Sign in',
              onSubmit: () {
                _pushToLogin(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _pushToLogin(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage.create(context),
        ));
  }

  void _pushToSignUp(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SignUpPage.create(context),
        ));
  }
}
