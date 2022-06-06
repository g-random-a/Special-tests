import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/infrastructure/special_test/repository/special_test_repository.dart';
part '../events/specialTestEvents.dart';
part '../states/specialTestsState.dart';

class specialTestBloc extends Bloc<specialTestEvent, specialTestsState> {
  final SpecialTestRepository specialTestRepository;
  specialTestBloc({required this.specialTestRepository})
      : super(TestLoading()) {
        
    on<loadSpecialTest>((event, emit) async {
      emit(TestLoading());
      try {
        emit(TestLoadingSuccess(event.test));
      } catch (error) {
        emit(TestLoadingFailure(error));
      }
    });

    on<createSpecialTest>((event, emit) async {
      try {
        await specialTestRepository.create(event.specialTest);

        final specialTest =
            await specialTestRepository.create(event.specialTest);

        emit(TestOperationSuccess(event.specialTest));
      } catch (error) {
        emit(TestOperationFailure(error));
      }
    });

    on<updateSpecialTest>((event, emit) async {
      try {
        await specialTestRepository.update(event.id, event.specialTest);

        final specialTests =
            await specialTestRepository.update(event.id, event.specialTest);

        emit(TestOperationSuccess(event.specialTest));
      } catch (error) {
        emit(TestOperationFailure(error));
      }
    });

    on<DeleteSpecialTest>((event, emit) async {
      try {
        await specialTestRepository.delete(event.id);
        final specialTests = await specialTestRepository.delete(event.id);

        emit(TestDeletionSuccess());
      } catch (error) {
        emit(TestDeletionFailed(error));
      }
    });
  }
}
