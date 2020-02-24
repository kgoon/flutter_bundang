import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/root_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    return RootPage();
  }
}
