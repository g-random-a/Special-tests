import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:special_tests/application/auth/bloc/auth_bloc.dart';
import 'package:special_tests/application/auth/events/auth_events.dart';
import 'package:special_tests/application/auth/states/auth_state.dart';
import 'package:special_tests/main.dart';
import 'package:special_tests/presentation/Common/Color.dart';
import 'package:special_tests/presentation/pages/login/login.dart';
import 'package:special_tests/presentation/pages/signup/clientRegistration.dart';
import 'extension.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthEventFake extends Fake implements AuthEvent {}

class AuthStateFake extends Fake implements AuthState {}

void main() {
  group("Check Client Registration", () {
    setUpAll(() {
      registerFallbackValue(AuthStateFake());
      registerFallbackValue(AuthEventFake());
    });

    testWidgets('Testing the client registration page has some widgets',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = ClientRegistrationPageTwo();

        await tester.pumpWidget(
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
            child: MaterialApp(
              home: widget,
            ),
          ),
        );

        expect(find.byKey(const Key("ElevatedBtn")), findsOneWidget);
        expect(find.byKey(const Key("Cont")), findsOneWidget);
      });
    });

    testWidgets('renders Client registration via Router', (tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = ClientRegistrationPageTwo();
        await tester.pumpRealRouterApp(
          Routes.clientSignup,
          (child) => BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
            child: MaterialApp(
              home: widget,
            ),
          ),
          isConnected: false,
        );
        expect(find.byType(ClientRegistrationPageTwo), findsOneWidget);
      });
    });
  });

  testWidgets('Testing the client registration page TextFormFields',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      final mockAuthBloc = MockAuthBloc();
      when(() => mockAuthBloc.state).thenReturn(
        InitState(),
      );
      final widget = ClientRegistrationPageTwo();

      await tester.pumpWidget(
        BlocProvider<AuthBloc>(
          create: (context) => mockAuthBloc,
          child: MaterialApp(
            home: widget,
          ),
        ),
      );
      final firstName = find.byKey(const Key('CFirstName'));
      final lastName = find.byKey(const Key('CLastName'));

      expect(find.text("alice@gmail.com"), findsNothing);
      expect(find.text("password123!"), findsNothing);

      await tester.enterText(firstName, "alice@gmail.com");
      await tester.enterText(lastName, "password123!");

      expect(find.text("alice@gmail.com"), findsOneWidget);
      expect(find.text("password123!"), findsOneWidget);
    });
  });
}
