import 'package:flutter/material.dart';
import 'package:kindra_test/controllers/item_list_controller.dart';
import 'package:kindra_test/views/home_view.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final ItemListController itemListController = ItemListController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeView(itemListController: itemListController), // Uses separate home view
    );
  }
}

void main() {
  runApp(MyApp());
}
