import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final ValueChanged<DateTime> selectedDate;
  const DatePicker({super.key, required this.selectedDate});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  final TextEditingController _dateController = TextEditingController();
  DateTime? selectedDate;

  String formattedDate (DateTime date) {
    final formattedDate = DateFormat.yMd().format(date);
    return formattedDate.toString();
  }

  Future<void> _selectDate() async {
    final DateTime? pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    setState(() {
      _dateController.text = formattedDate(pickDate!);
      selectedDate = pickDate;
    });
    widget.selectedDate(selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _dateController,
      readOnly: true,
      decoration: InputDecoration(
        label: Text("Date"),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        prefixIcon: Icon(Icons.calendar_today),
      ),
      onTap: _selectDate,
    );
  }
}
