import 'package:flutter_test/flutter_test.dart';
import 'package:proje/pages/home_page.dart';

import 'test_helper.dart';

void main() {
  testWidgets('Home Page widget test', (WidgetTester tester) async {
    setupFirebaseEmulator();
    await tester.pumpWidget(const HomePage());

    expect(find.byType(HomePage), findsOneWidget);
  });
}
