import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:special_tests/application/index.dart';
import 'package:special_tests/main.dart' as app;
import 'package:integration_test/integration_test.dart';
import 'package:special_tests/presentation/pages/special_tests/detail.dart';

void main() {
  group('Buisness feature specialtest', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    testWidgets("request", (tester) async {
      app.main();
      tester.pumpAndSettle();

      final addbutton = find.byKey(Key("addSpecialTest"));
      final deletebutton = find.byKey(Key("DeleteSpecialTests"));
      final edittest = find.byKey(Key("key"));

      await tester.tap(addbutton);
      await tester.tap(deletebutton);
      await tester.tap(edittest);
      tester.pumpAndSettle();
    });
  });
}
