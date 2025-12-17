import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/category_card.dart';
import 'package:flutter/material.dart';

class ExpensesStatistics extends StatelessWidget {
  final List<ExpenseModel> expenses;
  const ExpensesStatistics({super.key, required this.expenses});

  double getTotalPrice (ExpenseType category) {
    double totalPrice = 0;
    for (var e in expenses) {
      if (e.category == category) {
        totalPrice += e.amount;
      }
    }
    return totalPrice;

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ...ExpenseType.values.map((c) => CategoryCard(icon: ExpenseModel.getIcon(c), totalPrice: getTotalPrice(c)))
        ],
      ),
    );
  }
}
