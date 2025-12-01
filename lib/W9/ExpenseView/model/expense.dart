
import 'package:flutter/src/material/dropdown.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType { food, travel, leisure, work;

  static List<DropdownMenuItem<Object>>? map(DropdownMenuItem<ExpenseType> Function(ExpenseType category) param0) {} }


var uuid = Uuid();

class ExpenseModel {
  final String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType category;

  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();
}
