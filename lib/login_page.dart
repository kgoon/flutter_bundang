import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final gapOfField = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _wrapPadding(Widget child) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: child,
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Awesome App',
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
            Padding(padding: EdgeInsets.all(45.0)),
            TextFormField(
              decoration: InputDecoration(hintText: 'email'),
            ),
            SizedBox(height: gapOfField),
            Padding(
              padding: EdgeInsets.all(2.0),
              child: TextFormField(
                decoration: InputDecoration(hintText: 'password'),
              ),
            ),
            SizedBox(height: gapOfField),
            Container(
              padding: EdgeInsets.all(5.0),
              alignment: Alignment(-1.0, -1.0),
              child: Text(
                'Protect your idea, use at least 10 chracters',
                style: TextStyle(fontSize: 12.0, color: Colors.black38),
              ),
            ),
            _wrapPadding(
              TextFormField(
                decoration: InputDecoration(hintText: 'password confirm'),
              ),
            ),
            _wrapPadding(
              TextFormField(
                decoration: InputDecoration(hintText: 'birthday'),
              ),
            ),
            Container(
              padding: EdgeInsets.all(2.0),
              alignment: Alignment(-1.0, -1.0),
              child: Text('I accept the terms of service',
                  style: TextStyle(fontSize: 12.0, color: Colors.black38)),
            ),
            SizedBox(
              width: double.infinity,
              child: RaisedButton(
                  child: Text('Sign up'),
                  textColor: Colors.white,
                  color: Colors.blueAccent,
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
