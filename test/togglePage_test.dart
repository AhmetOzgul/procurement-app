import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/create_acc_page.dart';
import 'package:proje/pages/login_page.dart';
import 'package:proje/widgets/login_signup_toggle.dart';

import 'test_helper.dart';

void main() {
  testWidgets('LoginOrRegister Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: LoginOrRegister(),
      ),
    ));

    expect(find.byType(LoginPage), findsOneWidget);
    expect(find.byType(CreateAccPage), findsNothing);

    await tester.tap(find.byKey(const Key('toggle_button')));
    await tester.pump();

    expect(find.byType(LoginPage), findsNothing);
    expect(find.byType(CreateAccPage), findsOneWidget);
  });
}
