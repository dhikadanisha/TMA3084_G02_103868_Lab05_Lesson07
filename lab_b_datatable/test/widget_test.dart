import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_b_datatable/main.dart';

void main() {
  testWidgets('tapping Price header sorts ascending', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final before = tester.widget<DataTable>(find.byType(DataTable));
    expect(before.sortColumnIndex, isNull);

    await tester.tap(find.text('Price'));
    await tester.pump();

    final after = tester.widget<DataTable>(find.byType(DataTable));
    expect(after.sortColumnIndex, 2);
    expect(after.sortAscending, isTrue);
  });
}
