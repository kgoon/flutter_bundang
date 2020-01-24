import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Function onSubmit;

  CustomButtonWidget(
      {@required this.title,
      @required this.backgroundColor,
      @required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        padding: EdgeInsets.symmetric(
          vertical: 20.0,
          horizontal: 40.0,
        ),
        color: backgroundColor,
        textColor: Colors.white,
        onPressed: this.onSubmit,
        child: Text(
          title,
          style: TextStyle(
            fontSize: responsiveTextSize(context, 16.0, 24.0),
          ),
        ));
  }
}
