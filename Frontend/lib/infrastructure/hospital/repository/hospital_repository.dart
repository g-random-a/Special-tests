import 'package:special_tests/domain/hospital/entity/HospitalTestHelper.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/infrastructure/hospital/data_provider/hospital_provider.dart';

import '../../../domain/hospital/entity/hospital.dart';

class HospitalRepository {
  final HospitalDataProvider dataProvider;
  HospitalRepository({required this.dataProvider});

  Future<Hospital> create(Hospital hospital) async {
    try {
      return dataProvider.create(hospital);
    } catch (e) {
      throw e;
    }
  }

  Future<Hospital> update(String id, Hospital hospital) async {
    try {
      return dataProvider.update(hospital);
    } catch (e) {
      throw e;
    }
  }

  Future<List<Hospital>> fetchAll() async {
    try {
      return dataProvider.fetchAll();
    } catch (e) {
      throw e;
    }
  }

  Future<List<SpecialTest>> getHospById(String id) async {
    try {
      return dataProvider.getHospById(id);
    } catch (e) {
      throw e;
    }
  }

  Future<Hospital> getHosp() async {
    try {
      return dataProvider.getHosp();
    } catch (e) {
      throw e;
    }
  }

  Future<List<Hospital>> fetcthMostRated() async {
    try {
      return dataProvider.fetchMostRated();
    } catch (e) {
      throw e;
    }
  }

  Future<bool> delete(String id) async {
    try {
      return dataProvider.delete(id);
    } catch (e) {
      throw e;
    }
  }

  Future<List<HospandTest>> fetchCatogorized(String catagory) async {
    try {
      return dataProvider.fetchCatogorized(catagory);
    } catch (e) {
      throw e;
    }
  }
}
