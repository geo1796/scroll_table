import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:scroll_table/scroll_table.dart';

void main() {
  group('ScrollTable tests', () {
    testWidgets('ScrollTable renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScrollTable(
              headerRow: const TableRow(children: [Text('Header')]),
              dataRows: const [
                TableRow(children: [Text('Data')])
              ],
              headerConstraints: BoxConstraints.tight(const Size(200, 50)),
              dataConstraints: BoxConstraints.tight(const Size(200, 300)),
            ),
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Data'), findsOneWidget);
    });

    testWidgets('ScrollTable scrolls vertically', (WidgetTester tester) async {
      final scrollController = ScrollController();

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScrollTable(
              headerRow: const TableRow(children: [Text('Header')]),
              dataRows: List.generate(
                  20, (index) => TableRow(children: [Text('Row $index')])),
              headerConstraints: BoxConstraints.tight(const Size(200, 50)),
              dataConstraints: BoxConstraints.tight(const Size(200, 100)),
              scrollController: scrollController,
            ),
          ),
        ),
      );

      final initialOffset = scrollController.offset;

      await tester.drag(
          find.byType(SingleChildScrollView), const Offset(0, -100));
      await tester.pumpAndSettle();

      expect(scrollController.offset, isNot(equals(initialOffset)));
    });

    testWidgets('ScrollTable applies constraints correctly',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ScrollTable(
              headerRow: const TableRow(children: [Text('Header')]),
              dataRows: const [
                TableRow(children: [Text('Data')])
              ],
              headerConstraints: BoxConstraints.tight(const Size(300, 50)),
              dataConstraints: BoxConstraints.tight(const Size(300, 300)),
            ),
          ),
        ),
      );

      final headerContainer =
          tester.widget<Container>(find.byType(Container).first);
      final dataContainer =
          tester.widget<Container>(find.byType(Container).last);

      expect(headerContainer.constraints?.maxHeight, equals(50));
      expect(dataContainer.constraints?.maxHeight, equals(300));
    });
  });
}
