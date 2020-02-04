import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/home_page.dart';
import 'package:flutter_bundang/src/screens/sign_up_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget with CustomFormFieldWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String get _email => emailController.text;
  String get _password => passwordController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(
            30.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HeadingOneText(
                  title: 'Awesome App',
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.only(top: 80.0),
                          child: emailInputField(context, emailController)),
                      wrapInputField(
                        passwordInputField(context, passwordController),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: CustomButtonWidget(
                    backgroundColor: Colors.teal,
                    title: 'SIGN IN',
                    onSubmit: () => _login(context),
                  ),
                ),
                wrapInputField(
                  CustomMaterialButton(
                    title: 'Sign up for account',
                    onSubmit: () => _pushToSignUp(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pushToSignUp(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage(),
      ),
    );
  }

  void _login(BuildContext context) async {
    try {
      final auth = Provider.of<Auth>(context, listen: false);
      await auth.signInWithEmail(_email, _password);
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    } catch (e) {
      print(e.toString());
    }
  }
}
