import 'package:equatable/equatable.dart';

abstract class CatagoryTestEvent extends Equatable {
  const CatagoryTestEvent();
}

class loadCatagoryHospital extends CatagoryTestEvent {
  String catagory;
  loadCatagoryHospital({required this.catagory});
  @override
  List<Object> get props => [];
}
