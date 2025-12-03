import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/expenses/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatefulWidget {
  // final List<ExpenseModel> expensesData;
  const ExpenseView({super.key});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  final List<ExpenseModel> _expenses = [
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
  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [..._expenses.map((e) => ExpenseCard(expense: e))],
    // );
    return ListView.builder(
      itemCount: _expenses.length,
      itemBuilder: (contex, index) => ExpenseCard(expense: _expenses[index]),
    );
  }
}
