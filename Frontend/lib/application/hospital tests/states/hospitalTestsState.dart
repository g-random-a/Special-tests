part of '../bloc/hospitalTestsBloc.dart';

abstract class HospitalTestsState extends Equatable {
  const HospitalTestsState();

  @override
  List<Object> get props => [];
}

class HospitalTestsLoading extends HospitalTestsState {}

class HospitalTestsLoadSuccess extends HospitalTestsState {
  final List<SpecialTest> tests;

  const HospitalTestsLoadSuccess({required this.tests});

  @override
  List<Object> get props => [tests];
}

class HospitalTestsLoadFailure extends HospitalTestsState {
  final Object error;

  const HospitalTestsLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
