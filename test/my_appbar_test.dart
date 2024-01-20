import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:proje/widgets/my_appbar.dart';

import 'test_helper.dart';

void main() {
  testWidgets('MyAppBar Widget Test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        appBar:
            const PreferredSize(preferredSize: Size.zero, child: MyAppBar()),
        body: Container(),
      ),
    ));

    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byType(ElevatedButton), findsOneWidget);

    expect(find.byIcon(Icons.person), findsOneWidget);

    await expectLater(
      find.byType(MyAppBar),
      matchesGoldenFile('my_appbar_golden.png'),
    );
  });
}
