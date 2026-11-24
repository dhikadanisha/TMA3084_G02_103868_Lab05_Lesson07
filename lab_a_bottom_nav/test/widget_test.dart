import 'package:flutter_test/flutter_test.dart';
import 'package:lab_a_bottom_nav/main.dart';

void main() {
  testWidgets('tapping each tab shows its screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('Home Screen'), findsOneWidget);

    await tester.tap(find.text('Alarm'));
    await tester.pump();
    expect(find.text('Alarm Screen'), findsOneWidget);

    await tester.tap(find.text('Business'));
    await tester.pump();
    expect(find.text('Business Screen'), findsOneWidget);

    await tester.tap(find.text('School'));
    await tester.pump();
    expect(find.text('School Screen'), findsOneWidget);
  });
}
