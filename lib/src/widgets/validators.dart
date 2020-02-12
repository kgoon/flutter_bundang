abstract class Validator {
  bool isValid(String value);
}

class NonEmptyValidator implements Validator {
  @override
  bool isValid(String value) {
    return value.isNotEmpty;
  }
}

class ContainEmailFormat implements Validator {
  @override
  bool isValid(String value) {
    return value.contains('@');
  }
}

class MinimumLength implements Validator {
  @override
  bool isValid(String value) {
    return value.length > 7;
  }
}

class UserValidators {
  final Validator emailNotEmpty = NonEmptyValidator();
  final Validator passwordNotEmpty = NonEmptyValidator();
  final Validator emailFormat = ContainEmailFormat();
  final Validator passwordLength = MinimumLength();

  final String emailNotEmptyString = '이메일이 비었습니다';
  final String passwordNotEmptyString = '패스워드가 비었습니다';
  final String emailFormatString = '올바른 이메일 형식이 아닙니다';
  final String passwordLengthString = '패스워드는 최소 8자 입니다';
}
