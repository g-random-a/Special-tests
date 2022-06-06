import 'package:equatable/equatable.dart';


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';

part '../events/hospitalTestsEvent.dart';
part '../states/hospitalTestsState.dart';

class hospitalTestsBloc extends Bloc<HospitalTestsEvent, HospitalTestsState> {
  final HospitalRepository hospitalRepository;

  hospitalTestsBloc({required this.hospitalRepository})
      : super(HospitalTestsLoading()) {
    on<loadHospitalTest>((event, emit) async {
      emit(HospitalTestsLoading());
      try {
        final tests = await hospitalRepository.getHospById(event.id);
        emit(HospitalTestsLoadSuccess(tests: tests));
      } catch (error) {
        emit(HospitalTestsLoadFailure("Can Not Fetch Hospital Tests"));
      }
    });
  }
}
