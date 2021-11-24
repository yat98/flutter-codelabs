import 'package:flutter/material.dart';
import 'package:fooderlich/models/grocery_manager.dart';
import 'package:fooderlich/screens/empty_grocery_screen.dart';
import 'package:fooderlich/screens/grocery_item_screen.dart';
import 'package:fooderlich/screens/grocery_list_screen.dart';
import 'package:provider/provider.dart';

class GroceryScreen extends StatelessWidget {
  const GroceryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          final manager = Provider.of<GroceryManager>(
            context,
            listen: false,
          );
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroceryItemScreen(
                        onCreate: (item) {
                          manager.addItem(item);
                          Navigator.pop(context);
                        },
                        onUpdate: (item) {},
                      )));
        },
      ),
      body: buildGrocery(),
    );
  }

  Widget buildGrocery() {
    return Consumer<GroceryManager>(builder: (context, groceryManager, child) {
      if (groceryManager.groceryItems.isNotEmpty) {
        return GroceryListScreen(manager: groceryManager);
      } else {
        return const EmptyGroceryScreen();
      }
    });
  }
}
