import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/home_page.dart';
import 'package:flutter_bundang/src/screens/root_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context);
    if (auth.user != null) {
      return HomePage();
    } else
      return RootPage();
  }
}
