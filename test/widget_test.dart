import 'package:ai_news_analyzer/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows auth landing content', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('AI-Powered News Analyzer'), findsOneWidget);
    expect(find.text('Login to get started'), findsOneWidget);
    expect(find.text('Start as Guest'), findsOneWidget);
  });
}
