import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/application/client%20profile%20edit/bloc/Client_edit_profile_bloc.dart';
import 'package:special_tests/application/hospital%20tests/bloc/hospitalTestsBloc.dart';
import 'package:special_tests/domain/auth/entity/auth_model.dart';
import 'package:special_tests/domain/hospital/entity/hospital.dart';
import 'package:special_tests/domain/special_tests/entity/special_tests_model.dart';
import 'package:special_tests/domain/user/entity/user_model.dart' as usr;

import 'package:special_tests/domain/client/entity/client.dart';
import 'package:special_tests/infrastructure/auth/data_provider/auth_provider.dart';
import 'package:special_tests/infrastructure/auth/repository/auth_repository.dart';
import 'package:special_tests/infrastructure/client/repository/client_repository.dart';
import 'package:special_tests/infrastructure/hospital/repository/hospital_repository.dart';
import 'package:special_tests/infrastructure/user/repository/user_repository.dart';

final login = Login(email: "bob@gmail.com", password: "password");
final specialTest = SpecialTest(
  id: 1,
  name: "names",
  price: 20.5,
  description: "description",
  category: "catergory",
  availablity: true,
);
final specialTest2 = SpecialTest(
  id: 1,
  name: "names",
  price: 20.5,
  description: "description",
  category: "catergory",
  availablity: true,
);
final hospital = Hospital(
  hospId: "1",
  name: "name",
  description: "description",
  rating: 4.0,
  ratedClients: 100,
  address: "address",
  image: "asset/image/image.png",
  requestedTimes: 97,
  specialTest: [specialTest, specialTest2],
);
final user = User(
  id: "aa",
  username: "aa",
  token: "token",
  email: "5612",
  role: "aa",
  password: "aa",
);
final user2 = usr.User(
  id: "aa",
  username: "aa",
  email: "5612",
  role: "aa",
  password: "aa",
);
final client = Client(
    clientId: "1",
    fristName: "Alice",
    lastName: "bob",
    age: 19,
    gender: "M",
    medicalInfo: "healthy");

RegisterClient register = RegisterClient(user: user2, client: client);

// 1
class MockClientRepository extends Mock implements ClientRepository {
  @override
  Future<Client> update(strId, client) {
    return super.noSuchMethod(Invocation.method(#clients, null),
        returnValue: Future.value(client));
  }

  @override
  Future<dynamic> delete(strId) {
    return super.noSuchMethod(Invocation.method(#clients, null),
        returnValue: Future.value());
  }
}

class MockAuthRepository extends Mock implements AuthRepository {
  @override
  Future<User> signIn(login) {
    return super.noSuchMethod(Invocation.method(#users, null),
        returnValue: Future.value(user));
  }

  @override
  Future<bool> signUpClient(register) {
    return super.noSuchMethod(Invocation.method(#getbool, null),
        returnValue: Future.value(true));
  }
}

// 3
class MockHospitalTestsRepository extends Mock implements HospitalRepository {
  @override
  Future<Hospital> create(hospital) {
    return super.noSuchMethod(Invocation.method(#hospitals, null),
        returnValue: Future.value(hospital));
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MockAuthRepository mockAuthRepository = MockAuthRepository();
  MockClientRepository mockClientRepository = MockClientRepository();
  MockHospitalTestsRepository mockHospitalTestsRepository =
      MockHospitalTestsRepository();

  Future<User> createFutureUser() async {
    return user;
  }

  Future<Client> createFutureClient() async {
    return client;
  }

  Future<Hospital> createFutureHospitalTests() async {
    return hospital;
  }

  setUp(() {
    mockAuthRepository = MockAuthRepository();
    mockClientRepository = MockClientRepository();
    mockHospitalTestsRepository = MockHospitalTestsRepository();
  });

  group("AuthBloc", () {
    blocTest<AuthBloc, AuthState>(
      'LoginEvent emits [LoggingIn,LoginSuccess] when Success',
      build: () {
        when(mockAuthRepository.signIn(login))
            .thenAnswer((invocation) => createFutureUser());
        return AuthBloc(mockAuthRepository);
      },
      act: (bloc) => bloc.add(LoginEvent(login: login)),
      expect: () {
        return [LoggingIn(), isA<LoginSuccess>()];
      },
    );

      blocTest<AuthBloc, AuthState>(
        'RegisterclientEvent emits [LoggingIn,LoginSuccess] when Success',
        build: () {
          when(mockAuthRepository.signUpClient(register))
              .thenAnswer((invocation) => Future.value(true));
          return AuthBloc(mockAuthRepository);
        },
        act: (bloc) => bloc.add(RegisterclientEvent(register: register)),
        expect: () {
          return [Registering(), isA<RegisterSuccess>()];
        },
      );
    });

    group("client_profile_edit", () {
      blocTest<ClientBloc, ClientState>(
        'DeleteClient emits [deletingClient,deleteSuccess] when Success',
        build: () {
          when(mockClientRepository.delete("1"))
              .thenAnswer((invocation) => Future.value());
          return ClientBloc(clientRepository: mockClientRepository);
        },
        act: (bloc) => bloc.add(const DeleteClient("1")),
        expect: () {
          return [isA<deletingClient>(), isA<deleteSuccess>()];
        },
      );

      blocTest<ClientBloc, ClientState>(
        'updateClient emits [updatingClient,updateSuccess] when Success',
        build: () {
          when(mockClientRepository.update("1", client))
              .thenAnswer((invocation) => createFutureClient());
          return ClientBloc(clientRepository: mockClientRepository);
        },
        act: (bloc) => bloc.add(updateClient("1", client)),
        expect: () {
          return [updatingClient(), isA<updateSuccess>()];
        },
      );
    });

    group("HospitalTests", () {
      blocTest<hospitalTestsBloc, HospitalTestsState>(
        "RegisterclientEvent emits [LoggingIn,LoginSuccess] when Success"
        'loadHospitalTest emits [HospitalTestsLoading,HospitalTestsLoadSuccess] when Success',
        build: () {
          when(mockHospitalTestsRepository.create(hospital))
              .thenAnswer((realInvocation) => createFutureHospitalTests());
          return hospitalTestsBloc(
              hospitalRepository: mockHospitalTestsRepository);
        },
        act: (bloc) => bloc.add(const loadHospitalTest(id: "1")),
        expect: () {
          return [HospitalTestsLoading(), isA<HospitalTestsLoadSuccess>()];
        },
      );
  });
}
