// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ko';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "agreeService" : MessageLookupByLibrary.simpleMessage("서비스 정책에 동의합니다."),
    "appName" : MessageLookupByLibrary.simpleMessage("Awesome App"),
    "birthday" : MessageLookupByLibrary.simpleMessage("생일"),
    "email" : MessageLookupByLibrary.simpleMessage("이메일"),
    "emailValid" : MessageLookupByLibrary.simpleMessage("유효한 이메일을 입력하세요."),
    "home" : MessageLookupByLibrary.simpleMessage("홈"),
    "password" : MessageLookupByLibrary.simpleMessage("비밀번호"),
    "passwordConfirm" : MessageLookupByLibrary.simpleMessage("비밀번호 확인"),
    "passwordConfirmValid" : MessageLookupByLibrary.simpleMessage("비밀번호가 일치하지 않습니다."),
    "passwordValid" : MessageLookupByLibrary.simpleMessage("보안을 위해 10자리 이상 입력하세요."),
    "signInButton" : MessageLookupByLibrary.simpleMessage("이미 계정이 있으시나요? 로그인"),
    "signUpButton" : MessageLookupByLibrary.simpleMessage("회원가")
  };
}
