import 'package:uuid/uuid.dart';

enum ExpenseType {food, travel, leisure, work}

var uuid = Uuid();
class Expense {
  final String id;
  String title;
  double amount;
  DateTime date;
  ExpenseType category;


  Expense({required this.title, required this.amount, required this.date, required this.category}): id = uuid.v4();
}