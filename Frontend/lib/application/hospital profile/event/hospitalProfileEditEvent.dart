part of '../bloc/hospitalProfileEditBloc.dart';

abstract class HospProfileEditEvent extends Equatable {
  const HospProfileEditEvent();
}

class updateHospital extends HospProfileEditEvent {
  final String hospId;
  final Hospital hospital;

  const updateHospital(this.hospId, this.hospital);
  @override
  List<Object> get props => [hospId, hospital];

  @override
  String toString() => 'Hospital Updated {Hospital Id: ${hospital.hospId}}';
}


class loadingHospitalEdit extends HospProfileEditEvent {

  const loadingHospitalEdit();
  @override
  List<Object> get props => [];
}



class DeleteHospital extends HospProfileEditEvent {
  final String hospId;
  const DeleteHospital(this.hospId);

  @override
  List<Object> get props => [hospId];

  @override
  String toString() => 'Hospital Deleted {Hospital Id: $hospId}';

  @override
  bool? get stringify => true;
}
