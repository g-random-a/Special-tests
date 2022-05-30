// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/domain/request/entity/request.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:http/http.dart' as http;

class RequestDataProvider {
  final deleteUrl = Url.url + '/api/client/request/{id}';
  final requestUrl = Url.url + '/api/client/request';
  final fetchAllrequestUrl = Url.url + '/api/client/request';


  
  RequestDataProvider();

  Future<bool> makeRequest(Request request) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.post(Uri.parse('$requestUrl/create'),
          headers: header, body: jsonEncode(request.toJson())
          
          );

      if (response.statusCode == 200) {
        return true; // creation success
      }
      return false; // creation feild
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> deleteRequest(int id) async {
    try {
      String token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.delete(
        Uri.parse("$deleteUrl/$id"),
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

  Future<List<Request>> fetchAllRequests() async {
    try {
      String token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse("$fetchAllrequestUrl/"),
        headers: header,
      );

      return (response.body as List).map((u) => Request.fromJson(u)).toList();
      
    } catch (e) {
      rethrow;
    }
  }

  Future<Request?> updateRequest(String status, int id) async {
    try {
      String token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.put(
        Uri.parse("$requestUrl/update?id=$id&status=$status"),
        headers: header,
      );

      if (response.statusCode == 200) {
        print("Successful updation of a request");
        return Request.fromJson(jsonDecode(response.body));
      }
      return null; // in case of unseccess full req
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
