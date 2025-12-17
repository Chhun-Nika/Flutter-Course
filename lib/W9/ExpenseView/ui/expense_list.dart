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
    Widget? content = const Center(child: Text("No expense added yet."));
    if (widget.expenses.isNotEmpty) {
      content = Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            ExpensesStatistics(expenses: widget.expenses),
            Expanded(
              child: ListView.builder(
                itemCount: widget.expenses.length,
                itemBuilder: (contex, index) {
                  final expense = widget.expenses[index];
                  return Dismissible(
                    key: Key(expense.id),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        widget.expenses.removeAt(index);
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: Duration(seconds: 3),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Expense Deleted"),
                              TextButton(
                                onPressed: () => {
                                  setState(() {
                                    widget.expenses.insert(index, expense);
                                  }),
                                },
                                child: Text(
                                  "UNDO",
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    child: ExpenseCard(expense: expense),
                  );
                },
              ),
            ),
          ],
        ),
      );
    }
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
      body: content,
      backgroundColor: Color(0xFFBBDEFB),
    );
  }
}
