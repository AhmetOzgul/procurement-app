import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/main.dart';
import 'package:proje/pages/create_acc_page.dart';
import 'package:proje/pages/login_page.dart';

import 'test_helper.dart';

void main() {
  testWidgets('Test Login Page', (WidgetTester tester) async {
    setupFirebaseEmulator();

    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Create one'));
    await tester.pumpAndSettle();

    expect(find.byType(CreateAccPage), findsOneWidget);

    expect(find.byType(LoginPage), findsOneWidget);

    await tester.enterText(find.byType(TextField).first, 'test@example.com');
    await tester.enterText(find.byType(TextField).last, 'password123');

    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsNothing);
  });
}
