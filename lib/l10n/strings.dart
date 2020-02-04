import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../generated/intl/messages_all.dart';

class Strings {
  static Future<Strings> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((Null) {
      Intl.defaultLocale = localeName;
      return new Strings();
    });
  }

  static Strings of(BuildContext context) {
    return Localizations.of<Strings>(context, Strings);
  }

  static final Strings instance = new Strings();

  String get appName => Intl.message("Awesome App", name: "appName");

  String get home => Intl.message("Home", name: "home");

  String get signUp => Intl.message("Sign Up", name: "signUp");

  String get signUpButton =>
      Intl.message("Sign up for account", name: "signUpButton");

  String get signInButton =>
      Intl.message("Already have account? Sign in", name: "signInButton");

  String get email => Intl.message("Email", name: "email");

  String get password => Intl.message("Password", name: "password");

  String get passwordConfirm =>
      Intl.message("PasswordConfirm", name: "passwordConfirm");

  String get birthday => Intl.message("Birthday", name: "birthday");

  String get agreeService => Intl.message("I accept of the terms of service", name: "agreeService");

  String get passwordValid =>
      Intl.message("Protect your idea, use at least 10 characters",
          name: "passwordValid");

  String get passwordConfirmValid =>
      Intl.message("Password is not same", name: "passwordConfirmValid");

  String get emailValid =>
      Intl.message("Enter Valid Email", name: "emailValid");
}
