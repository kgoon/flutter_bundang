import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/root_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthFromCustom>(context, listen: false);
    return RootPage();
    // return StreamBuilder<User>(
    //   stream: auth.onAuthStateChanged,
    //   builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
    //     if (snapshot.connectionState == ConnectionState.active) {
    //       User user = snapshot.data;
    //       if (user == null) {
    //         return RootPage();
    //       } else {
    //         return HomePage();
    //       }
    //     } else {
    //       return Scaffold(
    //         body: Center(
    //           child: CircularProgressIndicator(),
    //         ),
    //       );
    //     }
    //   },
    // );
  }
}
