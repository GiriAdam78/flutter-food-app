// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:food_market_app/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MainApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap '+' icon and trigger a frame

    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that Our Counter has Icrement
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
