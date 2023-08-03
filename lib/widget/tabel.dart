import 'package:flutter/material.dart';

class Tabel extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {'No': 1, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 07.00 WIB'},
    {'No': 2, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 09.00 WIB'},
    {'No': 3, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 11.00 WIB'},
    {'No': 4, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 13.00 WIB'},
    {'No': 5, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 15.00 WIB'},
    {'No': 6, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 17.00 WIB'},
    {'No': 7, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 19.00 WIB'},
    {'No': 8, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 21.00 WIB'},
    {'No': 9, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 23.00 WIB'},
    {'No': 10, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 01.00 WIB'},
    {'No': 11, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 03.00 WIB'},
    {'No': 12, 'Suhu': '28°C', 'Tanggal': ' 24 Agustus 2023 . 15.00 WIB'},
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
                  'Suhu',
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
    return data.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            item['No'].toString(),
          ),
        ),
        DataCell(
          Text(
            item['Suhu'],
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
