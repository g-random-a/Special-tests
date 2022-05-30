import 'dart:convert';

import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:http/http.dart' as http;

class SpecialTestDataProvider {
 
  final addSpecialtestUrl = Url.url + '/api/hospital/addTest';
  final AllspecialtestUrl = Url.url + '/api/hospital/tests';
  final editSpecialtestUrl = Url.url + '/api/hospital/editTest';
  final deleteSpecialtestUrl = Url.url + '/api/hospital/tests';
  

  SpecialTestDataProvider();

  Future<bool> create(SpecialTest test) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      final response = await http.post(Uri.parse('$addSpecialtestUrl/create'),
          headers: header, body: jsonEncode(test.toJson()));

      if (response.statusCode == 200) {
        print("Sucessfully created an special test: ${(response.body)}");
        return true;
      }

      print("Unsuccessful special test creation");
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<SpecialTest>> fetchAll() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.get(Uri.parse("$AllspecialtestUrl/"), headers: header);
      
      List<SpecialTest> tests = [];
      for (var test in jsonDecode(response.body)) {
        SpecialTest specialTest = SpecialTest.fromJson(test);
        tests.add(specialTest);
      }
      return tests;
    } catch (e) {
      print(e);
      rethrow;
    }
  }


  Future<SpecialTest?> update(String name, SpecialTest test) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      final response = await http.put(Uri.parse("$editSpecialtestUrl/$name" ),
      headers: header,
          body: jsonEncode(test.toJson()));

      if (response.statusCode == 200) {
        print("Successful updation of test");
        return SpecialTest.fromJson(jsonDecode(response.body));
      }
      print("Unsuccessful updation of test");
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> delete(String id) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      final response = await http.delete(Uri.parse("$deleteSpecialtestUrl/$id"),headers: header,);
      if (response.statusCode == 200) {
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}
