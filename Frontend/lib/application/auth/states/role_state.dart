part of '../bloc/role_bloc.dart';

abstract class RoleState extends Equatable {
  const RoleState();
}

class Idle extends RoleState {
  @override
  List<Object?> get props => [];
}

class clientState extends RoleState {
  @override
  List<Object?> get props => [];
}

class hospitalState extends RoleState {
  @override
  List<Object?> get props => [];
}
