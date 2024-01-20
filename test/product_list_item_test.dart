import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/widgets/product_list_item.dart';

import 'test_helper.dart';

void main() {
  testWidgets('ProductListItem Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();

    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: ProductListItem(
          productName: 'Test Product',
          numberOfProduct: '5',
          productImage: 'https://example.com/image.jpg',
          showCartButton: true,
        ),
      ),
    ));

    expect(find.byType(Card), findsOneWidget);

    expect(find.byType(Image), findsOneWidget);

    expect(find.text('Test Product'), findsOneWidget);

    expect(find.text('5 Piece(s)'), findsOneWidget);

    expect(find.byType(TextButton), findsOneWidget);

    await expectLater(
      find.byType(ProductListItem),
      matchesGoldenFile('product_list_item_golden.png'),
    );
  });
}
