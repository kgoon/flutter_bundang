import 'package:flutter/material.dart';
import 'package:flutter_bundang/src/business_logic/api_provider.dart';
import 'package:flutter_bundang/src/models/sign_in_model.dart';
import 'package:flutter_bundang/src/models/sign_up_model.dart';
import 'package:flutter_bundang/src/screens/landing_page.dart';
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
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ApiProvider>(
            create: (BuildContext context) => ApiProvider(),
          ),
          ChangeNotifierProvider<SignUpModel>(
            create: (BuildContext context) => SignUpModel(),
          ),
          ChangeNotifierProvider<SignInModel>(
            create: (BuildContext context) => SignInModel(),
          ),
        ],
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
          home: Scaffold(
            body: LandingPage(),
          ),
        ),
      ),
    );
  }
}
