import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Grafik extends StatelessWidget {
  final List<Tambang> data = [
    Tambang(parameter: "pH", literatur: 7, color: charts.ColorUtil.fromDartColor(Colors.yellow)),
    Tambang(parameter: "Suhu", literatur: 28, color: charts.ColorUtil.fromDartColor(Colors.red)),
    Tambang(parameter: "Salinitas", literatur: 35 , color: charts.ColorUtil.fromDartColor(Colors.brown)),
    Tambang(parameter: "Ketinggian air", literatur: 120, color: charts.ColorUtil.fromDartColor(Colors.blue)),
  ];

  @override
  Widget build(BuildContext context) {
    List<charts.Series<Tambang, String>> series = [
      charts.Series(
        id: "Products",
        data: data,
        domainFn: (Tambang series, _) => series.parameter, 
        measureFn: (Tambang series, _) => series.literatur,
        colorFn: (Tambang series, _) => series.color,
      )
    ];

    return SafeArea(
      child: Center(
        child: Container(
          height: 400,
          padding: const EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: charts.BarChart(
                      series,
                      animate: true,
                      vertical: true, // Set to true for vertical bar chart
                      primaryMeasureAxis: const charts.NumericAxisSpec(
                        // Customize the vertical axis (Y-axis)
                        tickProviderSpec: charts.BasicNumericTickProviderSpec(
                          desiredTickCount: 6, // Number of ticks on Y-axis
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Tambang {
  final String parameter;
  final int literatur;
  final charts.Color color;

  Tambang({
    required this.parameter,
    required this.literatur,
    required this.color,
  });
}
