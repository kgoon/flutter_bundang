import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';
import 'package:flutter_bundang/theme/i_set_text.dart';
import '../components/i_margin.dart';
import '../components/i_user_button.dart';
import '../components/i_user_textfield.dart';
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
                  style: ISetText.display4,
                ),
              ),
              Text(
                'E-mail',
                style: ISetText.subTitle,
              ),
              iHeightSmall,
              IUserTextField(
                obscureText: false,
                prefixIcon: Icon(
                  Icons.email,
                  color: mainColor_900,
                ),
                hintText: 'E-mail을 입력해주세요',
              ),
              iHeightLarge,
              Text(
                'Passwords',
                style: ISetText.subTitle,
              ),
              iHeightSmall,
              IUserTextField(
                obscureText: true,
                prefixIcon: Icon(
                  Icons.lock,
                  color: mainColor_900,
                ),
                hintText: '비밀번호를 입력해주세요',
              ),
              iHeightLarge,
              IUserTextField(
                obscureText: true,
                prefixIcon: Icon(
                  Icons.lock,
                  color: mainColor_900,
                ),
                hintText: '확인을 위해 다시 입력해주세요',
              ),
              iHeightLarge,
              Text(
                'Birthday',
                style: ISetText.subTitle,
              ),
              iHeightSmall,
              IUserTextField(
                obscureText: false,
                prefixIcon: Icon(
                  Icons.date_range,
                  color: mainColor_900,
                ),
                hintText: '생년월일을 입력해주세요',
              ),
              iHeightLarge,
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
                          style:
                          ISetText.subTitle.copyWith(color: fontColor_500),
                        ),
                        TextSpan(
                          text: '  약관보기',
                          style: ISetText.subTitle,
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              iHeightLarge,
              IUserButton(
                  child: Text(
                    '가입하기',
                    style: ISetText.title,
                  ),
                  pressedButton: () {
                    Navigator.push(
                      // OnPressed 함수에 넣기
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
