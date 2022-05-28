import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/request/entity/request.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:sqflite/sqflite.dart';


class AppsDatabase {
  static final AppsDatabase instance = AppsDatabase._init();
  final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  final textType = 'TEXT NOT NULL';
  final textTypeNullable = 'TEXT';
  final boolType = 'BOOLEAN NOT NULL';
  final boolTypeNullable = 'BOOLEAN';
  final integerType = 'INTEGER NOT NULL';
  final integerTypeNullable = 'INTEGER';

  static Database? _database;

  AppsDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('special_tests.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute(userTable());
    await db.execute(specialTest());
  }

  String userTable() {
    return ' CREATE TABLE user(id $idType, username $textType, email $textType, password $textType, role $textType, token $textType)';
  }

  String clientTable() {
    return ' CREATE TABLE client(client_id $idType, frist_name $textType, last_name $textType, age $integerType, gender $textType, medical_info $textType)';
  }

  String hospitalTable() {
    return ' CREATE TABLE hospital(hosp_id $idType, name $textType, description $textType, rating $integerType, rated_clients $integerType, address $textType, image $textType)';
  }

  String hospTest() {
    return ' CREATE TABLE hospitaltest(hosp_id $integerType, id $textType )';
  }

  String specialTest() {
    return ' CREATE TABLE special_test(id $idType, name $textType, price $integerType, description $textType, catagory $textType, availablity $boolType)';
  }

  String request() {
    return ' CREATE TABLE request(requestId $idType, to $textType, from $integerType, test $textType, date $textType, status $boolType)';
  }

  Future<User> createUser(User user) async {
    final db = await instance.database;

    final id = await db.insert('user', user.toJson());
    return user;
  }

  Future<int> update(User user) async {
    final db = await instance.database;

    return db.update(
      'user',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<User> getUser() async {
    final db = await instance.database;

    final maps = await db.query(
      'user',
      columns: User.userFields,
     
    );

    if (maps.isNotEmpty) {
      return User.fromJson(maps.first);
    } else {
      throw Exception('no user found');
     
    }
  }

  Future<Client> createClient(Client client) async {
    final db = await instance.database;


    final id = await db.insert('client', client.toJson());
    return client;
  }

  Future<int> updateClient(Client client) async {
    final db = await instance.database;

    return db.update(
      'client',
      client.toJson(),
      where: 'id = ?',
      whereArgs: [client.clientId],
    );
  }

  Future<Client> getClient() async {
    final db = await instance.database;

    final maps = await db.query(
      'client',
      columns: Client.clientFields,
     
    );

    if (maps.isNotEmpty) {
      return Client.fromJson(maps.first);
    } else {
      throw Exception('no client found');
     
    }
  }

  Future<Hospital> createHospital(Hospital hospital) async {
    final db = await instance.database;

    final id = await db.insert('hospital', hospital.toJson());
    return hospital;
  }

  Future<int> updateHospital(Hospital hospital) async {
    final db = await instance.database;

    return db.update(
      'hospital',
      hospital.toJson(),
      where: 'id = ?',
      whereArgs: [hospital.hospId],
    );
  }

  Future<Hospital> getHospital() async {
    final db = await instance.database;

    final maps = await db.query(
      'hospital',
      columns: Hospital.hospitalFields,
     
    );

    if (maps.isNotEmpty) {
      return Hospital.fromJson(maps.first);
    } else {
      throw Exception('no hospital found');
     
    }
  }

  Future<Hospital> getHospitalById(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'hospital',
      where: 'id = ?',
      whereArgs: [id],
      columns: Hospital.hospitalFields,
      limit: 1,
    );

    if (maps.isNotEmpty) {
      List<SpecialTest> tests = await this.gethosptest(1);
      Hospital hosp = Hospital.fromJson(maps.first);
      hosp.specialTest = tests;
      return hosp;
    } else {
      throw Exception('no hospital found');
      
    }
  }

  Future<SpecialTest> getTest(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'special_test',
      where: 'id = ?',
      whereArgs: [id],
      columns: Hospital.hospitalFields,
      
    );

    if (maps.isNotEmpty) {
      return SpecialTest.fromJson(maps.first);
    } else {
      throw Exception('no tests found with id $id');
    
    }
  }

  Future<Request> addRequest(Request request) async {
    final db = await instance.database;
    Map<String, dynamic> json = request.toJson();
    json['test'] = request.test.name;
    final id = await db.insert('request', json);
    return request;
  }

  Future<int> updateRequest(Request request) async {
    final db = await instance.database;
    Map<String, dynamic> json = request.toJson();
    json['test'] = request.test.name;
    return db.update(
      'request',
      json,
      where: 'id = ?',
      whereArgs: [request.requestId],
    );
  }

  Future<List<Request>> readAllRequests() async {
    final db = await instance.database;

    final orderBy = 'date ASC';

    final result = await db.query('request', orderBy: orderBy);

    return result.map((json) => Request.fromJson(json)).toList();
  }

  Future<int> delete(String tableName, int id) async {
    final db = await instance.database;

    return db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<bool> createhosptest(hospId, testId) async {
    try {
      final db = await instance.database;

      final id =
          await db.insert('hospitaltest', {"hosp_id": hospId, "id": testId});

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<SpecialTest>> gethosptest(hospId) async {
    try {
      final db = await instance.database;

      final hospTests = await db
          .query('hospitaltest', where: 'hosp_id = ?', whereArgs: [hospId]);
      List<SpecialTest> tests = [];

      for (var Htest in hospTests) {
        SpecialTest test = await getTest(int.parse(Htest['id'].toString()));
        tests.add(test);
      }

      return tests;
    } catch (e) {
      throw Exception("can not fetch");
    }
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
