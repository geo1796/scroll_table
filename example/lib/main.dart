import 'package:flutter/material.dart';
import 'package:scroll_table/scroll_table.dart';

void main() {
  runApp(const MaterialApp(home: ScrollTableDemo()));
}

class ScrollTableDemo extends StatelessWidget {
  const ScrollTableDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScrollTable Demo')),
      body: Center(
        child: ScrollTable(
          headerRow: TableRow(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              children: const [
                ExampleHeaderWidget('Col 1'),
                ExampleHeaderWidget('Col 2'),
              ]),
          dataRows: List.generate(
              40,
              (i) => TableRow(children: [
                    ExampleDataWidget('Row ${i + 1} - Col 1'),
                    ExampleDataWidget('Row ${i + 1} - Col 2'),
                  ])),
          dataBorder: const TableBorder.symmetric(inside: BorderSide()),
        ),
      ),
    );
  }
}

class ExampleDataWidget extends StatelessWidget {
  const ExampleDataWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(text, style: const TextStyle(fontSize: 12)),
      ),
    );
  }
}

class ExampleHeaderWidget extends StatelessWidget {
  const ExampleHeaderWidget(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
