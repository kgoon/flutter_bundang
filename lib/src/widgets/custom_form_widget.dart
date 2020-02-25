import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomFormFieldWidget {
  Widget emailInputField(
      BuildContext context, TextEditingController controller, model) {
    return TextFormField(
      controller: controller,
      autovalidate: model.autoVal,
      decoration: InputDecoration(
        labelText: 'email',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      validator: model.validateEmail,
      onChanged: model.updateEmail,
    );
  }

  Widget passwordInputField(
      BuildContext context, TextEditingController controller, model) {
    return TextFormField(
      controller: controller,
      autovalidate: model.autoVal,
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      obscureText: true,
      validator: model.validatePassword,
      onChanged: model.updatePassword,
    );
  }

  Widget rePasswordInputField(
      BuildContext context, TextEditingController controller, model) {
    return TextFormField(
      controller: controller,
      autovalidate: model.autoVal,
      decoration: InputDecoration(
        labelText: 'password 확인',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      obscureText: true,
      validator: model.validateRePassword,
      onChanged: model.updateRePassword,
    );
  }

  Widget birthdayInputField(
      {model,
      BuildContext context,
      TextEditingController controller,
      Function onClick}) {
    return TextFormField(
      controller: controller,
      autovalidate: model.autoVal,
      decoration: InputDecoration(
        labelText: 'birthday',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      validator: model.validateBirthday,
      onTap: onClick,
    );
  }

  Future<DateTime> selectDate(BuildContext context) {
    return showDatePicker(
        context: context,
        locale: const Locale('ko'),
        firstDate: DateTime.now().subtract(Duration(days: 36500)),
        initialDate: DateTime.now().subtract(Duration(days: 3650)),
        lastDate: DateTime.now(),
        initialDatePickerMode: DatePickerMode.year);
  }

  Widget checkBoxField(
      {BuildContext context, bool ifChecked, Function onChecked}) {
    return CheckboxListTile(
      value: ifChecked,
      onChanged: onChecked,
      title: Text(
        'I accept the terms of service',
        style: TextStyle(
          fontSize: responsiveTextSize(context, 14, 23),
        ),
      ),
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  void showAlertDialog(
      {@required BuildContext context,
      @required String title,
      @required String content}) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.pop(context, "OK");
              },
            ),
          ],
        );
      },
    );
  }
}
