import 'package:flutter/material.dart';
import '../controller/item_controller.dart';

/// The ItemListView widget is a stateful widget that represents the main UI for
/// the CRUD app.
class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

/// The state class for the ItemListView widget, which holds the UI elements and
/// interaction logic.
class _ItemListViewState extends State<ItemListView> {
  final ItemController controller = ItemController();
  final TextEditingController textController = TextEditingController();

  // The build method is where the UI is defined. It returns a Scaffold
  // containing the UI structure.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple CRUD App'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textController,
            decoration: const InputDecoration(labelText: 'Enter item'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                controller.addItem(textController.text);
                textController.clear();
              });
            },
            child: const Text('Add'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: controller.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(controller.items[index].text),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          setState(() {
                            String newValue = 'Updated Item';
                            controller.updateItem(index, newValue);
                          });
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            controller.deleteItem(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
