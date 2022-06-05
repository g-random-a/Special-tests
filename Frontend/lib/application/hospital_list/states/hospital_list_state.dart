import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';

abstract class HospitalListState extends Equatable {
  const HospitalListState();

  @override
  List<Object> get props => [];
}

class HospitalListLoading extends HospitalListState {}

class HospitalListLoadingSuccess extends HospitalListState {
  final List<Hospital> hospitals;

  const HospitalListLoadingSuccess({required this.hospitals});

  @override
  List<Object> get props => [hospitals];
}

class HospitalListLoadingFailure extends HospitalListState {
  final Object error;

  const HospitalListLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}
