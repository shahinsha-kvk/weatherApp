import 'dart:io';
import 'package:flutter_excel/excel.dart';

class ExcelService {
  Future<List<Map<String, String>>> parseExcel(String? filePath) async {
    final file = File(filePath!);
    final bytes = file.readAsBytesSync();
    final excel = Excel.decodeBytes(bytes);

    List<Map<String, String>> locations = [];

    for (var table in excel.tables.keys) {
      print(table); //sheet Name
      print(excel.tables[table]?.maxCols);
      print(excel.tables[table]?.maxRows);

      for (var row in excel.tables[table]!.rows) {
        // Assuming the first row is headers
        if (row.isNotEmpty && row[0] != null) {
          locations.add({
            'country': row[0]?.toString() ?? '',
            'state': row[1]?.toString() ?? '',
            'district': row[2]?.toString() ?? '',
            'city': row[3]?.toString() ?? '',
          });
        }
      }
    }

    return locations;
  }
}
