import 'package:flutter/material.dart';

import '../widgets/task_input_dialog.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repeat master'),
      ),
      body: const Center(
        child: Text(
          'Repeat master',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return TaskInputDialog();
                },
              ).then((result) {
                if (result != null) {
                  print('Entered name: $result');
                }
              });
            },
        child: const Icon(Icons.add),
      ),
    );
  }
}
