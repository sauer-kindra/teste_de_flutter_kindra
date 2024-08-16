import 'package:kindra_test/views/home_view.dart';
import 'package:kindra_test/controllers/item_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Should ADD and DELETE items', (WidgetTester tester) async {
    final itemListController = ItemListController();
    await tester.pumpWidget(HomeView(itemListController: itemListController));

    // Checks if Items List is empty to begin with
    expect(find.text('Enter item'), findsOneWidget);
    expect(find.byType(ListTile), findsNothing);

    // Checks if Text Field and ADD button is working
    await tester.enterText(find.byType(TextField), 'Test Item'); // inputs text on text field
    await tester.tap(find.text('Add')); // clicks ADD button
    await tester.pump(); // rebuilds widget to apply changes
    expect(find.text('Test Item'), findsOneWidget); // checks if item was added
    expect(find.byType(ListTile), findsOneWidget); // checks if item was added

    // Checks if DELETE button is working
    await tester.tap(find.byIcon(Icons.delete)); // clicks DELETE icon button
    await tester.pump(); // rebuilds widget to apply changes
    expect(find.byType(ListTile), findsNothing); // checks if item was deleted
  });
}
