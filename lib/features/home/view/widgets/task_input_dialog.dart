import 'package:flutter/material.dart';

class TaskInputDialog extends StatefulWidget {
  @override
  _TaskInputDialogState createState() => _TaskInputDialogState();
}

class _TaskInputDialogState extends State<TaskInputDialog> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Task name'),
      content: TextField(
        controller: _nameController,
        decoration: const InputDecoration(hintText: 'Name'),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Dismiss the dialog
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            String name = _nameController.text;
            Navigator.of(context).pop(name); // Pass the entered name as the result
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}