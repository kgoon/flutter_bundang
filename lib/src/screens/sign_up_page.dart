import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/widgets/custom_button_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_form_widget.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with CustomFormFieldWidget {
  bool _ifChecked = false;
  DateTime _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                HeadingOneText(
                  title: 'Sign Up',
                ),
                Form(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                          top: 80.0,
                        ),
                        child: emailInputField(context),
                      ),
                      wrapInputField(
                        passwordInputField(context),
                      ),
                      wrapInputField(
                        passwordInputField(context),
                      ),
                      wrapInputField(
                        birthdayInputField(
                          context: context,
                          selectedDate: _selectedDate,
                          onClick: this._onClickInputField,
                        ),
                      ),
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
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: CustomButtonWidget(
                    onSubmit: _ifChecked ? () {} : null,
                    backgroundColor: Colors.teal,
                    title: 'SIGN UP',
                  ),
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
        setState(() {
          _selectedDate = onValue;
        });
      }
    });
  }

  void _onClickCheckBoxField(bool value) {
    setState(() {
      _ifChecked = value;
    });
  }
}
