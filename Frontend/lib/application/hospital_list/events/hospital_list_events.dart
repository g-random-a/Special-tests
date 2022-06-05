
import 'package:equatable/equatable.dart';

abstract class HospitalListEvent extends Equatable {
  const HospitalListEvent();
}

class loadHospitals extends HospitalListEvent {
  const loadHospitals();
  @override
  List<Object> get props => [];
}
