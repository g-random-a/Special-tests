import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as usr;

abstract class Authentication {}

class Register extends Authentication {
  final String username;
  String email;
  final String password;
  final String confirm;
  String role;
  Register(
      {required this.username,
      required this.email,
      required this.password,
      required this.confirm,
      required this.role});

  List<Object> get props => [username, email, password, confirm, role];

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
        username: json['username'],
        email: json['email'],
        password: json['password'],
        confirm: json['confirm'],
        role: json['role']);
  }

  @override
  String toString() =>
      'User {username: $username, email: $email} confirm: $confirm';
}

class RegisterClient extends Authentication {
  final usr.User user;
  final Client client;

  RegisterClient({required this.user, required this.client});
}

class RegisterHospital extends Authentication {
  final usr.User user;
  final Hospital hospital;

  RegisterHospital({required this.user, required this.hospital});
}


class Login extends Authentication {
  final String email;
  final String password;
  Login({required this.email, required this.password});
}

User? currentUser;

class User extends Authentication {
  final String id;
  final String username;
  final String token;
  final String email;
  final String role;
  final String password;

  static final List<String> userFields = [
    'id',
    'username',
    'email',
    'password',
    'role',
    'token',
  ];

  User(
      {required this.id,
      required this.username,
      required this.token,
      required this.email,
      required this.role,
      required this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        password: json['password'],
        role: json['role'],
        token: json['token']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = id;
    json['username'] = username;
    json['email'] = email;
    json['password'] = password;
    json['role'] = role;
    json['token'] = token;
    return json;
  }
}
