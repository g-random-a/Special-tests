import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';

import '../events/hospital_list_events.dart';
import '../states/hospital_list_state.dart';


class hospitalListBloc extends Bloc<HospitalListEvent, HospitalListState> {
  final HospitalRepository hospitalRepository;

  hospitalListBloc({required this.hospitalRepository})
      : super(HospitalListLoading()) {
    on<loadHospitals>((event, emit) async {
      emit(HospitalListLoading());
      try {
        final hospitals = await hospitalRepository.fetchAll();
        emit(HospitalListLoadingSuccess(hospitals: hospitals));
      } catch (error) {
        emit(HospitalListLoadingFailure(error));
      }
    });
  }
}
