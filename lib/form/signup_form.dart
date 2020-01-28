import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tenplus/form/field/date_form_field.dart';

class SignupForm extends StatefulWidget{
  @override
  _SignupFormState createState() => _SignupFormState(); 
}


class _SignupFormState extends State<SignupForm> {
  
  bool _agreement = false;

  DateFormat _birthDayFormat = new DateFormat('yyyy-MM-dd');

  void _onChangeAgreement(bool value) {
      setState(() { _agreement = !_agreement; });
  }

  Widget build(BuildContext context) {
  
    return Form(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'email'
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'password'
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              hintText: 'password confirm'
            ),
          ),
          DateFormField(
            dateFormat: _birthDayFormat,
          ),
          CheckboxListTile(
            title: const Text('I accept the terms of service'),
            controlAffinity: ListTileControlAffinity.leading,
            value: _agreement,
            onChanged: _onChangeAgreement,
          ),
        ],
      ),
    );
  }
}