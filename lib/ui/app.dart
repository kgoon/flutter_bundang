import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/Theme.dart';
import 'package:flutter_bundang/l10n/strings.dart';
import 'package:flutter_bundang/ui/home/sign_up.dart';
import 'package:flutter_bundang/ui/page_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home/sign_in.dart';

class MyApp extends StatefulWidget {
  static FirebaseAnalytics analytics = new FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer =
      new FirebaseAnalyticsObserver(analytics: analytics);

  @override
  _MyAppState createState() => new _MyAppState(analytics, observer);
}

class _MyLocalizationsDelegate extends LocalizationsDelegate<Strings> {
  const _MyLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['ko', 'en'].contains(locale.languageCode);

  @override
  Future<Strings> load(Locale locale) => Strings.load(locale);

  @override
  bool shouldReload(LocalizationsDelegate<Strings> old) => false;
}

class _MyAppState extends State<MyApp> {
  var _showPerformanceOverlay = false;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  _MyAppState(this.analytics, this.observer);

  @override
  void initState() {
    super.initState();

    analytics.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      onGenerateTitle: (BuildContext context) => Strings.of(context).appName,
      localizationsDelegates: [
        const _MyLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en', ''),
        const Locale('ko', ''),
      ],
      navigatorObservers: [
        new FirebaseAnalyticsObserver(analytics: analytics),
      ],
      theme: themeData,
      showPerformanceOverlay: _showPerformanceOverlay,
      home: new MyHomePage(
        showPerformanceOverlay: _showPerformanceOverlay,
        onShowPerformanceOverlayChanged: (bool value) {
          setState(() => _showPerformanceOverlay = value);
        },
      ),
    );
  }
}

// build Sign buttons
Widget _buildSignButtons(BuildContext context) {
  final ThemeData theme = Theme.of(context);

  final TextStyle buttonTextStyle = theme.textTheme.title
      .merge(new TextStyle(color: Colors.teal[300], fontSize: 12));

  final EdgeInsets buttonPadding = EdgeInsets.only(bottom: 20);

  return Column(
    children: <Widget>[
      Padding(
        padding: buttonPadding,
        // Sign up button
        child: InkWell(
          child: Text(Strings.of(context).signUpButton, style: buttonTextStyle),
          onTap: () {
            // Navigator.push() 를 통해 해당 페이지로 이동.
            // back 물리키 누르면 전 페이지로 다시 이동.
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignUpPage()));
          },
        ),
      ),

      // Sign in button
      Padding(
        padding: buttonPadding,
        // Sign up button
        child: InkWell(
          child: Text(Strings.of(context).signInButton, style: buttonTextStyle),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SignInPage()));
          },
        ),
      ),
    ],
  );
}

class MyHomePage extends StatefulWidget {
  final bool showPerformanceOverlay;
  final ValueChanged<bool> onShowPerformanceOverlayChanged;

  const MyHomePage({
    Key key,
    this.showPerformanceOverlay,
    this.onShowPerformanceOverlayChanged,
  }) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // title
            new Container(
                margin: new EdgeInsets.only(bottom: 60.0),
                child: Text(
                  Strings.of(context).appName,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.grey[700], fontSize: 25),
                )),
            _buildSignButtons(context),
          ],
        ),
      ),
    );
  }
}
