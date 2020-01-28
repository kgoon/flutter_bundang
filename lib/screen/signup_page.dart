import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              title,
              style: Theme.of(context).textTheme.display1,
            ),
            SignupForm()
          ],
        ),
      ),
    );
  }
}

class SignupForm extends StatefulWidget{
  @override
  _SignupFormState createState() => _SignupFormState(); 
}


class _SignupFormState extends State<SignupForm> {
  String _birth;

  bool _agreement = false;

  TextEditingController _birthController = TextEditingController();

  DateFormat _birthFormat = new DateFormat('yyyy-MM-dd');

  Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2021)
      );
      if(picked != null) {
        setState(() => _birth =  _birthFormat.format(picked));
      }
  }

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
          InkWell(
            onTap: () {
              _selectDate();   // Call Function that has showDatePicker()
            },
            child: IgnorePointer(
              child: TextFormField(
                controller: _birthController,
                decoration: const InputDecoration(
                  hintText: 'birthday'
                ),
              ),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                _agreement = !_agreement;
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
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
