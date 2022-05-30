import 'dart:convert';
import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/core/database.dart';
import 'package:special_tests/infrastructure/core/Special_Test_URLS.dart';
import 'package:http/http.dart' as http;

class ClientDataProviderLocal {

  Future<Client?> fetchOne() async {
    try {
      Client client =
          await AppsDatabase.instance.getClient();
      return client;
    } catch (e) {
      print(e);
      throw e;
    }
  }

}
