import 'package:flutter/material.dart';

class TabelVolume extends StatelessWidget {
  final List<Map<String, dynamic>> volume = [
    {'No': 1, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 07.00 WIB'},
    {'No': 2, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 09.00 WIB'},
    {'No': 3, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 11.00 WIB'},
    {'No': 4, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 13.00 WIB'},
    {'No': 5, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 15.00 WIB'},
    {'No': 6, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 17.00 WIB'},
    {'No': 7, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 19.00 WIB'},
    {'No': 8, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 21.00 WIB'},
    {'No': 9, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 23.00 WIB'},
    {'No': 10, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 01.00 WIB'},
    {'No': 11, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 03.00 WIB'},
    {'No': 12, 'Volume': '120', 'Tanggal': ' 24 Agustus 2023 . 15.00 WIB'},
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
                  'Volume',
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
    return volume.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            item['No'].toString(),
          ),
        ),
        DataCell(
          Text(
            item['Volume'],
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
