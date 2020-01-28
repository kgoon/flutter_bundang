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

  Widget build(BuildContext context) {
  
    return Form(
      child: Column(
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
          InkWell(
            onTap: (){
              setState(() {
                _agreement = !_agreement;
              });
            },
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: _agreement,
                    onChanged: (bool newValue) {
                      setState(() {
                        _agreement = newValue;
                      });
                    },
                  ),
                  Expanded(child: Text('I accept the terms of service')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}