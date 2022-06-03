part of '../bloc/hospitalBloc.dart';

abstract class HospitalState extends Equatable {
  const HospitalState();

  @override
  List<Object> get props => [];
}

class HospitalLoading extends HospitalState {}

class HospitalOperationSuccess extends HospitalState {
  final Hospital hospital;

  const HospitalOperationSuccess({required this.hospital});

  @override
  List<Object> get props => [hospital];
}

class loadingHospital extends HospitalState {}
class loadHospitalSuccess extends HospitalState {}
class loadHospitalFailed extends HospitalState {}


class HospitalOperationFailure extends HospitalState {
  final Object error;

  const HospitalOperationFailure(this.error);
  @override
  List<Object> get props => [error];
}
