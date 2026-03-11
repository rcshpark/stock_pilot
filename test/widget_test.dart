import 'package:stock_pilot/main.dart';
import 'package:stock_pilot/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows auth landing content', (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('Your AI Investment Partner'), findsOneWidget);
    expect(find.text('Login to get started'), findsOneWidget);
    expect(find.text('Start as Guest'), findsOneWidget);
  });

  testWidgets('renders home screen hero and primary sections', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    expect(find.text('StockPilot'), findsOneWidget);
    expect(find.text('오늘의 주요 이슈'), findsOneWidget);
    expect(find.text('기업명 또는 종목코드를 검색하세요'), findsOneWidget);
    expect(find.text('KOSPI'), findsOneWidget);
    expect(find.text('홈'), findsOneWidget);
    expect(find.text('커뮤니티'), findsOneWidget);
  });

  testWidgets('shows ticker briefing section after scrolling home screen', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('관심 종목 브리핑'),
      200,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(find.text('관심 종목 브리핑'), findsOneWidget);
    expect(find.text('AI 브리핑'), findsOneWidget);
    expect(find.text('삼성전자'), findsOneWidget);
  });

  testWidgets('shows community discussion cards after scrolling home screen', (
    tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: HomeScreen()));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(
      find.text('커뮤니티 인기 토론'),
      300,
      scrollable: find.byType(Scrollable).first,
    );
    await tester.pumpAndSettle();

    expect(find.text('커뮤니티 인기 토론'), findsOneWidget);
    expect(
      find.text('오늘 반도체 랠리, 실적 선반영일까 추가 상승 시작일까?'),
      findsOneWidget,
    );
    expect(find.text('실시간 토론'), findsNWidgets(2));
  });
}
