import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bundang/l10n/strings.dart';
import 'package:flutter_bundang/ui/page_container.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'home/sing_up.dart';

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
  String _title = "";
  int _currentIndex = 0;
  List<PageContainer> _pages;

  @override
  void dispose() {
    if (_pages != null) {
      for (PageContainer container in _pages)
        container.controller.dispose();
    }

    super.dispose();
  }

  List<PageContainer> _createPages() {
    return <PageContainer> [
      new PageContainer(
        title: Strings.of(context).signUp,
        hasTab: true,
        body: () => new SignUpPage(),
        tickerProvider: this,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text(Strings.of(context).home),
        elevation: 4.0,
      ),
      body: new Column(children: <Widget>[
        !!!// Text button 2개 입력 할 예정.
      ]),
    );
  }
}
