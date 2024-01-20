import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/create_acc_page.dart';

import 'test_helper.dart';

void main() {
  testWidgets('CreateAccPage widget test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MaterialApp(
      home: CreateAccPage(onTap: null),
    ));
    expect(find.byType(CreateAccPage), findsOneWidget);
    expect(find.text("Let's create an account for you"), findsOneWidget);
  });
}
