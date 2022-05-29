// ignore_for_file: use_rethrow_when_possible


import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';

class HospitalDataProvider {
  Future<Hospital> getHosp() async {
    try {
      Hospital hosp =
          await AppsDatabase.instance.getHospital().then((value) => value);
      return hosp;
    } catch (e) {
      throw e;
    }
  }

  Future<Hospital> getHospById(String id) async {
    try {
      Hospital hosp =
          await AppsDatabase.instance.getHospitalById(int.parse(id));
      return hosp;
    } catch (e) {
      throw e;
    }
  }

}
