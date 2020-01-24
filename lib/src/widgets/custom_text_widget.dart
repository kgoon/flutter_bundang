import 'package:flutter/material.dart';

class HeadingOneText extends StatelessWidget {
  final String title;
  const HeadingOneText({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: responsiveTextSize(context, 30.0, 60.0),
        fontWeight: FontWeight.bold,
        color: Colors.grey[700],
      ),
    );
  }
}

double responsiveTextSize(BuildContext context, double small, double big) {
  if (MediaQuery.of(context).size.width > 700) {
    return big;
  } else {
    return small;
  }
}
