import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app/poop_stats_widget.dart';
import 'package:your_app/database_helper.dart';

void main() {
  testWidgets('PoopStatsWidget shows loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: PoopStatsWidget())));

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  // Mock the DatabaseHelper to provide test data
  // Add more tests as needed
}
