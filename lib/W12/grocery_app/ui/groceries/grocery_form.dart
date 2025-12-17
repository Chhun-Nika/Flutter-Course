import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/grocery.dart';

var uuid = Uuid();

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() {
    return _NewItemState();
  }
}

class _NewItemState extends State<NewItem> {
  // Default settings
  static const defautName = "New grocery";
  static const defaultQuantity = 1;
  static const defaultCategory = GroceryCategory.fruit;

  // Inputs
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  GroceryCategory _selectedCategory = defaultCategory;

  @override
  void initState() {
    super.initState();

    // Initialize intputs with default settings
    _nameController.text = defautName;
    _quantityController.text = defaultQuantity.toString();
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the controlers
    _nameController.dispose();
    _quantityController.dispose();
  }

  void onReset() {
    // Will be implemented later - Reset all fields to the initial values
    setState(() {
      _nameController.text = defautName;
      _quantityController.text = defaultQuantity.toString();
      _selectedCategory = defaultCategory;
    });
  }

  void onAdd() {
    // Will be implemented later - Create and return the new grocery
    Grocery newGrocery = Grocery(
      id: uuid.v4(),
      name: _nameController.text,
      quantity: int.parse(_quantityController.text),
      category: _selectedCategory,
    );
    Navigator.pop<Grocery>(context, newGrocery);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              onTap: () {
                if (_nameController.text == defautName) {
                  _nameController.clear();
                }
              },
              controller: _nameController,
              maxLength: 50,
              decoration: const InputDecoration(label: Text('Name')),
            ),
            const SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    controller: _quantityController,
                    decoration: const InputDecoration(label: Text('Quantity')),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonFormField<GroceryCategory>(
                    initialValue: _selectedCategory,
                    items: GroceryCategory.values
                        .map<DropdownMenuItem<GroceryCategory>>(
                          (cat) => DropdownMenuItem(
                            value: cat,
                            child: Row(
                              children: [
                                Container(
                                  height: 15,
                                  width: 15,
                                  color: cat.color,
                                ),
                                const SizedBox(width: 10),
                                Text(cat.label),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(onPressed: onReset, child: const Text('Reset')),
                ElevatedButton(onPressed: onAdd, child: const Text('Add Item')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
