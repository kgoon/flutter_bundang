import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class DateFormField extends StatefulWidget{

  DateFormField({Key key, this.dateFormat}) : super(key: key);

  final DateFormat dateFormat;
  
  @override
  _DateFormFieldState createState() => _DateFormFieldState();
}

class _DateFormFieldState extends State<DateFormField>{

  DateTime _selectedDate;

  DateFormat _dateFormat;

  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.dateFormat == null) {
      _dateFormat = DateFormat.yMd();
    }else{
      _dateFormat = widget.dateFormat;
    }
  }

  Future _selectDate() async {
      DateTime picked = await showDatePicker(
          context: context,
          initialDate: new DateTime.now(),
          firstDate: new DateTime(2016),
          lastDate: new DateTime(2021)
      );
      if(picked != null) {
        setState(() => _selectedDate =  picked);
      }
  }

  @override
  Widget build(BuildContext context){

    if(_selectedDate != null){
      _textController.text = _dateFormat.format(_selectedDate);
    }

    return TextFormField(
      onTap: () {
        _selectDate();   // Call Function that has showDatePicker()
      },
      readOnly: true,
      controller: _textController,
      decoration: const InputDecoration(
        hintText: 'birthday'
      ),
    );
  }
}