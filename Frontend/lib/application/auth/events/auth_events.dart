// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/role/entity/role_model.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as model_user;

abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final Login login;

  @override
  List<Object> get props => [login];

  LoginEvent({required this.login});
}

class LogoutEvent extends AuthEvent {
  final logout;

  LogoutEvent({required this.logout});
  
  @override
  List<Object?> get props => [];
}

class RegisterHospEvent extends AuthEvent {
  final RegisterHospital register;
  List<Object> get props => [register];

  RegisterHospEvent({required this.register});
}

class RegisterclientEvent extends AuthEvent {
  final RegisterClient register;
  List<Object> get props => [register];

  RegisterclientEvent({required this.register});
}

class NextBtnPressedEvent extends AuthEvent {
  final model_user.User user;

  NextBtnPressedEvent({required this.user});
  
  @override
  List<Object?> get props => [];
}
