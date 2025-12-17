import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/expense_card.dart';
import 'package:example/W9/ExpenseView/ui/expense_form.dart';
import 'package:example/W9/ExpenseView/ui/expenses_statistics.dart';
import 'package:flutter/material.dart';

class ExpenseView extends StatefulWidget {
  final List<ExpenseModel> expenses;
  const ExpenseView({super.key, required this.expenses});

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  // final List<ExpenseModel> _expenses = [
  //   ExpenseModel(
  //     title: "Pizza",
  //     amount: 10,
  //     date: DateTime.now(),
  //     category: ExpenseType.food,
  //   ),
  //   ExpenseModel(
  //     title: "Notebook",
  //     amount: 2.5,
  //     date: DateTime.now(),
  //     category: ExpenseType.work,
  //   ),
  //   ExpenseModel(
  //     title: "Spa",
  //     amount: 12.5,
  //     date: DateTime.now(),
  //     category: ExpenseType.leisure,
  //   ),
  //   ExpenseModel(
  //     title: "Plane Ticket",
  //     amount: 12.5,
  //     date: DateTime.now(),
  //     category: ExpenseType.travel,
  //   ),
  // ];
  void onClick(BuildContext context) async {
    ExpenseModel? newExpense = await showModalBottomSheet<ExpenseModel>(
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return ExpenseForm();
      },
    );
    if (newExpense != null) {
      setState(() {
        widget.expenses.add(newExpense);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // return ListView(
    //   children: [..._expenses.map((e) => ExpenseCard(expense: e))],
    // );
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense View", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              onPressed: () => {onClick(context)},
              icon: Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
      // body: Container(
      //   padding: EdgeInsets.all(20),
      //   child: ListView.builder(
      //     itemCount: _expenses.length,
      //     itemBuilder: (contex, index) =>
      //         ExpenseCard(expense: _expenses[index]),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ExpensesStatistics(expenses: widget.expenses,),
            Expanded(child: ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (contex, index) =>
                  ExpenseCard(expense: widget.expenses[index]),
            ),)
          ],
        ),
      ),
      backgroundColor: Color(0xFFBBDEFB),
    );
  }
}
