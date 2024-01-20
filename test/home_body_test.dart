import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/widgets/home_body.dart';

import 'test_helper.dart';

void main() {
  testWidgets('HomeBody widget test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MaterialApp(
      home: HomeBody(),
    ));

    expect(find.byType(HomeBody), findsOneWidget);
  });
}
