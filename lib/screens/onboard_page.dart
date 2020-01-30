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
        description: "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        pathImage: "images/photo_eraser.png",
        backgroundColor: mainColor_900,
      ),
    );
    slides.add(
      new Slide(
        title: "Awesome",
        description: "Ye indulgence unreserved connection alteration appearance",
        pathImage: "images/photo_pencil.png",
        backgroundColor: mainColor_900,
      ),
    );
    slides.add(
      new Slide(
        title: "Perfect",
        description:
        "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        pathImage: "images/photo_ruler.png",
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
