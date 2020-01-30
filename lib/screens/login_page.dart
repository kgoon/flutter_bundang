import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/screens/signup_page.dart';
import 'package:flutter_bundang/ui_setting/i_set_color.dart';
import 'package:flutter_bundang/ui_setting/i_set_icon.dart';
import 'package:flutter_bundang/ui_setting/i_set_text.dart';
import '../components/i_margin.dart';
import '../components/i_user_button.dart';
import '../components/i_user_textfield.dart';
import 'home_view.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
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
                  style: ISetText.display4,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: IUserButton(
                      child: iFacebook,
                    ),
                  ),
                  iWidthLarge,
                  Expanded(
                    child: IUserButton(child: iGoogle),
                  ),
                ],
              ),
              iHeightLarge,

              Text(
                'E-mail',
                style: ISetText.subTitle,
              ),
              iHeightSmall,
              IUserTextField(
                obscureText: false,
                prefixIcon: Icon(Icons.email, color: mainColor_900,),
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
                prefixIcon: Icon(Icons.lock, color: mainColor_900,),
                hintText: '비밀번호를 입력해주세요',
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                alignment: Alignment.centerRight,
                child: InkWell(
                  child: Text(
                    '비밀번호를 잊어버리셨나요?',
                    style: ISetText.subTitle.copyWith(color: mainColor_500),
                  ),
                ),
              ),
              iHeightLarge,

              IUserButton(
                  child: Text(
                    '로그인',
                    style: ISetText.title,
                  ),
                  pressedButton: () {
                    Navigator.push(
                      // OnPressed 함수에 넣기
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    );
                  }),
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
                        style: ISetText.subTitle.copyWith(color: mainColor_500),
                      ),
                      TextSpan(
                        text: '   Sign Up Now',
                        style: ISetText.subTitle,
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
