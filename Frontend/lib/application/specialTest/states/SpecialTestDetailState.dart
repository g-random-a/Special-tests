part of '../bloc/specialTestDetailBloc.dart';

abstract class TestDeatilState extends Equatable {
  const TestDeatilState();

  @override
  List<Object> get props => [];
}

class TestDetailLoading extends TestDeatilState {}

class TestDetailLoadingSuccess extends TestDeatilState {
  final SpecialTest specialTests;
  final Hospital hosp;

  TestDetailLoadingSuccess({required this.specialTests, required this.hosp});

  @override
  List<Object> get props => [specialTests];
}

class TestDetailLoadingFailure extends TestDeatilState {
  final Object error;

  const TestDetailLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}
