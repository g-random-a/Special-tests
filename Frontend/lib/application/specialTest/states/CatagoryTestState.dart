import 'package:equatable/equatable.dart';
import 'package:special_tests/domain/hospital/entity/HospitalTestHelper.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';

abstract class CatagoryTestState extends Equatable {
  const CatagoryTestState();

  @override
  List<Object> get props => [];
}

class CatagoryTestHospitalLoading extends CatagoryTestState {}

class CatagoryTestHospitalSuccess extends CatagoryTestState {
  final String catagory;
  final List<HospandTest> hospitalandtest;

  const CatagoryTestHospitalSuccess({required this.hospitalandtest, required this.catagory});

  @override
  List<Object> get props => [hospitalandtest, catagory];
}

class CatagoryTestHospitalLoadingFailure extends CatagoryTestState {
  final Object error;

  const CatagoryTestHospitalLoadingFailure(this.error);
  @override
  List<Object> get props => [error];
}
