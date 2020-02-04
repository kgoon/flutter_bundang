import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/home_page.dart';
import 'package:flutter_bundang/src/screens/login_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with CustomFormFieldWidget {
  bool _ifChecked = false;
  // DateTime _selectedDate;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get _email => emailController.text;
  String get _password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HeadingOneText(
                  title: 'Awesome App',
                ),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 80.0,
                      ),
                      child: emailInputField(context, emailController),
                    ),
                    wrapInputField(
                      passwordInputField(context, passwordController),
                    ),
                    // wrapInputField(
                    //   passwordInputField(context),
                    // ),
                    // wrapInputField(
                    //   birthdayInputField(
                    //     context: context,
                    //     selectedDate: _selectedDate,
                    //     onClick: this._onClickInputField,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Transform.scale(
                        scale: 1.06,
                        child: checkBoxField(
                          context: context,
                          ifChecked: _ifChecked,
                          onChecked: this._onClickCheckBoxField,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CustomButtonWidget(
                    onSubmit: _ifChecked ? _submit : null,
                    backgroundColor: Colors.teal,
                    title: 'SIGN UP',
                  ),
                ),
                wrapInputField(
                  CustomMaterialButton(
                    title: 'Already have account? Sign in',
                    onSubmit: _pushToLogin,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void _onClickInputField() {
  //   FocusScope.of(context).requestFocus(FocusNode());
  //   selectDate(context).then((onValue) {
  //     if (onValue != null) {
  //       setState(() {
  //         _selectedDate = onValue;
  //       });
  //     }
  //   });
  // }

  void _onClickCheckBoxField(bool value) {
    setState(() {
      _ifChecked = value;
    });
  }

  void _pushToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ));
  }

  void _submit() async {
    try {
      final auth = Provider.of<Auth>(context, listen: false);
      await auth.createUserWithEmail(_email, _password);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    } catch (e) {
      e.toString();
    }
  }
}
