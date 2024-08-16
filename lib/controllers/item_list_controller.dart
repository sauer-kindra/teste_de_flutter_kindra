import 'package:flutter/material.dart';

import '../models/Item.dart';

class ItemListController {
  List<Item> items = [];
  final TextEditingController addItemController = TextEditingController();
  final TextEditingController editItemController = TextEditingController();

  void addItem() {
    Item newItem = Item(addItemController.text);
    items.add(newItem);
    addItemController.clear();
  }

  void deleteItem(int index) {
    items.removeAt(index);
  }

  void updateItem(int index) {
    items[index].setContent(editItemController.text);
    editItemController.clear();
  }
}
