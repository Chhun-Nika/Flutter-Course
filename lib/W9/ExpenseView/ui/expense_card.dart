import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseCard extends StatelessWidget {
  final ExpenseModel expense;
  const ExpenseCard({super.key, required this.expense});

  String formattedDate (DateTime date) {
    final formattedDate = DateFormat.yMd().format(date);
    return formattedDate.toString();
  }

  // IconData getIcon (ExpenseType category) {
  //   switch (category) {
  //     case ExpenseType.food:
  //       return Icons.ramen_dining;
  //     case ExpenseType.leisure:
  //       return Icons.kayaking;
  //     case ExpenseType.travel:
  //       return Icons.airplane_ticket_rounded;
  //     case ExpenseType.work:
  //       return Icons.business_center_rounded;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                expense.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                ),
              ),
              Text("\$${expense.amount.toString()}"),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(ExpenseModel.getIcon(expense.category)),
              const SizedBox(width: 6,),
              Text(formattedDate(expense.date))]),
        ],
      ),
    );
  }
}
