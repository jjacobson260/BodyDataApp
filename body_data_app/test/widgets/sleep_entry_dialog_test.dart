import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:body_data_app/sleep/sleep_entry_dialog.dart';

void main() {
  testWidgets('SleepEntryDialog has required fields and buttons', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: Scaffold(body: SleepEntryDialog())));

    expect(find.text('Minutes to Sleep?'), findsOneWidget);
    expect(find.text('Dream Log'), findsOneWidget);
    expect(find.text('No Sleep'), findsOneWidget);
    expect(find.text('Save'), findsOneWidget);
  });

  // Add more tests as needed
}
