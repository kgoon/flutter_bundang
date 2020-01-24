import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'custom_text_widget.dart';

class CustomFormFieldWidget {
  Widget emailInputField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'email',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
      autocorrect: false,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget passwordInputField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(
          fontSize: responsiveTextSize(context, 16.0, 26.0),
        ),
      ),
    );
  }

  Widget birthdayInputField(
      {DateTime selectedDate, BuildContext context, Function onClick}) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: selectedDate == null
            ? 'birthday'
            : DateFormat.yMd('ko').format(selectedDate),
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
}
