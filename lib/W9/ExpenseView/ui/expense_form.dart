import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/category_selector.dart';
import 'package:example/W9/ExpenseView/ui/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key});

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final textController = TextEditingController();
  final priceController = TextEditingController();
  ExpenseType? categoryInput;
  DateTime? dateInput;

  @override
  void dispose() {
    textController.dispose();
    priceController.dispose();
    super.dispose(); // call the parent
  }
  // void onCategorySelected(ExpenseType? newValue) {
  //   setState(() {
  //     categoryInput = newValue;
  //   });
  //   // categoryInput = newValue;
  // }
  void onCategorySelected(ExpenseType? newValue) {
    categoryInput = newValue;
  }

  void getDate(DateTime? date) {
    dateInput = date;
  }

  void onCancel() {
    Navigator.pop(context);
  }

  void onCreate() {
    if (!validateInput( context, title: textController.text, price: priceController.text, category: categoryInput, date: dateInput,)) return;
    ExpenseModel newExpense = ExpenseModel(
      title: textController.text,
      amount: double.parse(priceController.text),
      date: dateInput!,
      category: categoryInput!,
    );
    Navigator.pop<ExpenseModel>(context, newExpense);
  }

  bool validateInput(
    BuildContext context, {
    required String title,
    required String price,
    required ExpenseType? category,
    required DateTime? date,
  }) {
    String errorMessage = "";
    if (title.trim().isEmpty) {
      errorMessage = "Title is empty.";
    } else if (price.trim().isEmpty) {
      errorMessage = "Price is empty.";
    } else if (category == null) {
      errorMessage = "Please select the expense type.";
    } else if (date == null) {
      errorMessage = "Please select date";
    }

    if (errorMessage.isEmpty) {
      return true;
    } else {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: Text("Invalid input"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("okay"),
              ),
            ],
          );
        },
      );
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Create expense",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            spacing: 20,
            children: [
              TextField(
                controller: textController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  labelText: "Title",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              // ),
              TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: priceController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blueGrey),
                  ),
                  labelText: "Price",
                  prefixText: "\$ ",
                  labelStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              CategorySelector(category: onCategorySelected),
              DatePicker(selectedDate: getDate,)

            ],
          ),
          const SizedBox(height: 40),
          Row(
            spacing: 20,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onCancel,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 229, 229, 229),
                    padding: EdgeInsets.all(20),
                    elevation: 0,
                  ),
                  child: Center(
                    child: Text(
                      "Cancle",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 92, 89, 89),
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    padding: EdgeInsets.all(20),
                  ),
                  onPressed: onCreate,
                  child: Center(
                    child: Text(
                      "Create",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
