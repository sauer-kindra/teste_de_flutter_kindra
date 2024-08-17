import '/model/item.dart';

/// Class responsible for managing the CRUD logic for items.
class ItemController {
  final List<Item> _items = [];

  List<Item> get items => _items;

  void addItem(String text) {
    _items.add(Item(text));
  }

  void deleteItem(int index) {
    _items.removeAt(index);
  }

  void updateItem(int index, String newValue) {
    _items[index].text = newValue;
  }
}
