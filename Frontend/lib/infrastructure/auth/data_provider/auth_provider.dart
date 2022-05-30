import 'dart:convert';

import 'package:http/http.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/infrastructure/core/data_provider.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthDataProvider extends DataProvider {
  final authUrl = Url.url + '/api/login';
  AuthDataProvider() {
   
  }

  Future<User> loginUser(Login login) async {
    try {
      final String email = login.email;
      final String password = login.password;
      var user;
      print("repo");

      final response = await http.post(Uri.parse("$authUrl/login"),
          body: jsonEncode({'email': email, 'password': password}));

      SharedPreferences pref = await SharedPreferences.getInstance();
      pref.setString("token", jsonDecode(response.body)["token"]);
      pref.setString("role", jsonDecode(response.body)["role"]);

      if (response.statusCode == 200 || response.statusCode == 204) {
        user = User.fromJson(jsonDecode(response.body));
        await AppsDatabase.instance.createUser(user);
      } else {
        throw Exception("Invalid login");
      }
      return user;
    } on ClientException catch (e) {
      rethrow;
    }
  }

  Future<bool> registerHospital(RegisterHospital register) async {
    String url = '/api/register';
    try {
      Response response = await http.post(Uri.parse("$url"),
          body: jsonEncode({
            'user': {
              'username': register.user.username,
              'email': register.user.email,
              'password': register.user.password,
              'role': {"name": register.user.role}
            },
            'Hospital': {
              'name': register.hospital.name,
              'description': register.hospital.description,
              'address': register.hospital.address,
            },
          }));
      if (response.statusCode == 201) {
        print(response.body);
        return true;
      }
      return false;
    } on ClientException catch (e) {
      rethrow;
    }
  }

  Future<bool> registerClient(RegisterClient register) async {
    String url = '/api/register';
    try {
      Response response = await http.post(Uri.parse("$url"),
          body: jsonEncode({
            'user': {
              'username': register.user.username,
              'email': register.user.email,
              'password': register.user.password,
              'role': {"name": register.user.role}
            },
            'Client': {
              'fristName': register.client.fristName,
              'LastName': register.client.lastName,
              'age': register.client.age,
              'gender': register.client.gender,
              'medicalInfo': ""
            },
          }));
      if (response.statusCode == 201) {
        print(response.body);
        return true;
      }
      return false;
    } on ClientException catch (e) {
      rethrow;
    }
  }

  Future<User?> getUserOnLocal() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      if (pref.getString("token") != null &&
          pref.getString("token")!.isNotEmpty) {
        User user = await AppsDatabase.instance.getUser();
        return user;
      }
      return null;
    } catch (e) {
      throw Exception("user not found");
    }
  }
}
