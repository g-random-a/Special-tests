part of '../bloc/request_updateBloc.dart';

abstract class requestUpdateState extends Equatable {
  const requestUpdateState();

  @override
  List<Object> get props => [];
}

class idle extends requestUpdateState {}

class requestUpdateLoading extends requestUpdateState {}

class requestUpdateOperationSuccess extends requestUpdateState {
  final String Status;

  const requestUpdateOperationSuccess({required this.Status});

  @override
  List<Object> get props => [Status];
}

class requestUpdateOperationFailure extends requestUpdateState {
  final Object error;

  const requestUpdateOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
