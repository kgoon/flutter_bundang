import 'package:flutter/material.dart';
import 'package:flutter_bundang/ui_setting/i_set_color.dart';



class IUserTextField extends StatelessWidget {

  final child;

  IUserTextField({@required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      height: 60,
      margin: EdgeInsets.symmetric(vertical: 15),
      decoration: BoxDecoration(
          color: mainColor_50,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
                offset: Offset(10, 10),
                color: mainColor_900.withOpacity(0.2),
                blurRadius: 16),
            BoxShadow(
                offset: Offset(-10, -10),
                color: Color.fromARGB(170, 255, 255, 255),
                blurRadius: 10),
          ]),
      child: child
    );
  }
}
