import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/widgets/button.dart';

import 'test_helper.dart';

void main() {
  testWidgets('MyButton Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: MyButton(onTap: null, text: 'Test Button'),
      ),
    ));

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.text('Test Button'), findsOneWidget);

    await expectLater(
      find.byType(MyButton),
      matchesGoldenFile('my_button_golden.png'),
    );
  });
}
