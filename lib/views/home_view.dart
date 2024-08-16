import 'package:flutter/material.dart';
import '../controllers/item_list_controller.dart';
import '../views/edit_item_dialog.dart';

class HomeView extends StatefulWidget {
  final ItemListController itemListController;

  const HomeView({super.key, required this.itemListController});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Simple CRUD App')),
        body: Column(
          children: [
            _buildTextField(),
            _buildAddButton(),
            _buildItemsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField() {
    return TextField(
      key: const Key('add-item-text-field'),
      controller: widget.itemListController.addItemController,
      decoration: const InputDecoration(labelText: 'Enter item'),
    );
  }

  Widget _buildAddButton() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          widget.itemListController.addItem();
        });
      },
      child: const Text('Add'),
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    return ListTile(
      title: Text(widget.itemListController.items[index].getContent()),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildEditButton(context, index),
          _buildDeleteButton(index),
        ],
      ),
    );
  }

  Widget _buildItemsList() {
    return Expanded(
      child: ListView.builder(
          itemCount: widget.itemListController.items.length,
          itemBuilder: (context, index) {
            return _buildItem(context, index);
          }),
    );
  }

  Widget _buildEditButton(BuildContext context, int index) {
    return IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () {
        // On pressed creates a popup dialog to update item string
        _buildEditDialog(context, index);
      },
    );
  }

  Widget _buildDeleteButton(int index) {
    return IconButton(
      icon: const Icon(Icons.delete),
      onPressed: () {
        setState(() {
          widget.itemListController.deleteItem(index);
        });
      },
    );
  }

  void _buildEditDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditItemDialog(
          // opens edit popup dialog
          controller: widget.itemListController.editItemController,
          onConfirm: () {
            setState(() {
              widget.itemListController.updateItem(index);
            });
            Navigator.of(context).pop(); // Closes the dialog and saves the updated string
          },
          onCancel: () {
            Navigator.of(context).pop(); // Closes the dialog without saving
          },
        );
      },
    );
  }
}
