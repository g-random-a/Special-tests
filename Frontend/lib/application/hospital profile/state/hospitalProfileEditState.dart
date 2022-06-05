part of '../bloc/hospitalProfileEditBloc.dart';

abstract class HospitalProfileEditState extends Equatable {
  const HospitalProfileEditState();

  @override
  List<Object> get props => [];
}

class IdleProfile extends HospitalProfileEditState {}

class updatingHospital extends HospitalProfileEditState {}

class updateProfileSuccess extends HospitalProfileEditState {
  updateProfileSuccess();

  @override
  List<Object> get props => [];
}

class updateProfileFailed extends HospitalProfileEditState {
  final String message;
  updateProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

class deletingHospital extends HospitalProfileEditState {}

class deleteProfileSuccess extends HospitalProfileEditState {
  deleteProfileSuccess();

  @override
  List<Object> get props => [];
}

class deleteProfileFailed extends HospitalProfileEditState {
  final String message;
  deleteProfileFailed(this.message);

  @override
  List<Object> get props => [message];
}

class hospitalLoadingState extends HospitalProfileEditState {
  hospitalLoadingState();

  @override
  List<Object> get props => [];
}

class hospitalLoadedSuccess extends HospitalProfileEditState {
  Hospital hosp; 

  hospitalLoadedSuccess({required this.hosp});

  @override
  List<Object> get props => [hosp];
}

class hospitalLoadedError extends HospitalProfileEditState {
  String msg; 

  hospitalLoadedError(this.msg);

  @override
  List<Object> get props => [];
}
