import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repeat_master/modals/task_modal.dart';

import '../../bloc/home_bloc.dart';
import '../widgets/task_input_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeBloc homeBloc;

  final List<String> taskList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.add(GetTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repeat master'),
      ),
      body: BlocBuilder<HomeBloc, HomeScreenState>(
        builder: (context, state) {
          if (state is IntialHomeState) {
            if (state.taskList.isEmpty) {
              return const Center(child: Text('Nothing to show'));
            }
            return ListView.builder(
              itemCount: state.taskList.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 2,
                  child: ListTile(
                    title: Text(state.taskList[index].title),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        homeBloc.add(DeleteTaskEvent(state.taskList[index].id));
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
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
          ).then((task) {
            if (task != null) {
              homeBloc.add(AddTaskEvent(task));
              // adding event to add task
              print(task.toString());
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
