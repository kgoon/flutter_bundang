import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_bloc.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/models/sign_in_model.dart';
import 'package:flutter_bundang/src/screens/sign_up_page.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final ApiBloc apiBloc;
  final SignInModel model;

  LoginPage({@required this.apiBloc, @required this.model});

  static Widget create(BuildContext context) {
    final ApiBloc apiBloc = Provider.of<ApiProvider>(context).bloc;
    return Consumer<SignInModel>(
      builder: (context, model, _) => LoginPage(
        apiBloc: apiBloc,
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

  ApiBloc get apiBloc => widget.apiBloc;
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
            child: Wrap(
              verticalDirection: VerticalDirection.down,
              alignment: WrapAlignment.center,
              runSpacing: 17.0,
              children: <Widget>[
                HeadingOneText(
                  title: 'Awesome App',
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      emailInputField(context, emailController, model),
                      passwordInputField(context, passwordController, model),
                    ],
                  ),
                ),
                CustomRaisedButton(
                  backgroundColor: Colors.teal,
                  title: 'SIGN IN',
                  onSubmit: () => _login(context),
                ),
                CustomMaterialButton(
                  title: 'Sign up for account',
                  onSubmit: () => _pushToSignUp(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _pushToSignUp(BuildContext context) {
    model.changeAutoVal(false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpPage.create(context),
      ),
    );
  }

  Future<void> _login(BuildContext context) async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      bool authResult = await apiBloc.signInWithEmail(
          email: model.email, password: model.password);
      if (authResult) {
        model.changeAutoVal(false);
        Navigator.popUntil(context, (route) => route.isFirst);
      } else {
        // showAlertDialog(
        //   context: context,
        //   title: '에러',
        //   content: auth.getErrorMsg(),
        // );
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
