part of '../bloc/popularHospitalBloc.dart';

abstract class PopularHospitalState extends Equatable {
  const PopularHospitalState();
  @override
  List<Object> get props => [];
}

class PopularHospitalLoading extends PopularHospitalState {}

class PopularHospitalLoadSuccess extends PopularHospitalState {
  final List<Hospital> hospitals;

  const PopularHospitalLoadSuccess({required this.hospitals});
  @override
  List<Object> get props => [hospitals];
}

class PopularHospitalLoadFailure extends PopularHospitalState {
  final Object error;

  const PopularHospitalLoadFailure(this.error);
  @override
  List<Object> get props => [error];
}
