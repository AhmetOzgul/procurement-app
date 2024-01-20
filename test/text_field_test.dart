import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/widgets/text_field.dart';

import 'test_helper.dart';

void main() {
  testWidgets('MyTextField Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    final TextEditingController controller = TextEditingController();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: MyTextField(
          controller: controller,
          hintText: 'Enter Text',
          obscureText: true,
          isNumber: false,
        ),
      ),
    ));

    expect(find.byType(TextField), findsOneWidget);

    expect(find.byType(InkWell), findsOneWidget);

    expect(find.byIcon(Icons.visibility_off), findsOneWidget);

    await tester.enterText(find.byType(TextField), 'Test123');

    expect(controller.text, 'Test123');

    await tester.tap(find.byType(InkWell));
    await tester.pump();
    expect(find.byIcon(Icons.visibility), findsOneWidget);

    await expectLater(
      find.byType(MyTextField),
      matchesGoldenFile('my_text_field_golden.png'),
    );
  });
}
