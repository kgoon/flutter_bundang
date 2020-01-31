import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/root_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('ko'),
      ],
      title: 'Awesome App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: RootPage(),
    );
  }
}
