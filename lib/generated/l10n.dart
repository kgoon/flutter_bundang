// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

class S {
  S(this.localeName);
  
  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final String name = locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return S(localeName);
    });
  } 

  static S of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  final String localeName;

  String get appName {
    return Intl.message(
      'Awesome App',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  String get signUpButton {
    return Intl.message(
      'Sign up for account',
      name: 'signUpButton',
      desc: '',
      args: [],
    );
  }

  String get signInButton {
    return Intl.message(
      'Already have account? Sign in',
      name: 'signInButton',
      desc: '',
      args: [],
    );
  }

  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  String get passwordConfirm {
    return Intl.message(
      'passwordConfirm',
      name: 'passwordConfirm',
      desc: '',
      args: [],
    );
  }

  String get birthday {
    return Intl.message(
      'birthday',
      name: 'birthday',
      desc: '',
      args: [],
    );
  }

  String get agreeService {
    return Intl.message(
      'I accept of the terms of service',
      name: 'agreeService',
      desc: '',
      args: [],
    );
  }

  String get passwordValid {
    return Intl.message(
      'Protect your idea, use at least 10 characters',
      name: 'passwordValid',
      desc: '',
      args: [],
    );
  }

  String get passwordConfirmValid {
    return Intl.message(
      'Password is not same',
      name: 'passwordConfirmValid',
      desc: '',
      args: [],
    );
  }

  String get emailValid {
    return Intl.message(
      'Enter Valid Email',
      name: 'emailValid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale('ko', ''), Locale('en', ''),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    if (locale != null) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return true;
        }
      }
    }
    return false;
  }
}