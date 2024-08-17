// Imports the Flutter test package, which provides tools for writing and
// running unit tests.
import 'package:flutter_test/flutter_test.dart';
import 'package:kindra_test/controller/item_controller.dart';

void main() {
  group('ItemController', () {
    late ItemController controller;

    setUp(() {
      controller = ItemController();
    });

    test('should add an item', () {
      final itemText = 'New Item';
      controller.addItem(itemText);
      expect(controller.items.length, 1);
      expect(controller.items[0].text, itemText);
    });

    test('should add and delete an item', () {
      final itemText = 'New Item';
      controller.addItem(itemText);
      expect(controller.items.length, 1);
      controller.deleteItem(0);
      expect(controller.items.length, 0);
    });

    test('should add and  update an item', () {
      final itemText = 'New Item';
      controller.addItem(itemText);
      expect(controller.items[0].text, itemText);
      controller.updateItem(0, 'Updated Item');
      expect(controller.items[0].text, 'Updated Item');
    });
  });
}
