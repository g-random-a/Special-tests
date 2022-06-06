part of '../bloc/specialTestDetailBloc.dart';

abstract class TestDetailEvent extends Equatable {
  const TestDetailEvent();
}

class loadTestDetail extends TestDetailEvent {
  SpecialTest test;
  Hospital hosp;
  loadTestDetail({required this.test, required this.hosp});
  @override
  List<Object> get props => [];
}
