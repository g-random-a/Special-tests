import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:special_tests/presentation/pages/index.dart';

void main() {
  testWidgets('Testing the login page has some widgets',
      (WidgetTester tester) async {
    tester.pumpWidget(MaterialApp(home: EditProfile()));

    final button = find.byKey(const Key("btn1"));
    tester.tap(button);
    expect(button, findsOneWidget);
    // expect(text.style?.fontSize, 30);
    // expect(text.style?.color, AppColor.primaryColor);
  });
}
