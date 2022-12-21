import 'package:flutter/material.dart';

class TableHeader {
  final String label;
  final ValueChanged<TableHeader>? callBack;
  bool? isSortingRequired = false;
  bool? isAscendingOrder;
  String? apiKey;
  TableHeader(this.label,
      {this.callBack,
      this.isSortingRequired,
      this.isAscendingOrder,
      this.apiKey});
}

class TableDataRow {
  final List<TableData> tableRow;
  TableDataRow(this.tableRow);
}

class TableData {
  final String label;
  final TextStyle? style;
  final String? apiKey;
  ValueChanged<TableData>? callBack;
  TableData(this.label, {this.style, this.callBack, this.apiKey});
}
