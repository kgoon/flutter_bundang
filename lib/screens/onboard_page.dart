import 'package:flutter/material.dart';
import 'package:flutter_bundang/screens/login_page.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';



class OnBoardPage extends StatefulWidget {
  @override
  _OnBoardPageState createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Excellent",
        description: "앱 개발중",
        pathImage: "https://seeklogo.net/wp-content/uploads/2017/04/New-Google-Earth-logo.png",
        backgroundColor: mainColor_900,
      ),
    );
    slides.add(
      new Slide(
        title: "Awesome",
        description: "앱 개발중",
        pathImage: "https://seeklogo.net/wp-content/uploads/2017/04/New-Google-Earth-logo.png",
        backgroundColor: mainColor_900,
      ),
    );
    slides.add(
      new Slide(
        title: "Perfect",
        description: "앱 개발중",
        pathImage: "https://seeklogo.net/wp-content/uploads/2017/04/New-Google-Earth-logo.png",
        backgroundColor: mainColor_900,
      ),
    );
}

  void onDonePress() {
    // Do what you want
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      slides: this.slides,
      onDonePress: (){
        Navigator.push( // OnPressed 함수에 넣기
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
      },
    );
  }
}
