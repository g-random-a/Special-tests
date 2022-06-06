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

import 'extension.dart';

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class AuthEventFake extends Fake implements AuthEvent {}

class AuthStateFake extends Fake implements AuthState {}

void main() {
  group("Check Auth", () {
    setUpAll(() {
      registerFallbackValue(AuthStateFake());
      registerFallbackValue(AuthEventFake());
    });

    testWidgets('Testing the login page has some widgets',
        (WidgetTester tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = LoginPage();

        await tester.pumpWidget(
          BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
            child: MaterialApp(
              home: widget,
            ),
          ),
        );
        final text = tester.widget<Text>(find.byKey(const Key("LoginText")));
        expect(find.byKey(const Key("NoAccountSignUP")), findsOneWidget);
        expect(text.style?.fontSize, 30);
        expect(text.style?.color, AppColor.primaryColor);
      });
    });

    testWidgets('renders LoginPage via Router', (tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = LoginPage();
        await tester.pumpRealRouterApp(
          Routes.login,
          (child) => BlocProvider<AuthBloc>(
            create: (context) => mockAuthBloc,
            child: MaterialApp(
              home: widget,
            ),
          ),
          isConnected: false,
        );
        expect(find.byType(LoginPage), findsOneWidget);
      });
    });

    testWidgets('is redirected when button inside login page is tapped',
        (tester) async {
      await tester.runAsync(() async {
        final mockAuthBloc = MockAuthBloc();
        when(() => mockAuthBloc.state).thenReturn(
          InitState(),
        );
        final widget = LoginPage();

        await tester.pumpRouterApp(BlocProvider<AuthBloc>(
          create: (context) => mockAuthBloc,
          child: widget,
        ));
        final button = find.byKey(const Key("NoAccountSignUP"));
        await tester.tap(button);
        await tester.pumpAndSettle();
        expect(find.byKey(Key(getRouterKey(Routes.signup))), findsOneWidget);
      });
    });
  });

  testWidgets('Testing the login page TextFormFields',
      (WidgetTester tester) async {
    await tester.runAsync(() async {
      final mockAuthBloc = MockAuthBloc();
      when(() => mockAuthBloc.state).thenReturn(
        InitState(),
      );
      final widget = LoginPage();

      await tester.pumpWidget(
        BlocProvider<AuthBloc>(
          create: (context) => mockAuthBloc,
          child: MaterialApp(
            home: widget,
          ),
        ),
      );
      final emailField = find.byKey(const Key('EmailField'));
      final passwordField = find.byKey(const Key('PasswordField'));

      expect(find.text("alice@gmail.com"), findsNothing);
      expect(find.text("password123!"), findsNothing);

      await tester.enterText(emailField, "alice@gmail.com");
      await tester.enterText(passwordField, "password123!");

      expect(find.text("alice@gmail.com"), findsOneWidget);
      expect(find.text("password123!"), findsOneWidget);
    });
  });
}
