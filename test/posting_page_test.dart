import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/posting_page.dart';

import 'test_helper.dart';

void main() {
  testWidgets('PostPage Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MaterialApp(
      home: PostPage(),
    ));

    expect(find.text('add image'), findsOneWidget);

    await tester.tap(find.text('add image'));
    await tester.pump();

    expect(find.byType(Image), findsOneWidget);

    await tester.enterText(
        find.byKey(const Key('productNameField')), 'Test Product');
    await tester.enterText(find.byKey(const Key('productStockField')), '10');
    await tester.enterText(find.byKey(const Key('productDescriptionField')),
        'This is a test product.');

    await tester.tap(find.text('Submit'));
    await tester.pump();
  });
}
