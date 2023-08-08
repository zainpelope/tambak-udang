import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tambak_undang/models/report_model.dart';
import 'package:tambak_undang/services/sharedpref.dart';
import 'package:tambak_undang/tabel/data_tabel.dart';
import 'package:tambak_undang/theme/app_color.dart';

import '../theme/img_string.dart';

class SemuaDataDashboard extends StatelessWidget {
  const SemuaDataDashboard({Key? key, required this.currentReport}) : super(key: key);
  final ReportModel? currentReport;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 200.0,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              left: 10,
              top: 10,
              right: 10,
            ),
            margin: const EdgeInsets.symmetric(
              horizontal: 25,
            ),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 5.0,
                  spreadRadius: 1.0,
                  offset: Offset(1, 1),
                ),
              ],
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat("EEEE, dd MMMM yyyy").format(DateTime.now()),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Divider(
                  thickness: 1.5,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("TEMP "),
                          SizedBox(
                            height: 20,
                          ),
                          Text("SALINITAS "),
                          SizedBox(
                            height: 20,
                          ),
                          Text("pH "),
                          SizedBox(
                            height: 20,
                          ),
                          Text("KETINGGIAN AIR "),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(" : ${currentReport?.suhu ?? "..."} C "),
                          SizedBox(
                            height: 20,
                          ),
                          Text(" : ${currentReport?.salinitas ?? "..."} ppt "),
                          SizedBox(
                            height: 20,
                          ),
                          Text(" : ${currentReport?.ph ?? "..."} "),
                          SizedBox(
                            height: 20,
                          ),
                          Text(" : ${currentReport?.ketinggianAir ?? "..."} cm"),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          margin: const EdgeInsets.only(
            top: 10,
          ),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF8FCFFF,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>  DataTabel(),
                ),
              );
            },
            child: const Text(
              "Data Tabel",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
