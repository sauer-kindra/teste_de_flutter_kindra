import 'package:flutter/material.dart';

class EditItemDialog extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const EditItemDialog({
    super.key,
    required this.controller,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Item'),
      content: TextField(
        key: const Key('edit-item-text-field'),
        controller: controller,
        decoration: const InputDecoration(hintText: 'Enter new value'),
      ),
      actions: [
        ElevatedButton(
          onPressed: onConfirm,
          child: const Text('Confirm'),
        ),
        TextButton(
          onPressed: onCancel,
          child: const Text('Cancel'),
        ),
      ],
    );
  }
}
