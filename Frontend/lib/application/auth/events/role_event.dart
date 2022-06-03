part of '../bloc/role_bloc.dart';

abstract class RoleEvent extends Equatable {
  const RoleEvent();
}

class clientRole extends RoleEvent {
  @override
  List<Object?> get props => [];

}

class hospitalRole extends RoleEvent {
  @override
  List<Object?> get props => [];
}
