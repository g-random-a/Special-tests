import 'dart:convert';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:special_tests/domain/role/entity/role_model.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:http/http.dart' as http;

class UserDataProvider {
  final userUrl = Url.url + '/api/user/save';
  UserDataProvider();

  Future<User?> create(User user) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';
      final response = await http.post(Uri.parse("$userUrl/create"),
          headers: header, body: jsonEncode(user.toJson()));

      if (response.statusCode == 201) {
        print("Successfully created a user");
        return User.fromJson(jsonDecode(response.body));
      }
      print("Unsuccessful creation of a user");
      return null;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<User>> fetchAll() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse('$userUrl'),
        headers: header,
      );
      List<User> users = [];
      for (var jsonUser in jsonDecode(response.body)) {
        User user = User.fromJson(jsonUser);
        users.add(user);
      }
      return users;
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<Role>> fetchAllRoles() async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse('$userUrl/roles'),
        headers: header,
      );
      print("Successfully listed roles: ${response.body}");
      return (response.body as List).map((u) => Role.fromJson(u)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<List<User>> fetchAllUsersByRole(String role) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.get(
        Uri.parse('$userUrl/role/$role'),
        headers: header,
      );
      print("Successfully listed ${role} users: ${response.body}");
      return (response.body as List).map((u) => User.fromJson(u)).toList();
    } catch (e) {
      print(e);
      throw e;
    }
  }

  Future<User?> update(String id, User user) async {
    try {
      final token =
          await AppsDatabase.instance.getUser().then((value) => value.token);

      Map<String, String> header = {};
      header['content-Type'] = 'application/json';
      header['authorization'] = 'Bearer $token';

      final response = await http.put(
        Uri.parse('$userUrl/update/$id'),
        body: jsonEncode(user.toJson()),
        headers: header,
      );

      if (response.statusCode == 200) {
        print("Successful updation of a user");
        return User.fromJson(jsonDecode(response.body));
      }
      print("Unsuccessful updation of a user");
      return null;
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
        Uri.parse('$userUrl/delete/$id'),
        headers: header,
      );
      print(response);
      print("Successful deletion of a user");
    } catch (e) {
      rethrow;
    }
  }
}
