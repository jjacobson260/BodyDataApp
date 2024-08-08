import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:body_data_app/poop/poop_stats_widget.dart';

void main() {
  testWidgets('PoopStatsWidget shows loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: PoopStatsWidget())));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  // Mock the DatabaseHelper to provide test data
  // Add more tests as needed
}
