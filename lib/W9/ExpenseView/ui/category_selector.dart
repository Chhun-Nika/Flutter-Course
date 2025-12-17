import 'package:example/W9/ExpenseView/model/expense.dart';
import 'package:flutter/material.dart';

class CategorySelector extends StatelessWidget {
  final ValueChanged<ExpenseType> category;
  const CategorySelector({super.key, required this.category});
  void onSelected(ExpenseType? c) {
    category(c!);
  }

  @override
  Widget build(BuildContext context) {
    print("rebuilding category");
    return DropdownMenu(
      // could not find the normal decoration for the dropdownMenu
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueGrey),
        ),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
      ),
      onSelected: onSelected,
      width: double.infinity,
      enableSearch: true,
      label: Text("Category", style: TextStyle(color: Colors.blueGrey)),
      dropdownMenuEntries: ExpenseType.values
          .map(
            (category) =>
                DropdownMenuEntry(value: category, label: category.name),
          )
          .toList(),
    );
  }
}

// class CategorySelector extends StatefulWidget {
//   final ValueChanged<ExpenseType> category;
//   const CategorySelector({super.key, required this.category});

//   @override
//   State<CategorySelector> createState() => _CategorySelectorState();
// }

// class _CategorySelectorState extends State<CategorySelector> {
//   void onSeleted(ExpenseType? category) {
//     // widget.category(category!);
//     setState(() {
//       widget.category(category!);
//     });
//     print(category);
//   }
//   @override
//   Widget build(BuildContext context) {
//     print("rebuild cat.");
//     return DropdownMenu(
//       onSelected: onSeleted,
//       width: double.infinity,
//       enableSearch: true,
//       label: Text("Category", style: TextStyle(color: Colors.blueGrey),),
//       dropdownMenuEntries: ExpenseType.values
//           .map(
//             (category) =>
//                 DropdownMenuEntry(value: category, label: category.name),
//           )
//           .toList(),
//     );
//   }
// }
