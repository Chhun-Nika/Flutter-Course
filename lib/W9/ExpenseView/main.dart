import 'package:example/W9/ExpenseView/data/expense_data.dart';
import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/expense_list.dart';
import 'package:flutter/material.dart';

List<String> num = ['one', 'two'];

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: ExpenseApp()));
}

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  String? dropDownValue;
  final textController = TextEditingController();
  String? titleInput;

  @override
  void initState() {
    super.initState();

    textController.addListener(setTitle);
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  void setTitle() {
    titleInput = textController.text;
  }

  

  void onClick() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          // height: 00,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Input your expense",
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
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        // width: 250,
                        child: TextField(
                          controller: textController,
                          obscureText: false,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),
                            labelText: "Title",
                            labelStyle: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20,),
                      DropdownButton(
                        hint: Text("Select Category"),
                        isExpanded: true,
                        value: dropDownValue,
                        items: num.map<DropdownMenuItem<String>>((
                          String value,
                        ) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropDownValue = newValue;
                            // print(dropDownValue);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense View", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueAccent,
        centerTitle: false,
        actions: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(0, 0, 10, 0),
            child: IconButton(
              onPressed: onClick,
              icon: Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ExpenseList(expensesData: registeredExpenses),
      ),
      backgroundColor: Color(0xFFBBDEFB),
    );
  }
}
