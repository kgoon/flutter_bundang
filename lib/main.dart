import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/screens/landing_page.dart';
import 'package:flutter_bundang/src/services/auth.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Provider<Auth>(
        create: (context) => Auth(),
        child: MaterialApp(
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
          home: LandingPage(),
        ),
      ),
    );
  }
}
