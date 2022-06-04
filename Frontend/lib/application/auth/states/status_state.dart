import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';

abstract class AuthStatusState extends Equatable {}

class AppInitState extends AuthStatusState {
  @override
  List<Object?> get props => [];
}

class AuthenticatedState extends AuthStatusState {
  final User user;
  AuthenticatedState(this.user);

  @override
  List<Object> get props => [user];
}

class UnAuthenticatedState extends AuthStatusState {
  @override
  List<Object?> get props => [];
}
