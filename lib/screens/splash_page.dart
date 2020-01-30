import 'package:flutter/material.dart';
import 'package:flutter_bundang/screens/onboard_page.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';
import 'package:flutter_bundang/theme/i_set_text.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: OnBoardPage(),
        title: Text('분양앱에 오신걸 환영합니다.', style: ISetText.display1,),
        image: Image.network('https://seeklogo.net/wp-content/uploads/2017/04/New-Google-Earth-logo.png'),
        backgroundColor: backgroundColor,
        styleTextUnderTheLoader: TextStyle(),
        photoSize: 100.0,
        loaderColor: mainColor_900
    );
  }
}
