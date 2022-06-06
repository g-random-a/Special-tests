part of '../bloc/specialTestBloc.dart';

abstract class specialTestsState extends Equatable {
  const specialTestsState();

  @override
  List<Object> get props => [];
}

class TestLoading extends specialTestsState {}
class TestLoadingSuccess extends specialTestsState {
  final SpecialTest specialTests;

  const TestLoadingSuccess(this.specialTests);

  @override
  List<Object> get props => [specialTests];
}


class TestOperationSuccess extends specialTestsState {
  final SpecialTest specialTests;

  const TestOperationSuccess(this.specialTests);

  @override
  List<Object> get props => [specialTests];
}
class TestDeletionSuccess extends specialTestsState {

  const TestDeletionSuccess();

  @override
  List<Object> get props => [];
}


class TestOperationFailure extends specialTestsState {
  final Object error;

  const TestOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
class TestLoadingFailure extends specialTestsState {
  final Object error;

  const TestLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}
class TestDeletionFailed extends specialTestsState {
  final Object error;

  const TestDeletionFailed(this.error);
  @override
  List<Object> get props => [error];
}
