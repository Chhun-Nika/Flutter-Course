import 'package:example/W9/ExpenseView/data/expense_data.dart';
import 'package:example/W9/ExpenseView/ui/expense_list.dart';
import 'package:flutter/material.dart';

final data = registeredExpenses;
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: ExpenseView(expenses: data)
    ));
}
