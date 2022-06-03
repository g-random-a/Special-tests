import 'package:equatable/equatable.dart';

abstract class AuthStatusEvent extends Equatable {
  const AuthStatusEvent();
}

class CheckAuthenticationEvent extends AuthStatusEvent {
  @override
  List<Object?> get props => [];
}
