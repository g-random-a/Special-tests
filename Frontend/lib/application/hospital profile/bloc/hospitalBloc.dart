import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';

part '../event/hospital_events.dart';
part '../state/hospital_state.dart';

class hospitalBloc extends Bloc<HospitalEvent, HospitalState> {
  final HospitalRepository hospitalRepository;

  hospitalBloc({required this.hospitalRepository}) : super(HospitalLoading()) {
    on<loadHospital>((event, emit) async {
      emit(HospitalLoading());
      try {
        emit(HospitalOperationSuccess(hospital: event.hospital));
      } catch (error) {
        emit(HospitalOperationFailure(error));
      }
    });

    on<loadHospitalfromDb>((event, emit) async {
      emit(HospitalLoading());
      try {
        Hospital hosp = await hospitalRepository.getHosp();
        emit(HospitalOperationSuccess(hospital: hosp));
      } catch (error) {
        emit(HospitalOperationFailure(error));
      }
    });
  }
}
