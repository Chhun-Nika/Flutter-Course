import 'package:example/W9/ExpenseView/model/expense.dart';

List<ExpenseModel> registeredExpenses = [
  ExpenseModel(
    title: "Pizza",
    amount: 10,
    date: DateTime.now(),
    category: ExpenseType.food,
  ),
  ExpenseModel(
    title: "Notebook",
    amount: 2.5,
    date: DateTime.now(),
    category: ExpenseType.work,
  ),
  ExpenseModel(
    title: "Spa",
    amount: 12.5,
    date: DateTime.now(),
    category: ExpenseType.leisure,
  ),
  ExpenseModel(
    title: "Plane Ticket",
    amount: 12.5,
    date: DateTime.now(),
    category: ExpenseType.travel,
  ),
];
