import 'package:flutter/material.dart';
import 'view/item_crud_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple CRUD App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ItemListView(),
    );
  }
}
