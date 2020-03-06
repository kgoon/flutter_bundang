import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/widgets/custom_text_widget.dart';

class CustomRaisedButton extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Function onSubmit;

  CustomRaisedButton(
      {@required this.title,
      @required this.backgroundColor,
      @required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2,
      child: RaisedButton(
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
          )),
    );
  }
}

class CustomMaterialButton extends StatelessWidget {
  final String title;
  final Function onSubmit;

  CustomMaterialButton({
    @required this.title,
    @required this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        title,
        style: TextStyle(
          color: Colors.teal,
          fontSize: responsiveTextSize(context, 16.0, 24.0),
        ),
      ),
      onPressed: onSubmit,
    );
  }
}
