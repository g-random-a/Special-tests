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

class AuthDataProviderLocal extends DataProvider {

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
