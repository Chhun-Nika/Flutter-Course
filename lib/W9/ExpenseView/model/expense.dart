import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum ExpenseType { food, travel, leisure, work } 
// enum


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

  static IconData getIcon (ExpenseType category) {
    switch (category) {
      case ExpenseType.food:
        return Icons.ramen_dining;
      case ExpenseType.leisure:
        return Icons.kayaking;
      case ExpenseType.travel:
        return Icons.airplane_ticket_rounded;
      case ExpenseType.work:
        return Icons.business_center_rounded;
    }
  }
}
