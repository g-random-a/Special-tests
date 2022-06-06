import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:special_tests/main.dart';

String getRouterKey(String route) {
  return 'key_$route';
}

extension PumpApp on WidgetTester {
  Future<void> pumpRealRouterApp(
    String location,
    Widget Function(Widget child) builder, {
    bool isConnected = true,
  }) {
    return pumpWidget(
      builder(
        MaterialApp.router(
          routeInformationParser: router(location).routeInformationParser,
          routerDelegate: router(location).routerDelegate,
        ),
      ),
    );
  }

  Future<void> pumpRouterApp(Widget widget) {
    const initialLocation = '/login';
    final _router = GoRouter(
      initialLocation: initialLocation,
      routes: [
        GoRoute(
          path: initialLocation,
          builder: (context, state) => widget,
        ),
        ...Routes()
            .props
            .map(
              (e) => GoRoute(
                path: e! as String,
                builder: (context, state) => Container(
                  key: Key(
                    getRouterKey(e as String),
                  ),
                ),
              ),
            )
            .toList()
      ],
    );

    return pumpWidget(
      MaterialApp.router(
        routeInformationParser: _router.routeInformationParser,
        routerDelegate: _router.routerDelegate,
      ),
    );
  }
}
