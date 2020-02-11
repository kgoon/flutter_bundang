import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/models/sign_in_model.dart';
import 'package:flutter_bundang/src/screens/home_page.dart';
import 'package:flutter_bundang/src/screens/landing_page.dart';
import 'package:flutter_bundang/src/screens/login_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  final SignInModel model;

  SignUpPage({@required this.model});

  static Widget create(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context, listen: false);
    return ChangeNotifierProvider<SignInModel>(
      create: (context) => SignInModel(
        auth: auth,
      ),
      child: Consumer<SignInModel>(
        builder: (context, model, _) => SignUpPage(
          model: model,
        ),
      ),
    );
  }

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with CustomFormFieldWidget {
  bool _ifChecked = false;
  // DateTime _selectedDate;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInModel get model => widget.model;

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
                      child: emailInputField(context, emailController, model),
                    ),
                    wrapInputField(
                      passwordInputField(context, passwordController, model),
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
          builder: (context) => LoginPage.create(context),
        ));
  }

  Future<void> _submit() async {
    try {
      await model.submit();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => LandingPage(),
      ));
    } catch (e) {
      e.toString();
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
