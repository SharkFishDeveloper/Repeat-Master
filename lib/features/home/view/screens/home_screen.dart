import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repeat master'),
      ),
      body: BlocBuilder<HomeBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is NoTaskState) {
            return const Center(
              child: Text("No Task"),
            );
          } else if (state is AddedTasksState) {
            return const Center(
              child: Text("You have Tasks"),
            );
          }
          return const Center(
            child: Text("this never runs"),
          );
        },
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
