import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/infrastructure/special_test/repository/special_test_repository.dart';
part '../events/SpecialTestDetailEvent.dart';
part '../states/SpecialTestDetailState.dart';

class TestDetailBloc extends Bloc<TestDetailEvent, TestDeatilState> {
  final SpecialTestRepository specialTestRepository;
  TestDetailBloc({required this.specialTestRepository})
      : super(TestDetailLoading()) {
    on<loadTestDetail>((event, emit) async {
      emit(TestDetailLoading());
      try {
        emit(TestDetailLoadingSuccess(
            specialTests: event.test, hosp: event.hosp));
      } catch (error) {
        emit(TestDetailLoadingFailure(error));
      }
    });
  }
}
