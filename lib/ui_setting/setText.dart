import 'package:flutter/material.dart';
import 'package:flutter_thememaker/ui_setting/setColor.dart';



class SetText {

  // 1. 폰트 설정 ---------------------------------------------------------------//

  static final String fontName = 'KakaoRegular';


  // 2. 폰트 사이즈 설정 ----------------------------------------------------------//

  static final display4Size = 32.0;
  static final display3Size = 30.0;
  static final display2Size = 28.0;
  static final display1Size = 26.0;

  static final headlineSize = 24.0;
  static final subheadSize = 22.0;

  static final titleSize = 20.0; // 기준점
  static final subtitleSize = 12.0;

  static final bodySize = 13.0;
  static final texSectionSize = 12.0;
  static final captionSize = 12.0;
  static final buttonTextSize = 14.0;

  // 2. 텍스트 설정 --------------------------------------------------------------//

  // (1-1) 디스플레이4 스타일 -------------------------------------------------------
  static final TextStyle display4 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: display4Size,
    color: fontColor_900,
    //letterSpacing: 0.4,
    //height: 0.9,
  );


  // (1-2) 디스플레이4 화이트
  static final TextStyle display4_white =
  display3.copyWith(color: fontColor_50);

  // (2-1) 디스플레이3 스타일 -------------------------------------------------------
  static final TextStyle display3 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: display3Size,
    color: fontColor_900,
    //letterSpacing: 0.4,
    //height: 0.9,
  );

  // (2-2) 디스플레이3 화이트
  static final TextStyle display3_white =
  display3.copyWith(color: fontColor_50);

  // (3-1) 디스플레이2 스타일 -------------------------------------------------------
  static final TextStyle display2 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: display2Size,
    color: fontColor_900,
    //letterSpacing: 0.4,
    //height: 0.9,
  );

  // (3-2) 디스플레이2 화이트
  static final TextStyle display2_white =
  display2.copyWith(color: fontColor_50);

  // (4-1) 디스플레이1 스타일 ------------------------------------------------------
  static final TextStyle display1 = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: display1Size,
    color: fontColor_900,
    //letterSpacing: 0.4,
    //height: 0.9,
  );

  // (4-2) 디스플레이1 화이트
  static final TextStyle display1_white =
  display1.copyWith(color: fontColor_50);

  // (5-1) 헤드라인 스타일 ---------------------------------------------------------
  static final TextStyle headline = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: headlineSize,
    color: fontColor_900,
    //letterSpacing: 0.4,
    //height: 0.9,
  );

  // (5-2) 헤드라인 화이트
  static final TextStyle headline_white =
  headline.copyWith(color: fontColor_50);

  // (6-1) 서브헤드 스타일 ---------------------------------------------------------
  static final TextStyle subhead = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.bold,
    fontSize: subheadSize,
    color: fontColor_900,
    //letterSpacing: 0.4,
    //height: 0.9,
  );

  // (6-2) 서브헤드 화이트
  static final TextStyle subhead_white =
  subhead_white.copyWith(color: fontColor_50);

  // (7-1) 타이틀 스타일 ----------------------------------------------------------
  static final TextStyle title = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize: titleSize,
    color: fontColor_900,
    // letterSpacing: 0.18,
  );

  // (7-2) 타이틀 화이트
  static final TextStyle title_white =
  title.copyWith(color: fontColor_50);

  // (8-1) 서브타이틀 스타일 -------------------------------------------------------
  static final TextStyle subtitle = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w800,
    fontSize: subtitleSize,
    color: fontColor_800,
    // letterSpacing: 0.18,
  );

  // (8-2) 서브타이틀 화이트
  static final TextStyle subtitle_white =
  subtitle.copyWith(color: fontColor_50);

  // (9-1) 텍스트섹션 타이틀 스타일 --------------------------------------------------
  static final TextStyle body = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: bodySize,
    color: fontColor_900,
    // letterSpacing: 0.2,
  );

  // (9-2) 텍스트섹션 타이틀 화이트
  static final TextStyle body_white =
  body.copyWith(color: fontColor_50);

  // (10-1) 텍스트섹션 스타일 -------------------------------------------------------
  static final TextStyle textSection = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: texSectionSize,
    color: fontColor_900,
    height: 1.5, // 줄간격
    // letterSpacing: -0.05,
  );

  // (10-2) 바디1 화이트
  static final TextStyle textSection_white =
  textSection.copyWith(color: fontColor_50);

  // (11-1) 캡션 스타일 -----------------------------------------------------------
  static final TextStyle caption = TextStyle(
    // Caption -> caption
    fontFamily: fontName,
    //fontWeight: FontWeight.w400,
    fontSize: captionSize,
    color: fontColor_900,
    // letterSpacing: 0.2,
  );

  // (11-2) 캡션 화이트
  static final TextStyle caption_white =
  caption.copyWith(color: fontColor_50);

  // (12-1) 버튼 텍스트 스타일 ------------------------------------------------------
  static final TextStyle buttonText = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w700,
    fontSize: buttonTextSize,
    color: fontColor_900,
    // letterSpacing: 0.2,
  );

  // (12-2) 버튼 화이트
  static final TextStyle buttonText_white =
  buttonText.copyWith(color: fontColor_50);

}