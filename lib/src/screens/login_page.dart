import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/models/sign_in_model.dart';
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
    final Auth auth = Provider.of<Auth>(context);
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

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
                  key: _formKey,
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

  Future<void> _login(BuildContext context) async {
    if (_formKey.currentState.validate()) {
      bool authResult = await auth.signInWithEmail(model.email, model.password);
      if (authResult) {
        // 회원가입과 로그인 페이지를 오가서 중첩됬을 경우
        // pop대신 popUtil을 써서 Landing 페이지가 나올 때까지 pop 시킴
        Navigator.popUntil(context, (route) => route.isFirst);
      }
    } else {
      model.changeAutoVal(true);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
