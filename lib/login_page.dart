import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thememaker/home_view.dart';
import 'package:flutter_thememaker/signup_page.dart';
import 'package:flutter_thememaker/ui_setting/setText.dart';
import 'package:flutter_thememaker/ui_setting/setColor.dart';
import 'package:flutter_thememaker/widgets/social_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf1f3f6),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 60,
                ),
                child: AutoSizeText(
                  'Log in',
                  maxLines: 1,
                  style: SetText.display4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: socialButton(FontAwesomeIcons.facebookF),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: socialButton(FontAwesomeIcons.google),
                  ),
                ],
              ),
              Text(
                'E-mail',
                style: SetText.subtitle.copyWith(color: Color(0xFF4D70A6)),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Color(0xFFF1F3F6),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Color(0xFF4D70A6).withOpacity(0.2),
                          blurRadius: 16),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Color.fromARGB(170, 255, 255, 255),
                          blurRadius: 10),
                    ]),
                child: TextField(
                  cursorColor: mainColor_900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 16),
                    prefixIcon: Icon(
                      Icons.email,
                      color: mainColor_900,
                    ),
                    hintText: "E-mail을 입력하세요.",
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Passwords',
                style: SetText.subtitle.copyWith(color: Color(0xFF4D70A6)),
              ),
              SizedBox(
                height: 4,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                    color: Color(0xFFF1F3F6),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(10, 10),
                          color: Color(0xFF4D70A6).withOpacity(0.2),
                          blurRadius: 16),
                      BoxShadow(
                          offset: Offset(-10, -10),
                          color: Color.fromARGB(170, 255, 255, 255),
                          blurRadius: 10),
                    ]),
                child: TextField(
                  obscureText: true,
                  cursorColor: mainColor_900,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 16),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: mainColor_900,
                    ),
                    hintText: '패스워드를 입력하세요.',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 8),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text('비밀번호를 잊어버리셨나요?', style: SetText.subtitle.copyWith(color: fontColor_900),),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => HomeView()));
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  height: 60,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                      color: Color(0xFFF1F3F6),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(10, 10),
                            color: Color(0xFF4D70A6).withOpacity(0.2),
                            blurRadius: 16),
                        BoxShadow(
                            offset: Offset(-10, -10),
                            color: Color.fromARGB(170, 255, 255, 255),
                            blurRadius: 10),
                      ]),
                  child: Text(
                    "로그인",
                    style: SetText.title,
                  ),
                ),
              ),
              InkWell(
                onTap: () => Navigator.push( // OnPressed 함수에 넣기
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                ),
                child: Center(
                  child: RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: '계정이 없으신가요?',
                        style: SetText.subtitle,
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: SetText.subtitle.copyWith(color: fontColor_900),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
