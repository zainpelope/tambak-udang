import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tambak_undang/models/report_model.dart';

class TabelVolume extends StatelessWidget {
  const TabelVolume({super.key, required this.data});
  final List<ReportModel> data;

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
    return data.asMap().entries.map((item) {
      return DataRow(cells: [
        DataCell(
          Text(
            (item.key + 1).toString(),
          ),
        ),
        DataCell(
          Text(
            "${item.value.ketinggianAir.toString()} cm",
          ),
        ),
        DataCell(
          Text(
            DateFormat("dd MMMM yyyy - hh:mm").format(item.value.createdAt),
          ),
        ),
      ]);
    }).toList();
  }
}
