import 'package:flutter/material.dart';
import 'package:flutter_bundang/ui_setting/setColor.dart';

Widget socialButton(IconData icon) {
  return Container(
    height: 60,
    margin: EdgeInsets.symmetric(vertical: 30),
    decoration: BoxDecoration(
      color: Color(0xFFF1F3F6),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      boxShadow: [
        BoxShadow(
            offset: Offset(10, 10),
            color: Color(0xFF4D70A6).withOpacity(0.2),
            blurRadius: 16),
        BoxShadow(
            offset: Offset(-10, -10),
            color: Color.fromARGB(170, 255, 255, 255),
            blurRadius: 10),
      ],
    ),
    child: Icon(
      icon,
      color: mainColor_900,
    ),
  );
}