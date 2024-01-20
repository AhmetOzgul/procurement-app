import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/profile_page.dart';

import 'test_helper.dart';

void main() {
  testWidgets('Profile Page Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(
      const MaterialApp(
        home: ProfilePage(
          nameSurname: 'John Doe',
          phoneNum: '123-456-7890',
        ),
      ),
    );

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('123-456-7890'), findsOneWidget);
  });
}
