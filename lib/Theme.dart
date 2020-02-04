import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
  dividerColor: Colors.grey[300],
  primaryColor: _MyColors.theme[300],
  primaryTextTheme: Typography(platform: defaultTargetPlatform).white,
);

class _MyColors {
  _MyColors._();

  static const Map<int, Color> theme = const<int, Color> {
    300: const Color(0xff4DB6AC),
  };
}
