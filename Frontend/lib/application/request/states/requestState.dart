part of '../bloc/requestbloc.dart';

abstract class requestState extends Equatable {
  const requestState();

  @override
  List<Object> get props => [];
}
class requestLoading extends requestState {}

class requestOperationSuccess extends requestState {
  const requestOperationSuccess();
}

class requestOperationFailure extends requestState {
  final Object error;

  const requestOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
