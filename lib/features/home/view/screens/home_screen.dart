import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/home_bloc.dart';
import '../widgets/task_input_dialog.dart';

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
            return ListView.builder(
              itemCount: state.taskNameList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(state.taskNameList[index]),
                );
              },
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
          ).then((taskname) {
            if (taskname != null) {
              final homeBloc = BlocProvider.of<HomeBloc>(context);
              homeBloc.add(AddTaskEvent(taskname)); // adding event to add task
              print('Entered name: $taskname');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
