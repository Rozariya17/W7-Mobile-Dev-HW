import 'package:flutter/material.dart';
import '../../../data/mock_grocery_data.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  void onCreate() {
    
    // ---------------------------------------------
    // Navigate to the form screen using showModalBottomSheet
    // ---------------------------------------------

    // https://api.flutter.dev/flutter/material/showModalBottomSheet.html
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (allGroceryItems.isNotEmpty) {
      // ---------------------------------------------
      //  Loop on groceries with an ListView builder
      //  For each grocery items, create a GroceryTile (grocery_tile.dart)
      // ---------------------------------------------
      // https://api.flutter.dev/flutter/widgets/ListView-class.html
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [IconButton(onPressed: () => {}, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}
