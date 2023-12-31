import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../theme/app_color.dart';

class Kalender extends StatefulWidget {
  const Kalender({super.key, this.firstDate, this.lastDate, this.result});
  final DateTime? firstDate;
  final DateTime? lastDate;
  final void Function(DateTime?)? result;

  @override
  State<Kalender> createState() => _KalenderState();
}

class _KalenderState extends State<Kalender> {
  DateTime? _selectedDate;
  String _buttonText = 'Pilih Tanggal';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: AppColor.bg),
            onPressed: () async {
              final date = await showCalendarDatePicker2Dialog(
                context: context,
                config: CalendarDatePicker2WithActionButtonsConfig(
                  dayTextStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                  calendarType: CalendarDatePicker2Type.single,
                  selectedDayHighlightColor: Colors.purple[800],
                  closeDialogOnCancelTapped: true,
                  firstDayOfWeek: 1,
                  firstDate: widget.firstDate,
                  lastDate: widget.lastDate
                ),
                dialogSize: const Size(325, 400),
                borderRadius: BorderRadius.circular(15),
                value: _selectedDate != null ? [_selectedDate!] : [],
                dialogBackgroundColor: Colors.white,
              );

              if (date != null && date.isNotEmpty) {
                setState(() {
                  _selectedDate = date[0];
                  _buttonText = _formatDate(date[0]!);
                });
                if (widget.result != null) {
                  widget.result!(date[0]);
                }
              }
            },
            child: Text(
              _buttonText,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final dateFormat = DateFormat.yMMMMd('id_ID');
    return dateFormat.format(date);
  }
}
