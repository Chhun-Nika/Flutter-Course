import 'package:example/W12/grocery_app/ui/groceries/grocery_form.dart';
import 'package:flutter/material.dart';

import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  void onCreate() async {
    final newGrocery = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GroceryForm()),
    );

    if (newGrocery != null) {
      setState(() {
        dummyGroceryItems.add(newGrocery);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
      // TODO-1 - Display groceries with an Item builder and  LIst Tile
      content = ListView.builder(
        itemCount: dummyGroceryItems.length,
        itemBuilder: (context, index) =>
            GroceryTile(grocery: dummyGroceryItems[index]),
      );
      // content = const Text('TODO');
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: onCreate, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
    // TODO-2 - Display groceries with an Item builder and  LIst Tile
    return ListTile(
      // tileColor: Colors.amber,
      // contentPadding: EdgeInsets.only(top: 8, bottom: 8, left: 20, right: 20),
      leading: Container(
        height: 15,
        width: 15,
        decoration: BoxDecoration(color: grocery.category.color),
      ),
      title: Text(grocery.name),
      trailing: Text(
        grocery.quantity.toString(),
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
