part of '../bloc/hospitalBloc.dart';

abstract class HospitalEvent extends Equatable {
  const HospitalEvent();
}

class loadHospital extends HospitalEvent {
  final Hospital hospital;
  const loadHospital({required this.hospital});
  @override
  List<Object> get props => [this.hospital];
}

class loadHospitalfromDb extends HospitalEvent {
  const loadHospitalfromDb();
  @override
  List<Object> get props => [];
}
