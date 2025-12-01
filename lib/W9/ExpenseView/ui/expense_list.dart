import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/expense_card.dart';
import 'package:flutter/material.dart';

class ExpenseList extends StatelessWidget {
  final List<ExpenseModel> expensesData;
  const ExpenseList({super.key, required this.expensesData});
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ...expensesData.map((e) => ExpenseCard(expense: e,))
    ]);
  }
}
