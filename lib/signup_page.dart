import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/ui_setting/setColor.dart';
import 'package:flutter_bundang/ui_setting/setText.dart';


class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isChecked = false;

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
                  vertical: 80,
                ),
                child: AutoSizeText(
                  'Sign Up',
                  maxLines: 1,
                  style: SetText.display4,
                ),
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
                    hintText: '비밀번호',
                  ),
                ),
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
                    hintText: '비밀번호 확인',
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                'Birthday',
                style: SetText.subtitle.copyWith(color: Color(0xFF4D70A6)),
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
                      Icons.date_range,
                      color: mainColor_900,
                    ),
                    hintText: '생년월일',
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                children: <Widget>[
                  Checkbox(
                    activeColor: mainColor_900,
                    checkColor: mainColor_50,
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() => isChecked = value);
                    },
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: '서비스 약관에 동의합니다.',
                          style: SetText.subtitle,
                        ),
                        TextSpan(
                          text: ' 약관보기',
                          style:
                          SetText.subtitle.copyWith(color: fontColor_900),
                        ),
                      ]),
                    ),
                  ),
                ],
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
                    "가입하기",
                    style: SetText.title,
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