// ---------------------------------------------
// Create a new statefull widget : GroceryForm
// ---------------------------------------------

// The form shall be composed of 2 text fields:
// -	Name of the grocery item
//-	Quantity (number only)

// ⚠️  For now we don’t select the grocery type, we assume it’s always food

// The form shall be composed of 2 buttons:
//-	Cancel button
// -	Add item button

import 'package:flutter/material.dart';
import '../../../models/grocery.dart';

class GroceryForm extends StatefulWidget {
  const GroceryForm({super.key});

  @override
  State<GroceryForm> createState() => _GroceryFormState();
}

class _GroceryFormState extends State<GroceryForm> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();

  void _resetForm() {
    _nameController.clear();
    _quantityController.clear();
  }

  void _addItem() {
    final name = _nameController.text.trim();
    final quantity = int.tryParse(_quantityController.text.trim());

    if (name.isEmpty || quantity == null) return;

    final newItem = GroceryItem(
      id: DateTime.now().toString(),
      name: name,
      quantity: quantity,
      category: GroceryCategory.other,
    );

    Navigator.of(context).pop(newItem);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 24,
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "Add a new item",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          TextField(
            controller: _nameController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "name"),
          ),

          const SizedBox(height: 8),

          TextField(
            controller: _quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "quantity"),
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(onPressed: _resetForm, child: const Text("reset")),

              const SizedBox(width: 8),

              ElevatedButton(
                onPressed: _addItem,
                child: const Text("add item"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
