import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../models/grocery.dart';

var uuid = Uuid();

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() {
    return _GroceryFormState();
  }
}

class _GroceryFormState extends State<GroceryForm> {
  // Default settings
  static const defautName = "New grocery";
  static const defaultQuantity = 1;
  static const defaultCategory = GroceryCategory.fruit;

  // From key
  final _formKey = GlobalKey<FormState>();
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
    _formKey.currentState!.reset();
    setState(() {
      _nameController.text = defautName;
      _quantityController.text = defaultQuantity.toString();
      _selectedCategory = defaultCategory;
    });
  }

  void onAdd() {
    // Will be implemented later - Create and return the new grocery
    if (_formKey.currentState!.validate()) {
      Grocery newGrocery = Grocery(
        id: uuid.v4(),
        name: _nameController.text,
        quantity: int.parse(_quantityController.text),
        category: _selectedCategory,
      );
      Navigator.pop<Grocery>(context, newGrocery);
    }
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a name.";
    }
    if (value.length < 10 || value.length > 50) {
      return "Enter a text btw 10 to 50 characters";
    }
    return null;
  }

  String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter quantity";
    }

    if (int.tryParse(value) == null) {
      return "Invalid input. Enter numbers only";
    }

    final parsedNumber = int.parse(value);
    if (parsedNumber < 10 || parsedNumber > 50) {
      return "Value shall be between 10 to 50";
    }

    return null;
  }

  String? validateCategory(GroceryCategory? value) {
    if (value == GroceryCategory.dairy ||
        value == GroceryCategory.convenience ||
        value == GroceryCategory.hygiene ||
        value == GroceryCategory.other) {
      return "Please select something to eat.";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add a new item')),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                onTap: () {
                  if (_nameController.text == defautName) {
                    _nameController.clear();
                  }
                },
                validator: validateName,
                controller: _nameController,
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      validator: validateQuantity,
                      controller: _quantityController,
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      validator: validateCategory,
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
                  ElevatedButton(
                    onPressed: onAdd,
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
