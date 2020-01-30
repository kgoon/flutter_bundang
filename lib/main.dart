import 'package:flutter/material.dart';
import 'package:flutter_bundang/screens/home_view.dart';
import 'package:flutter_bundang/screens/onboard_page.dart';
import 'package:flutter_bundang/screens/signup_page.dart';
import 'package:flutter_bundang/screens/splash_page.dart';
import 'screens/login_page.dart';


void main() => runApp((MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/' : (context) => Splash(),
        '/onboard' : (context) => OnBoardPage(),
        '/login' : (context) => LoginPage(),
        '/signup' : (context) => SignUpPage(),
        '/homeview' : (context) => HomeView(),
      },
    );
  }
}



