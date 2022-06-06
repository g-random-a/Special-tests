part of '../bloc/UserBloc.dart';

abstract class UserEvent extends Equatable{
  const UserEvent();
}

class loadUser extends UserEvent {
  const loadUser();
  @override
  List<Object> get props => [];
}

class updateUser extends UserEvent {
  final String userId;
   final User user;

  const updateUser(this.userId, this.user);
  @override
  List<Object> get props => [userId, User];

  @override
  String toString() => 'User Updated {User Id: ${userId}}';
}

class DeleteUser extends UserEvent {
   final String UserId;
  const DeleteUser(this.UserId);

  @override
  List<Object> get props => [UserId];

  @override
  String toString() => 'User Deleted {User Id: $UserId}';

  @override
  bool? get stringify => true;
}

