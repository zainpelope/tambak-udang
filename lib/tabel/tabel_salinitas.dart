import 'package:flutter/material.dart';

class TabelSalinitas extends StatelessWidget {
  final List<Map<String, dynamic>> salinitas = [
    {'No': 1, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 07.00 WIB'},
    {'No': 2, 'Salinitas': '24', 'Tanggal': ' 24 Agustus 2023 . 09.00 WIB'},
    {'No': 3, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 11.00 WIB'},
    {'No': 4, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 13.00 WIB'},
    {'No': 5, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 15.00 WIB'},
    {'No': 6, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 17.00 WIB'},
    {'No': 7, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 19.00 WIB'},
    {'No': 8, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 21.00 WIB'},
    {'No': 9, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 23.00 WIB'},
    {'No': 10, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 01.00 WIB'},
    {'No': 11, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 03.00 WIB'},
    {'No': 12, 'Salinitas': '25', 'Tanggal': ' 24 Agustus 2023 . 15.00 WIB'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 460.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25.0,
          vertical: 20,
        ),
        child: Center(
          child: DataTable(
            columns: const [
              DataColumn(
                label: Text(
                  'No',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Salinitas',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Tanggal',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: _buildRows(),
            border: TableBorder.all(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildRows() {
    return salinitas.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            item['No'].toString(),
          ),
        ),
        DataCell(
          Text(
            item['Salinitas'],
          ),
        ),
        DataCell(
          Text(
            item['Tanggal'],
          ),
        ),
      ]);
    }).toList();
  }
}
