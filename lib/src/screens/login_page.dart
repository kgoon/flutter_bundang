import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/models/sign_in_model.dart';
import 'package:flutter_bundang/src/screens/home_page.dart';
import 'package:flutter_bundang/src/screens/sign_up_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final Auth auth;
  final SignInModel model;

  LoginPage({@required this.auth, @required this.model});

  static Widget create(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context, listen: false);
    return Consumer<SignInModel>(
      builder: (context, model, _) => LoginPage(
        auth: auth,
        model: model,
      ),
    );
  }

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with CustomFormFieldWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Auth get auth => widget.auth;
  SignInModel get model => widget.model;

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
                          child:
                              emailInputField(context, emailController, model)),
                      wrapInputField(
                        passwordInputField(context, passwordController, model),
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
        builder: (context) => SignUpPage.create(context),
      ),
    );
  }

  void _login(BuildContext context) async {
    try {
      await auth.signInWithEmail(model.email, model.password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => HomePage(),
      ));
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
