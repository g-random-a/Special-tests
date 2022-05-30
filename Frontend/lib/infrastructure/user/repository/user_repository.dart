import 'package:special_tests/domain/role/entity/role_model.dart';
import 'package:special_tests/infrastructure/user/data_provider/user_provider.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';

class UserRepository {
  final UserDataProvider dataProvider;
  UserRepository({required this.dataProvider});

  Future<User?> create(User user) async {
    return dataProvider.create(user);
  }

  Future<User?> update(String id, User user) async {
    return dataProvider.update(id, user);
  }

  Future<List<User>> fetchAll() async {
    return dataProvider.fetchAll();
  }

  Future<List<Role>> fetchAllRoles() async {
    return dataProvider.fetchAllRoles();
  }

  Future<List<User>> fetchAllUsersByRole(String role) async {
    return dataProvider.fetchAllUsersByRole(role);
  }

  Future<void> delete(String id) async {
    dataProvider.delete(id);
  }
}
