import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:example/W9/ExpenseView/ui/expenses/expense_list.dart';
import 'package:flutter/material.dart';

class ExpenseApp extends StatefulWidget {
  const ExpenseApp({super.key});

  @override
  State<ExpenseApp> createState() => _ExpenseAppState();
}

class _ExpenseAppState extends State<ExpenseApp> {
  final textController = TextEditingController();
  final priceController = TextEditingController();
  String? titleInput;
  ExpenseType? categoryInput;
  double? priceInput;

  @override
  // void initState() {
  //   super.initState();

  //   textController.addListener(setTitle);
  // }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  // void setTitle() {
  //   titleInput = textController.text;
  // }

  // void setPrice() {
  //   priceInput = double.tryParse(priceController.text);
  // }

  void onCreate () {
    Navigator.pop(context);
    titleInput = textController.text;
    priceInput = double.tryParse(priceController.text);
    print(titleInput);

  }

  void onClick(BuildContext context) {
    showModalBottomSheet(
      // isScrollControlled: true,
      context: context,
      builder: (context) {
        return SizedBox(
          // height: 00,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  children: [
                    // SizedBox(
                    // width: 250,
                    TextField(
                      // maxLength: 20,
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
                    // ),
                    const SizedBox(height: 20),
                    // DropdownButton(
                    //   hint: Text("Select Category"),
                    //   isExpanded: true,
                    //   value: categoryInput,
                    //   items: ExpenseType.values.map<DropdownMenuItem<ExpenseType>>((
                    //     ExpenseType value,
                    //   ) {
                    //     return DropdownMenuItem(
                    //       value: value,
                    //       child: Text(value.name),
                    //     );
                    //   }).toList(),
                    //   onChanged: (ExpenseType? newValue) {
                    //     setState(() {
                    //       categoryInput = newValue;
                    //       // print(categoryInput);
                    //     });
                    //   },
                    // ),
                    // SizedBox(
                    // width: 250,
                    TextField(
                      controller: priceController,
                      obscureText: false,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        // border: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueAccent)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blueGrey),
                        ),
                        labelText: "Price",
                        labelStyle: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    // ),
                    const SizedBox(height: 20),
                    DropdownMenu(
                      enableSearch: true,
                      width: double.infinity,
                      hintText: "Select Category",
                      label: Text(
                        "Category",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                      dropdownMenuEntries: ExpenseType.values
                          .map<DropdownMenuEntry<ExpenseType>>((
                            ExpenseType value,
                          ) {
                            return DropdownMenuEntry(
                              value: value,
                              label: value.name,
                            );
                          })
                          .toList(),
                      onSelected: (ExpenseType? newValue) {
                        setState(() {
                          categoryInput = newValue;
                        });
                      },
                    ),

                    // Text(categoryInput!.name)
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: onCreate,
                  child: Center(child: Text("Create New Expense")),
                  // ElevatedButton.styleFrom(padding: )
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
              onPressed: () => {onClick(context)},
              icon: Icon(Icons.add),
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Container(padding: EdgeInsets.all(20), child: ExpenseView()),
      backgroundColor: Color(0xFFBBDEFB),
    );
  }
}
