import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/models/user_model.dart';
import 'package:flutter_bundang/src/screens/home_page.dart';
import 'package:flutter_bundang/src/screens/root_page.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final apiBloc = Provider.of<ApiProvider>(context).bloc;
    return StreamBuilder<User>(
        stream: apiBloc.userSubject,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.data == null) {
              return RootPage();
            } else {
              print(snapshot.data.userToken);
              print(snapshot.data.userName);
              print(snapshot.data.userEmail);
              print(snapshot.data.userImageUrl);
              return HomePage();
            }
          } else {
            return Scaffold();
          }
        });
  }
}
