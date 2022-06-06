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
import 'package:special_tests/presentation/pages/signup/hospitalRegistration.dart';

import 'extension.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthEventFake extends Fake implements AuthEvent {}

class AuthStateFake extends Fake implements AuthState {}

void main() {
  group("Check Hospital REgistration", () {
    setUpAll(() {
      registerFallbackValue(AuthStateFake());
      registerFallbackValue(AuthEventFake());
    });

    testWidgets('Testing the hospital registration page has some widgets',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = HospitalRegistrationPageTwo();

        await tester.pumpWidget(
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
            child: MaterialApp(
              home: widget,
            ),
          ),
        );
        expect(find.byKey(const Key("ToLogin")), findsOneWidget);

        // expect(text.style?.fontSize, 30);
        // expect(text.style?.color, AppColor.primaryColor);
      });
    });

    testWidgets('renders Hospital Registration via Router', (tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = HospitalRegistrationPageTwo();
        await tester.pumpRealRouterApp(
          Routes.hospitalSignup,
          (child) => BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
            child: MaterialApp(
              home: widget,
            ),
          ),
          isConnected: false,
        );
        expect(find.byType(HospitalRegistrationPageTwo), findsOneWidget);
      });
    });

    testWidgets(
        'is redirected when button inside hospital registration page is tapped',
        (tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = HospitalRegistrationPageTwo();

        await tester.pumpRouterApp(BlocProvider<AuthBloc>(
          create: (context) => mockAuthBloc,
          child: widget,
        ));
        final button = find.byKey(const Key("ToLogin"));
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.byKey(Key("ToLogin")), findsOneWidget);
      });
    });
  });

  testWidgets('Testing the hospital page TextFormFields',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      final mockAuthBloc = MockAuthBloc();
      when(() => mockAuthBloc.state).thenReturn(
        InitState(),
      );
      final widget = HospitalRegistrationPageTwo();

      await tester.pumpWidget(
        BlocProvider<AuthBloc>(
          create: (context) => mockAuthBloc,
          child: MaterialApp(
            home: widget,
          ),
        ),
      );
      final hospitalName = find.byKey(const Key('HospitalName'));
      final address = find.byKey(const Key('Address'));
      final description = find.byKey(const Key('Description'));

      expect(find.text("yekatit"), findsNothing);
      expect(find.text("alice@gmail.com"), findsNothing);
      expect(find.text("explanation"), findsNothing);

      await tester.enterText(address, "alice@gmail.com");
      await tester.enterText(description, "explanation");
      await tester.enterText(hospitalName, "yekatit");

      expect(find.text("yekatit"), findsOneWidget);
      expect(find.text("alice@gmail.com"), findsOneWidget);
      expect(find.text("explanation"), findsOneWidget);
    });
  });
}
