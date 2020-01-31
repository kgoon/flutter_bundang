import 'package:flutter/material.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';
import 'package:flutter_bundang/theme/i_set_text.dart';


class IUserTextField extends StatelessWidget {
  final obscureText;
  final prefixIcon;
  final hintText;
  final onTap;


  IUserTextField(
      {this.onTap,
      @required this.prefixIcon,
      @required this.hintText,
      @required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      style: ISetText.subTitle,
      obscureText: obscureText,
      cursorColor: mainColor_900,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: mainColor_900, width: 2)),
        //border: InputBorder.none,
        contentPadding: EdgeInsets.only(top: 16),
        prefixIcon: prefixIcon,
        hintText: hintText,
      ),
    );
  }
}
