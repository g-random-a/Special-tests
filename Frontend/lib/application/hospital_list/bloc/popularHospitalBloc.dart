import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';
import 'package:special_tests/application/index.dart';

part '../events/popular_hospital_event.dart';
part '../states/popular_hospital_state.dart';

class PopularHospitalBloc extends Bloc<PopularHospitalEvent, PopularHospitalState> {
  final HospitalRepository hospitalRepository;

  PopularHospitalBloc({required this.hospitalRepository})
      : super(PopularHospitalLoading()) {
    on<loadPopularHospital>((event, emit) async {
      emit(PopularHospitalLoading());
      try {
        final hospitals = await hospitalRepository.fetcthMostRated();
        emit(PopularHospitalLoadSuccess(hospitals: hospitals));
      } catch (error) {
        emit(PopularHospitalLoadFailure("Can Not Fetch Hospital Tests"));
      }
    });
  }
}
