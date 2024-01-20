import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/main.dart';
import 'package:proje/pages/auth.dart';

import 'test_helper.dart';

void main() {
  testWidgets('MyApp widget test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MyApp());

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(AuthPage), findsOneWidget);
  });
}
