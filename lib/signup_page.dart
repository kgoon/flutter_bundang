import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/ui_setting/setColor.dart';
import 'package:flutter_bundang/ui_setting/setText.dart';
import 'package:flutter_bundang/widgets/fieldmargin.dart';
import 'package:flutter_bundang/widgets/my_button.dart';
import 'package:flutter_bundang/widgets/my_textfield.dart';

import 'home_view.dart';

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
              FieldMargin(),
              MyTextField(
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
              FieldMargin(),
              Text(
                'Passwords',
                style: SetText.subtitle.copyWith(color: Color(0xFF4D70A6)),
              ),
              FieldMargin(),
              MyTextField(
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
              MyTextField(
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
              FieldMargin(),
              Text(
                'Birthday',
                style: SetText.subtitle.copyWith(color: Color(0xFF4D70A6)),
              ),
              MyTextField(
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
              FieldMargin(),
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
              MyButton(
                  myButtonText: '가입하기', pressedButton: (){Navigator.push( // OnPressed 함수에 넣기
                context,
                MaterialPageRoute(builder: (context) => HomeView()),
              );}
              ),
            ],
          ),
        ),
      ),
    );
  }
}
