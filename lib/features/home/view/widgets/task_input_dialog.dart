import 'package:flutter/material.dart';
import 'package:repeat_master/modals/task_modal.dart';

class TaskInputDialog extends StatefulWidget {
  @override
  _TaskInputDialogState createState() => _TaskInputDialogState();
}

class _TaskInputDialogState extends State<TaskInputDialog> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Task name'),
      content: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(hintText: 'Name'),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: _descController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Description'),
          ),
        ],
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
            String desc = _descController.text;
            final task = TaskModal(
                title: name,
                isDone: false,
                description: desc,
                dateTime: DateTime.now(),
                id: DateTime.now().toString(),
                rating: 5);
            Navigator.of(context)
                .pop(task); // Pass the entered name as the result
          },
          child: const Text('Done'),
        ),
      ],
    );
  }
}
