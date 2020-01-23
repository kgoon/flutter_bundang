import 'package:auto_size_text/auto_size_text.dart';
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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 2.3,
                    child: AutoSizeText(
                      'Awesome App',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 70.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 7,
                  ),
                  Column(
                    children: <Widget>[
                      Form(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'email',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'password',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'password confirm',
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: 'birthday',
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Transform.scale(
                              scale: 1.04,
                              child: CheckboxListTile(
                                value: _ifChecked,
                                onChanged: (bool value) {
                                  setState(() {
                                    _ifChecked = value;
                                  });
                                },
                                title: Text('I accept the terms of service'),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2.4,
                        height: MediaQuery.of(context).size.height / 14,
                        child: RaisedButton(
                          onPressed: () {},
                          color: Colors.teal,
                          textColor: Colors.white,
                          child: Container(
                            width: MediaQuery.of(context).size.width / 7.7,
                            child: AutoSizeText(
                              'SignUp'.toUpperCase(),
                              style: TextStyle(fontSize: 60),
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
