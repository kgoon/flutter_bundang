import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/Theme.dart';
import 'package:flutter_bundang/l10n/strings.dart';

class SignUpPage extends StatefulWidget {
  @override
  State createState() => new SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> with TickerProviderStateMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validate = false;
  bool agreeService = false;

  String email, password, passwordConfirm, birthday;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            title: Text(Strings.of(context).signUp),
            backgroundColor: themeData.primaryColor,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(context).pop()),
          ),
          // 'SingleChildScrollView' 을 사용해야 keyboard 보였을 때 화면 조정됨.
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                // title
                Container(
                    margin: new EdgeInsets.only(top: 50.0),
                    child: Text(
                      Strings.of(context).appName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.grey[700], fontSize: 25),
                    )),
                Container(
                    margin: new EdgeInsets.all(25.0),
                    child: Form(
                      key: _formKey,
                      autovalidate: validate,
                      child: _SignUpForm(),
                    ))
              ],
            ),
          )),
    );
  }

  Widget _SignUpForm() {
    ThemeData themeData = Theme.of(context);
    final EdgeInsets textFieldPadding = EdgeInsets.only(top: 10, bottom: 10);

    return Column(
      children: <Widget>[
        Padding(
          padding: textFieldPadding,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: checkEmailValid,
            onSaved: (String val) {
              email = val;
            },
          ),
        ),
        Padding(
          padding: textFieldPadding,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Password'),
            keyboardType: TextInputType.text,
            validator: validPassword,
            onSaved: (String val) {
              password = val;
            },
          ),
        ),
        Padding(
          padding: textFieldPadding,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'Password confirm'),
            keyboardType: TextInputType.text,
            validator: validPasswordConfirm,
            onSaved: (String val) {
              passwordConfirm = val;
            },
          ),
        ),
        Padding(
          padding: textFieldPadding,
          child: TextFormField(
            decoration: const InputDecoration(labelText: 'birthday'),
            onSaved: (String val) {
              birthday = val;
            },
          ),
        ),
        Row(
          children: <Widget>[
            Checkbox(
              value: agreeService,
              onChanged: (bool value) {
                setState(() {
                  agreeService = value;
                });
              },
            ),
            Text(Strings.of(context).agreeService),
          ],
        ),
        RaisedButton(
          onPressed: _checkInputValidation(),
          textColor: Colors.white,
          color: themeData.primaryColor,
          child: Text(Strings.of(context).signUp),
        )
      ],
    );
  }

  // 참고 : https://github.com/nitishk72/flutter_form_validation/blob/master/lib/main.dart
  String checkEmailValid(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return Strings.of(context).emailValid;
    else
      return null;
  }

  String validPassword(String value) {
    if (value.length < 10)
      return Strings.of(context).passwordValid;
    else
      return null;
  }

  String validPasswordConfirm(String value) {
    if (value != password)
      return Strings.of(context).passwordConfirmValid;
    else
      return null;
  }

  _checkInputValidation() {
//  if (formKey.currentState.validate()) {
//    // If all data are correct then save data to out variables
//    formKey.currentState.save();
//  } else {
//    // If all data are not valid then start auto validation.
////    setState(() {
////      _autoValidate = true;
////    });
//  }
  }
}
