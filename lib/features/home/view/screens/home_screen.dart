import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repeat_master/features/notification/notification_manager.dart';
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
    //homeBloc.add(GetTasksEvent());
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
                return ListTile(
                  title: Text(state.taskList[index].title),
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
          ).then((taskname) {
            if (taskname != null) {
              final task = TaskModal(
                  title: taskname,
                  isDone: false,
                  description: "This is the description",
                  dateTime: DateTime.now(),
                  id: "1ntrow",
                  rating: 5);

              homeBloc.add(AddTaskEvent(task));
              _scheduleNotification(task);
              // adding event to add task
              print('Entered name: $taskname');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _scheduleNotification(TaskModal task) async {
    const id = 1; // Unique ID for the notification
    final title = task.title;
    final body = task.description;
    final scheduledDate = DateTime.now().add(const Duration(seconds: 5));
    final notificationManager = NotificationManager();
    await notificationManager.scheduleNotification(
      id: id,
      title: title,
      body: body,
      scheduledDate: scheduledDate,
    );
  }
}
