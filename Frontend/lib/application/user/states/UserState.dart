part of '../bloc/UserBloc.dart';

abstract class UserState extends Equatable{
  const UserState();

  @override
  List<Object> get props => [];
}

class IdleUser extends UserState {}
class updatingUser extends UserState {}

class updateUserSuccess extends UserState {
  updateUserSuccess();

  @override
  List<Object> get props => [];
}

class updateUserFailed extends UserState {
  final String message;
  updateUserFailed(this.message);

   @override
  List<Object> get props => [message];
}



