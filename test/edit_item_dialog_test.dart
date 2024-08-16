import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kindra_test/controllers/item_list_controller.dart';
import 'package:kindra_test/views/home_view.dart';

void main() {
  testWidgets('Should EDIT an Item', (WidgetTester tester) async {
    final itemListController = ItemListController();
    itemListController.addItemController.text = 'Item to be edited';
    itemListController.addItem(); // adds an item for testing

    await tester.pumpWidget(HomeView(itemListController: itemListController));

    expect(find.text('Item to be edited'), findsOneWidget); // item to be edit is present

    await tester.tap(find.byIcon(Icons.edit)); // clicks edit button
    await tester.pumpAndSettle(); // waits for the dialog to open

    expect(find.text('Edit Item'), findsOneWidget); // dialog is open ..
    expect(find.byKey(const Key('edit-item-text-field')), findsOneWidget); // ..with edit text field

    await tester.enterText(
        find.byKey(const Key('edit-item-text-field')), 'Item was Updated successfully');
    await tester.tap(find.text('Confirm'));
    await tester.pumpAndSettle();

    expect(find.text('Item was Updated successfully'), findsOneWidget); // item was updated
    expect(find.text('Item to be edited'), findsNothing); // to ensure previous text is not present
  });
}
