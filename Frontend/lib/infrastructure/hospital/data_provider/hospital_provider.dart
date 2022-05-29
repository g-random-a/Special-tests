// ignore_for_file: use_rethrow_when_possible

import 'dart:convert';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/domain/hospital/entity/HospitalTestHelper.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:http/http.dart' as http;

class HospitalDataProvider {
  final hospitalUrl = Url.url + '/api/hospital/';
  HospitalDataProvider();

  Future<Hospital> create(Hospital hospital) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.post(Uri.parse('$hospitalUrl'),
          headers: header, body: jsonEncode(hospital.toJson()));

      if (response.statusCode == 201) {
        print("Successful creation of a hospital");
        return Hospital.fromJson(jsonDecode(response.body));
      }
      print("Unsuccessful creation of a hospital");
      throw Exception("can not create hospital");
    } catch (e) {
      throw e;
    }
  }

  Future<Hospital> getHosp() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response =
          await http.get(Uri.parse('$hospitalUrl'), headers: header);
      if (response.statusCode == 201) {
        print("Successfully fetched a hospital");
        return Hospital.fromJson(jsonDecode(response.body));
      }
      throw Exception("can not find hospital");
    } catch (e) {
      throw e;
    }
  }

  Future<List<SpecialTest>> getHospById(String id) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response =
          await http.get(Uri.parse('$hospitalUrl/$id'), headers: header);
      if (response.statusCode == 201) {
        print("Successfully fetched a hospital");
        List<SpecialTest> tests = [];
        for (var jsontest in jsonDecode(response.body)["specialTests"]) {
          SpecialTest test = SpecialTest.fromJson(jsontest);
          tests.add(test);
        }
        return tests;
      }
      throw Exception("Can not fetch the hospital");
    } catch (e) {
      throw e;
    }
  }

  Future<List<Hospital>> fetchAll() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      String url = Url.url + '/hospitals';
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 201) {
        List<Hospital> hospitals = [];
        for (var jsonHosp in jsonDecode(response.body)) {
          Hospital hosp = Hospital.fromJson(jsonHosp);
          hospitals.add(hosp);
        }
        return hospitals;
      } else {
        throw Exception("hospital list can not be load");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  // ignore: non_constant_identifier_names
  Future<List<HospandTest>> fetchCatogorized(String catagory) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http
          .get(Uri.parse('$hospitalUrl?catagory=$catagory'), headers: header);

      List<HospandTest> hospitalsandtest = [];

      for (var jsonHosp in jsonDecode(response.body)) {
        Hospital hosp = Hospital.fromJson(jsonHosp["hospital"]);
        SpecialTest test = SpecialTest.fromJson(jsonHosp["test"]);
        hospitalsandtest.add(HospandTest(test, hosp));
      }


      return hospitalsandtest;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<Hospital>> fetchMostRated() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      String url = Url.url + 'api/hospitals/popular';
      final response = await http.get(Uri.parse(url), headers: header);

      if (response.statusCode == 200) {
        List<Hospital> hospitals = [];
        for (var jsonHosp in jsonDecode(response.body)) {
          Hospital hosp = Hospital.fromJson(jsonHosp);
          hospitals.add(hosp);
        }
        return hospitals;
      } else {
        throw Exception("Can not load Popular Hospital");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Hospital> update(Hospital hospital) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      String url = hospitalUrl + 'edit';
      final response = await http.put(Uri.parse(url),
          headers: header, body: jsonEncode(hospital.toJson()));

      if (response.statusCode == 200) {
        print("Successful updation of a hospital");
        return Hospital.fromJson(jsonDecode(response.body));
      } else {
        throw Exception("Can Not Be Updated");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.delete(
        Uri.parse('$hospitalUrl/$id'),
        headers: header,
      );
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
