import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tambak_undang/kalender/kalender.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/report_service.dart';
import 'package:tambak_undang/theme/app_color.dart';

class DataTabel extends StatefulWidget {
  @override
  State<DataTabel> createState() => _DataTabelState();
}

class _DataTabelState extends State<DataTabel> {
  bool isLoading = false;
  List<ReportModel> dataTabel = [];
  DateTime? dateFrom;
  DateTime? dateTo;

  void getAllData() {
    setState(() => isLoading = true);
    getReportByRange(
      from: DateTime.now().toString().split(" ")[0],
      to: DateTime.now().toString().split(" ")[0]
    ).then((value) {
      value.fold(
        (l) => setState(() => dataTabel = l), 
        (r) => _showSnackBar(r));
      setState(() => isLoading = false);
    });
  }

  void getDataByRange() {
    if (dateFrom == null && dateTo == null) return;
    setState(() => isLoading = true);
    getReportByRange(
      from: dateFrom.toString().split(" ")[0], 
      to: dateTo.toString().split(" ")[0]
    ).then((value) {
      value.fold(
        (l) => setState(() => dataTabel = l), 
        (r) => _showSnackBar(r)
      );
      setState(() => isLoading = false);
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  
  @override
  void initState() {
    super.initState();
    getAllData();
  }

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
        bottom: isLoading ? const PreferredSize(
          preferredSize: Size.fromHeight(6.0),
          child: LinearProgressIndicator(),
        ) : null,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const Text("Dari Tanggal"), 
                      Kalender(
                        lastDate: DateTime.now().subtract(const Duration(days: 1)),
                        result: (date) => setState(() => dateFrom = date),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      const Text("Sampai Tanggal"), 
                      Kalender(
                        firstDate: dateFrom?.add(const Duration(days: 1)),
                        lastDate: DateTime.now(),
                        result: (date) => setState(() => dateTo = date),
                      )
                    ],
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
                onPressed: getDataByRange,
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
    return dataTabel.asMap().entries.map((item) {
      return DataRow(cells: [
        DataCell(
          Center(
            child: Text(
              (item.key + 1).toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              DateFormat("dd MMMM yyyy - hh:mm").format(item.value.createdAt),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item.value.suhu,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item.value.ph,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item.value.salinitas.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              item.value.ketinggianAir.toString(),
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
