import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => new SignUpPagetState();
}

class SignUpPagetState extends State<SignUpPage> with TickerProviderStateMixin {
  TabController _controller;

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: <Widget>[
          TextField(
            autofocus: true,
          )
        ],
      ),
    );
  }
}
