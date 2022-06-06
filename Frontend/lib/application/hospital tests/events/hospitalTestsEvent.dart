part of '../bloc/hospitalTestsBloc.dart';

abstract class HospitalTestsEvent extends Equatable {
  const HospitalTestsEvent();
}

class loadHospitalTest extends HospitalTestsEvent {
  final String id;
  const loadHospitalTest({required this.id});
  @override
  List<Object> get props => [id];
}
