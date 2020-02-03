import 'package:flutter/material.dart';
import 'package:tenplus/form/signup_form.dart';

class SignupPage extends StatelessWidget {

  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.only(bottom: 40),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.display1,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: SignupForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


