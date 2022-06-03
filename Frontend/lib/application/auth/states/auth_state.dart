import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as model_user;

abstract class AuthState extends Equatable {
  const AuthState();
}

// login user state
class InitState extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggingIn extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoginSuccess extends AuthState {
  final User user;
  LoginSuccess({required this.user});

  @override
  List<Object?> get props => [];
}

class LogginError extends AuthState {
  final String errorMsg;

  LogginError(this.errorMsg);

  @override
  List<Object?> get props => [];
}

class LoggedInState extends AuthState {
  final Map<String, dynamic> userData;
  LoggedInState({required this.userData});

  @override
  List<Object?> get props =>[];
}

// logut user state
class Logout extends AuthState {
  @override
  List<Object?> get props => [];
}

class LoggedOutState extends AuthState {
  @override
  List<Object?> get props => [];
}

class Registering extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegisterSuccess extends AuthState {
  @override
  List<Object?> get props => [];
}

class RegisterError extends AuthState {
  final errorMessage;
  RegisterError(this.errorMessage);

  @override
  List<Object?> get props => [];
}

class NextBtnPressedState extends AuthState {
  final model_user.User user;

  NextBtnPressedState({required this.user});

  @override
  List<Object?> get props => [];
}
