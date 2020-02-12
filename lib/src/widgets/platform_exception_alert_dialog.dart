import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformExceptionAlertDialog {
  final String title;
  final PlatformException e;
  final String cancelActionText;
  final String defaultActionText;

  PlatformExceptionAlertDialog({
    @required this.title,
    @required this.e,
    this.cancelActionText,
    @required this.defaultActionText,
  });

  static String _message(PlatformException e) {
    return _errors[e.code] ?? e.message;
  }

  static Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD': '패스워드가 약합니다',
    'ERROR_INVALID_EMAIL': '잘못된 이메일 입니다',
    'ERROR_EMAIL_ALREADY_IN_USE': '이미 가입된 이메일 입니다',
    'ERROR_INVALID_EMAIL': '잘못된 이메일 입니다',
    'ERROR_WRONG_PASSWORD': '패스워드가 잘못 되었습니다',
    'ERROR_USER_NOT_FOUND': '사용자가 없습니다',
    'ERROR_USER_DISABLED': '잘못된 사용자 입니다',
  };

  Future<bool> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => _build(context),
    );
  }

  Widget _build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(_message(e)),
      actions: _buildActions(context),
    );
  }

  List<Widget> _buildActions(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(
        FlatButton(
          child: Text(cancelActionText),
          onPressed: () => Navigator.of(context).pop(false),
        ),
      );
    }
    actions.add(FlatButton(
      child: Text(defaultActionText),
      onPressed: () => Navigator.of(context).pop(true),
    ));
    return actions;
  }
}
