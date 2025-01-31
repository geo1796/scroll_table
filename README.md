# ScrollTable 📜

A **simple Flutter widget** for displaying a **scrollable table** with a fixed header.

## ✨ Features
✅ Fixed **header row** while scrolling  
✅ Supports **custom constraints** for header and data rows  
✅ Allows **custom borders** for both header and data  
✅ Supports external **ScrollController**  

---

## 📦 Installation
Add this to your `pubspec.yaml`:
```yaml
dependencies:
  scroll_table: ^1.0.0
```
Then run:
```sh
flutter pub get
```

---

## 🚀 Usage
### Basic Example
```dart
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
```

---

## ⚙️ Properties
| Property           | Type                     | Description |
|-------------------|-------------------------|------------|
| `headerRow`      | `TableRow`               | The fixed header row |
| `dataRows`       | `List<TableRow>`         | The scrollable data rows |
| `headerConstraints` | `BoxConstraints`      | Constraints for the header container |
| `dataConstraints` | `BoxConstraints`        | Constraints for the data container |
| `scrollController` | `ScrollController?`    | Optional external scroll controller |
| `headerBorder`   | `TableBorder?`           | Custom border for the header |
| `dataBorder`     | `TableBorder?`           | Custom border for the data rows |

---

## 📌 Notes
- Ensure that `headerConstraints` and `dataConstraints` have the same width to prevent misalignment.
- If you need **horizontal scrolling**, wrap the widget in a `SingleChildScrollView(scrollDirection: Axis.horizontal)`.
