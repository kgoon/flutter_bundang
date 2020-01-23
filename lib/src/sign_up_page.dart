import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _ifChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'email',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'password',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'password confirm',
                    ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'birthday',
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Checkbox(
                        value: _ifChecked,
                        onChanged: (bool value) {
                          setState(() {
                            _ifChecked = value;
                          });
                        },
                      ),
                      Text('I accept the terms of service'),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
