library scroll_table;

import 'package:flutter/widgets.dart';

/// A scrollable table where the header row remains fixed while scrolling.
class ScrollTable extends StatelessWidget {
  /// The fixed header row that remains visible while scrolling.
  final TableRow headerRow;

  /// The list of `TableRow`s that make up the scrollable portion of the table.
  /// These rows scroll independently while the `headerRow` remains fixed.
  final List<TableRow> dataRows;

  /// Constraints for the header section of the table.
  ///
  /// Defines the size and layout of the header.
  final BoxConstraints headerConstraints;

  /// Constraints for the scrollable data section of the table.
  ///
  /// Defines the size and layout of the scrollable content.
  final BoxConstraints dataConstraints;

  /// Optional. Controls the vertical scrolling behavior of the table.
  final ScrollController? scrollController;

  /// Optional border styling for the header row.
  final TableBorder? headerBorder;

  /// Optional border styling for the data rows.
  final TableBorder? dataBorder;

  const ScrollTable({
    super.key,
    required this.headerRow,
    required this.dataRows,
    this.headerConstraints = const BoxConstraints(maxWidth: 500),
    this.dataConstraints = const BoxConstraints(maxWidth: 500, maxHeight: 500),
    this.headerBorder,
    this.dataBorder,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          constraints: headerConstraints,
          child: Table(
            children: [headerRow],
            border: headerBorder,
          ),
        ),
        Container(
          constraints: dataConstraints,
          child: SingleChildScrollView(
            controller: scrollController,
            child: Table(
              children: dataRows,
              border: dataBorder,
            ),
          ),
        ),
      ],
    );
  }
}
