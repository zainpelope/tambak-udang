import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tabel extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {'nomor': 1, 'Paramaeter': 'pH', 'Literatur': '7'},
    {'nomor': 2, 'Paramaeter': 'Suhu', 'Literatur': '28°C'},
    {'nomor': 3, 'Paramaeter': 'Salinitas', 'Literatur': '35 ppt'},
    {'nomor': 4, 'Paramaeter': 'Ketinggian Air', 'Literatur': '120 cm'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 320.0),
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
                  'Nomor',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  'Paramaeter',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              DataColumn(
                label: Text(
                  'Literatur',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
            rows: _buildRows(),
            border: TableBorder.all(color: Colors.grey),
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
            item['nomor'].toString(),
          ),
        ),
        DataCell(
          Text(
            item['Paramaeter'],
          ),
        ),
        DataCell(
          Text(
            item['Literatur'],
          ),
        ),
      ]);
    }).toList();
  }
}
