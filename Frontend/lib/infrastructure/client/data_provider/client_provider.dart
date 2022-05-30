import 'dart:convert';
import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:http/http.dart' as http;

class ClientDataProvider {
  final clientUrl = Url.url + '/api/client';
  ClientDataProvider();

  Future<Client?> create(Client client) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      
      final response = await http.post(Uri.parse('$clientUrl'),
          headers: header, body: jsonEncode(client.toJson()));

      if (response.statusCode == 201) {
        print("Successful creation of a client");
        return Client.fromJson(jsonDecode(response.body));
      }
      print("Unsuccessful creation of a client");
      return null;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Client?> fetchOne() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      final response = await http.get(Uri.parse('$clientUrl'), headers: header);

      if (response.statusCode == 200) {
        return Client.fromJson(jsonDecode(response.body));
      }
      return null;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<Client> update(String id, Client client) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      String url = clientUrl + "/update";
      final response = await http.put(Uri.parse('$url'),
          headers: header, body: jsonEncode(client.toJson()));

      if (response.statusCode == 200) {
        print("Successful updation of a client");
        return Client.fromJson(
          jsonDecode(response.body),
        );
      } else {
        throw Exception("Error");
      }
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<void> delete(String id) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);
      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.delete(
        Uri.parse('$clientUrl/$id'),
        headers: header,
      );
      print(response);
      print("Successful deletion of a client");
    } catch (e) {
      rethrow;
    }
  }
}
