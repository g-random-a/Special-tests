import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';

part '../event/hospitalProfileEditEvent.dart';
part '../state/hospitalProfileEditState.dart';

class HospProfileEditBloc extends Bloc<HospProfileEditEvent, HospitalProfileEditState> {
  HospitalRepository hospitalRepository;

  HospProfileEditBloc({required this.hospitalRepository}) : super(IdleProfile()) {

    on<loadingHospitalEdit>((loadingHospitalEdit event, Emitter emit) async {
      emit(hospitalLoadingState());
      try {
        Hospital hosp = await AppsDatabase.instance.getHospital();
        emit(hospitalLoadedSuccess(hosp: hosp));
      } catch (e) {
        emit(hospitalLoadedError(e.toString()));
      }
    });

    on<updateHospital>((updateHospital event, Emitter emit) async {
      try {
        emit(updatingHospital());
        await hospitalRepository.update(event.hospId, event.hospital);
        emit(updateProfileSuccess());
      } catch (error) {
        emit(updateProfileFailed("Update Failed"));
      }
    });

    on<DeleteHospital>((DeleteHospital event, Emitter emit) async {
      try {
        emit(deletingHospital());
        await hospitalRepository.delete(event.hospId);
        emit(deleteProfileSuccess());
      } catch (error) {
        emit(deleteProfileFailed("Unable to Delete"));
      }
    });
  }
}
