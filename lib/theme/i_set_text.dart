import 'package:flutter/material.dart';
import 'i_set_color.dart';


class ISetText{
  static final fontName = 'KakaoRegular';

  static final display4Size = 32.0;
  static final display3Size = 30.0;
  static final display2Size = 28.0;
  static final display1Size = 26.0;
  static final headlineSize = 24.0;
  static final subheadSize = 22.0;
  static final titleSize = 20.0; // 기준점
  static final subtitleSize = 14.0;
  static final bodySize = 13.0;
  static final texSectionSize = 12.0;
  static final captionSize = 12.0;
  static final buttonTextSize = 12.0;

  static final display4 = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: display4Size, color: fontColor_900,);
  static final display3 = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: display3Size, color: fontColor_900,);
  static final display2 = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: display2Size, color: fontColor_900,);
  static final display1 = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: display1Size, color: fontColor_900,);
  static final headline = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: headlineSize, color: fontColor_900,);
  static final subHeadline = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: subheadSize, color: fontColor_900,);
  static final title = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: titleSize, color: fontColor_900,);
  static final subTitle = TextStyle(fontFamily: fontName, fontWeight: FontWeight.w500, fontSize: subtitleSize, color: fontColor_900,);
  static final body = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: bodySize, color: fontColor_900,);
  static final textSection = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: texSectionSize, color: fontColor_500,);
  static final caption = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: captionSize, color: fontColor_900,);
  static final buttonText = TextStyle(fontFamily: fontName, fontWeight: FontWeight.bold, fontSize: buttonTextSize, color: fontColor_900,);
}