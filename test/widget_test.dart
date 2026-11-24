import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab05_lesson07/main.dart';

void main() {
  testWidgets('Bottom navigation switches between four screens', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MaterialApp(home: BottomNavLab()));

    // Home is selected by default.
    expect(
      tester
          .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
          .currentIndex,
      0,
    );

    // Tap Alarm.
    await tester.tap(find.byIcon(Icons.alarm));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
          .currentIndex,
      1,
    );

    // Tap Business.
    await tester.tap(find.byIcon(Icons.business));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
          .currentIndex,
      2,
    );

    // Tap School.
    await tester.tap(find.byIcon(Icons.school));
    await tester.pumpAndSettle();
    expect(
      tester
          .widget<BottomNavigationBar>(find.byType(BottomNavigationBar))
          .currentIndex,
      3,
    );
  });
}
