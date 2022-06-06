import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/application/specialTest/events/CatagoryTestEvent.dart';
import 'package:special_tests/application/specialTest/states/CatagoryTestState.dart';

import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';

// ignore: camel_case_types
class CatagoryTestBloc extends Bloc<CatagoryTestEvent, CatagoryTestState> {
  final HospitalRepository hospitalRepository;

  CatagoryTestBloc({required this.hospitalRepository})
      : super(CatagoryTestHospitalLoading()) {
    on<loadCatagoryHospital>((event, emit) async {
      emit(CatagoryTestHospitalLoading());
      try {
        final hospandtest =
            await hospitalRepository.fetchCatogorized(event.catagory);
        emit(CatagoryTestHospitalSuccess(hospitalandtest: hospandtest, catagory: event.catagory));
      } catch (error) {
        emit(CatagoryTestHospitalLoadingFailure(error));
      }
    });
  }
}
