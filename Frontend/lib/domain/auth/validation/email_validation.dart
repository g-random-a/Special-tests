import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/domain/auth/validation/invalid_validation.dart';

class Email {
  final String email;
  List<String> get props => [email];

  factory Email(String email) {
    return Email._(email: validateEmail(email));
  }

  Email._({required this.email});

  static validateEmail(String email) {
    const emailRegex =
        r"""!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\"\(\[\]!#-[^-~ \t]|(\\[\t -~]))+\")@([!#-'*+/-9=?A-Z^-~-]+(\.[!#-'*+/-9=?A-Z^-~-]+)*|\[[\t -Z^-~]*""";
    if (!(RegExp(emailRegex).hasMatch(email))) {
      throw InvalidEmail(failedValue: "Value is not valid Email");
    }
  }

  @override
  String toString() => 'email: {$email}';
}

class InvalidEmail extends InvalidCredential {
  final String failedValue;

  List<String> get props => [failedValue];
  InvalidEmail({required this.failedValue}) : super(failedValue: failedValue);
}
