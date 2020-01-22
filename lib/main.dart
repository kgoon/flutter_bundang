import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignupPage(title: 'Awesome App'),
    );
  }
}

class SignupPage extends StatefulWidget {
  SignupPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

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

  @override
  Widget build(BuildContext context) {
    
    _birthController.text = _birth;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: Theme.of(context).textTheme.display1,
            ),
            Form(
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
            ),
          ],
        ),
      ),
    );
  }
}
