import 'package:flutter/material.dart';
import 'package:flutter_bundang/screens/login_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  Widget _getScreenId() {
    return LoginScreen();

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travel Monday',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8ECF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: _getScreenId(),
        routes: {
          //LoginScreen.id: (context) => LoginScreen(),
        }
    );
  }
}
