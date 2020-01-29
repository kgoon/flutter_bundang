import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/signup_page.dart';
import 'package:flutter_bundang/ui_setting/setColor.dart';
import 'package:flutter_bundang/ui_setting/setText.dart';
import 'package:flutter_bundang/widgets/fieldmargin.dart';
import 'package:flutter_bundang/widgets/my_button.dart';
import 'package:flutter_bundang/widgets/my_textfield.dart';
import 'package:flutter_bundang/widgets/social_button.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_view.dart';

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
                    hintText: '패스워드를 입력하세요.',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    '비밀번호를 잊어버리셨나요?',
                    style: SetText.subtitle.copyWith(color: fontColor_900),
                  ),
                ),
              ),
              MyButton(
                myButtonText: '로그인', pressedButton: Navigator.push( // OnPressed 함수에 넣기
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()),
                  ),
              ),
              InkWell(
                onTap: () => Navigator.push(
                  // OnPressed 함수에 넣기
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
