import 'package:flutter_test/flutter_test.dart';
import 'package:kindra_test/controllers/item_list_controller.dart';

void main() {
  group('ItemListController', () {
    late ItemListController itemListController;

    setUp(() {
      itemListController = ItemListController();
    });

    test('Should ADD a New Item to the list of items', () {
      itemListController.addItemController.text = 'New Item';
      itemListController.addItem();
      expect(itemListController.items.length, 1);
      expect(itemListController.items[0].getContent(), 'New Item');
    });

    test('Should DELETE an Item from the list of items', () {
      itemListController.addItemController.text = 'Item to be Deleted';
      itemListController.addItem();
      itemListController.deleteItem(0);
      expect(itemListController.items.length, 0);
    });

    test('Should UPDATE an Item from the list of items', () {
      itemListController.addItemController.text = 'Item to be Updated';
      itemListController.addItem();
      itemListController.editItemController.text = 'Item Updated successfully';
      itemListController.updateItem(0);
      expect(itemListController.items[0].getContent(), 'Item Updated successfully');
    });
  });
}
