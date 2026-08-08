import 'package:flutter_test/flutter_test.dart';
import 'package:umme_aiyaman_portfolio/app/app.dart';

void main() {
  testWidgets('PortfolioApp renders test', (WidgetTester tester) async {
    await tester.pumpWidget(const PortfolioApp());
    expect(find.text('Umme Aiyaman Kureshi'), findsOneWidget);
  });
}
