import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/auth.dart';
import 'package:proje/pages/home_page.dart';
import 'package:proje/widgets/login_signup_toggle.dart';

import 'test_helper.dart';

void main() {
  testWidgets('AuthPage widget test', (WidgetTester tester) async {
    setupFirebaseEmulator();

    await tester.pumpWidget(const AuthPage());

    expect(find.byType(StreamBuilder), findsOneWidget);

    FirebaseAuth.instance.signOut();

    await tester.pump();

    expect(find.byType(LoginOrRegister), findsOneWidget);
    expect(find.byType(HomePage), findsNothing);
  });
}
