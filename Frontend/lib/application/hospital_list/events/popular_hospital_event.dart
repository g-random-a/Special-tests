part of '../bloc/popularHospitalBloc.dart';

abstract class PopularHospitalEvent extends Equatable {
  const PopularHospitalEvent();
}

class loadPopularHospital extends PopularHospitalEvent {
  const loadPopularHospital();
  @override
  List<Object> get props => [];
}
