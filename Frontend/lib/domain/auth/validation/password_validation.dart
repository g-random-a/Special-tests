import 'package:special_tests/domain/auth/validation/invalid_validation.dart';

class Password {
  final String password;

  factory Password(String password) {
    return Password._(password: validatePassword(password));
  }

  Password._({required this.password});

  static String validatePassword(String password) {
    if (password.length < 8) {
      throw InvalidPassword(failedValue: "Password length must above 8");
    }
    return password;
  }
}

class InvalidPassword extends InvalidCredential {
  final String failedValue;

  InvalidPassword({required this.failedValue})
      : super(failedValue: failedValue);
}
