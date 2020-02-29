import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_bloc.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/models/sign_up_model.dart';
import 'package:flutter_bundang/src/screens/login_page.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  final ApiBloc apiBloc;
  final SignUpModel model;

  SignUpPage({@required this.apiBloc, @required this.model});

  static Widget create(BuildContext context) {
    final ApiBloc apiBloc = Provider.of<ApiProvider>(context).bloc;
    return Consumer<SignUpModel>(
      builder: (context, model, _) => SignUpPage(
        apiBloc: apiBloc,
        model: model,
      ),
    );
  }

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with CustomFormFieldWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();
  final TextEditingController birthdayController = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ApiBloc get apiBloc => widget.apiBloc;
  SignUpModel get model => widget.model;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Wrap(
              verticalDirection: VerticalDirection.down,
              alignment: WrapAlignment.center,
              runSpacing: 10.0,
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
                      rePasswordInputField(
                          context, rePasswordController, model),
                      birthdayInputField(
                        model: model,
                        context: context,
                        controller: birthdayController,
                        onClick: _onClickInputField,
                      ),
                    ],
                  ),
                ),
                Transform.scale(
                  scale: 1.06,
                  child: checkBoxField(
                    context: context,
                    ifChecked: model.isChecked,
                    onChecked: model.changeCheckBoxValue,
                  ),
                ),
                CustomRaisedButton(
                  onSubmit: model.isChecked ? _signUp : null,
                  backgroundColor: Colors.teal,
                  title: 'SIGN UP',
                ),
                CustomMaterialButton(
                  title: 'Already have account? Sign in',
                  onSubmit: _pushToLogin,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onClickInputField() {
    FocusScope.of(context).requestFocus(FocusNode());
    selectDate(context).then((onValue) {
      if (onValue != null) {
        birthdayController.text = DateFormat('yMMd', 'ko').format(onValue);
        model.updateBirthday(birthdayController.text);
      }
    });
  }

  void _pushToLogin() {
    model.changeAutoVal(false);
    model.changeCheckBoxValue(false);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage.create(context),
      ),
    );
  }

  Future<void> _signUp() async {
    FocusScope.of(context).requestFocus(new FocusNode());
    if (_formKey.currentState.validate()) {
      bool authResult = await apiBloc.createUserWithEmail(
          email: model.email,
          password: model.password,
          birthday: model.birthday);
      if (authResult) {
        model.changeAutoVal(false);
        model.changeCheckBoxValue(false);
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
    rePasswordController.dispose();
    birthdayController.dispose();
    super.dispose();
  }
}
