import 'package:http/http.dart';
import 'package:special_tests/domain/auth/validation/invalid_validation.dart';
import 'package:special_tests/infrastructure/auth/data_provider/auth_provider.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';

class AuthRepository {
  final AuthDataProvider authDataProvider;

  AuthRepository({required this.authDataProvider});

  Future<User?> checkUser() async {
    return authDataProvider.getUserOnLocal();
  }

  Future<User> signIn(Login login) async {
    try {
      return await authDataProvider.loginUser(login);
    } on ClientException catch (e) {
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> signUpClient(RegisterClient register) async {
    try {
      final response = await authDataProvider.registerClient(register);
      return response;
    } on ClientException catch (e) {
      throw InvalidCredential(failedValue: e.message);
    }
  }

  Future<bool> signUpHosp(RegisterHospital register) async {
    try {
      final response = await authDataProvider.registerHospital(register);
      return response;
    } on ClientException catch (e) {
      throw InvalidCredential(failedValue: e.message);
    }
  }
}
