import 'package:flutter/material.dart';
//import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:special_tests/application/index.dart';
import 'package:special_tests/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:special_tests/presentation/pages/special_tests/detail.dart';
//import 'package:test/test.dart';

void main() {
  group('Business feature request', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("request", (tester) async {
      app.main();
      tester.pumpAndSettle();

      final requestbutton = find.byKey(Key("make_request"));
      final cancelbutton = find.byKey(Key("make_request"));
      final approverequest = find.byKey(Key("approve"));

      await tester.tap(requestbutton);
      await tester.tap(cancelbutton);
      await tester.tap(approverequest);

      tester.pumpAndSettle();
    });
  });
}
