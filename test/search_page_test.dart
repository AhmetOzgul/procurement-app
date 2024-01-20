import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/search_page.dart';
import 'package:proje/widgets/product_list_item.dart';
import 'package:proje/widgets/text_field.dart';

import 'test_helper.dart';

void main() {
  testWidgets('Search Page Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const MaterialApp(
      home: SearchPage(),
    ));

    expect(find.byType(MyTextField), findsOneWidget);

    expect(find.byType(StreamBuilder), findsOneWidget);

    await tester.enterText(find.byType(MyTextField), 'mouse');
    await tester.pumpAndSettle();

    expect(find.byType(ProductListItem), findsWidgets);

    await expectLater(
      find.byType(SearchPage),
      matchesGoldenFile('search_page_golden.png'),
    );
  });
}
