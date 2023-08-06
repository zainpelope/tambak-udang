import 'package:flutter/material.dart';
import 'package:tambak_undang/kalender/kalender.dart';
import 'package:tambak_undang/theme/app_color.dart';

class DataTabel extends StatelessWidget {
  final List<Map<String, dynamic>> dataTabel = [
    {
      'No': 1,
      'Tanggal': '24 Agustus 2023 . 07.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 2,
      'Tanggal': '24 Agustus 2023 . 09.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 3,
      'Tanggal': '24 Agustus 2023 . 10.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 4,
      'Tanggal': '24 Agustus 2023 . 12.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 5,
      'Tanggal': '24 Agustus 2023 . 14.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 6,
      'Tanggal': '24 Agustus 2023 . 16.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 7,
      'Tanggal': '24 Agustus 2023 . 18.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 8,
      'Tanggal': '24 Agustus 2023 . 20.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 9,
      'Tanggal': '24 Agustus 2023 . 22.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 10,
      'Tanggal': '24 Agustus 2023 . 24.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 11,
      'Tanggal': '24 Agustus 2023 . 02.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
    {
      'No': 12,
      'Tanggal': '24 Agustus 2023 . 04.00 WIB',
      'Suhu': '29',
      'pH': '7',
      'Salinitas': '25',
      'Ketinggian Air': '120'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.blue,
        title: const Text(
          "Data Tabel ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [Text("Dari Tanggal"), Kalender()],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [Text("Sampai Tanggal"), Kalender()],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(
                    0xFF8FCFFF,
                  ),
                ),
                onPressed: () {
                  // Apply button pressed
                },
                child: const Text("Apply"),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25.0,
                  right: 25.0,
                  bottom: 20.0,
                ),
                child: DataTable(
                  columns: const [
                    DataColumn(
                      label: Text(
                        'No',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Tanggal',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Suhu',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'pH',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Salinitas',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Ketinggian Air',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ],
                  rows: _buildRows(),
                  columnSpacing: 20, // Adjust as needed
                  dataRowHeight: 40, // Adjust as needed
                  headingRowHeight: 60, // Adjust as needed
                  horizontalMargin: 15, // Adjust as needed
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> _buildRows() {
    return dataTabel.map((item) {
      return DataRow(cells: [
        DataCell(
          Center(
            child: Text(
              item['No'].toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item['Tanggal'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item['Suhu'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item['pH'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item['Salinitas'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item['Ketinggian Air'],
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
      ]);
    }).toList();
  }
}

void main() {
  runApp(MaterialApp(
    home: DataTabel(),
  ));
}
