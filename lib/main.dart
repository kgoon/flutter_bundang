import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/sign_up_page.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Awesome App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      locale: DevicePreview.of(context).locale, // <--- Add the locale
      builder: DevicePreview.appBuilder,
      home: SignUpPage(),
    );
  }
}
