import 'package:flutter/material.dart';
import 'custom_text_widget.dart';

class CustomFormFieldWidget {
  Widget emailInputField(
      BuildContext context, TextEditingController controller, model) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'email',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
      onChanged: model.updateEmail,
    );
  }

  Widget passwordInputField(
      BuildContext context, TextEditingController controller, model) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      obscureText: true,
      onChanged: model.updatePassword,
    );
  }

  Widget rePasswordInputField(
      BuildContext context, TextEditingController controller, model) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'password 확인',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      obscureText: true,
      onChanged: model.updateRePassword,
    );
  }

  Widget birthdayInputField(
      {model,
      BuildContext context,
      TextEditingController controller,
      Function onClick}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: 'birthday',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
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

  Widget wrapInputField(Widget child) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: child,
    );
  }
}
