import 'package:flutter/cupertino.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';
import 'i_inner_shadow.dart';

Widget pressButton(child, {bool selected = false}) {
  return selected
      ? Stack(
          children: <Widget>[
            InnerShadow(
              color: mainColor_900.withOpacity(.2),
              offset: Offset(5, 5),
              blur: 2,
              child: Container(
                height: 60,
                margin: EdgeInsets.symmetric(vertical: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: mainColor_50,
                ),
                child: child,
              ),
            ),
          ],
        )
      : Container(
          height: 60,
          margin: EdgeInsets.symmetric(vertical: 30),
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
          child: child);
}
