library scroll_table;

import 'package:flutter/widgets.dart';

class ScrollTable extends StatelessWidget {
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
  final TableRow headerRow;
  final List<TableRow> dataRows;
  final BoxConstraints headerConstraints;
  final BoxConstraints dataConstraints;
  final ScrollController? scrollController;
  final TableBorder? headerBorder;
  final TableBorder? dataBorder;

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
