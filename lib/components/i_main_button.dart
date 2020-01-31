import 'package:flutter/material.dart';
import 'package:flutter_bundang/theme/i_set_color.dart';

class IUserButton extends StatelessWidget {

  final child;
  final num width;
  final num height;
  final pressedButton;

  IUserButton({@required this.child, this.pressedButton, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: width,
        alignment: Alignment.center,
        height: height,
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
        child: child,
      ),
      onTap: pressedButton,
    );
  }
}
