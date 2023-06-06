import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repeat_master/features/notification/notification_manager.dart';
import 'package:repeat_master/modals/task_modal.dart';

import '../../../do_after_feature/view/widgets/row_with_button.dart';
import '../../../task/bloc/task_bloc.dart';
//import '../../bloc/home_bloc.dart';
import '../widgets/task_input_dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final TaskBloc taskBloc;
  final notificationAfterseconds = 5;
  final List<String> taskList = [];
  Timer? notificationTimer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(GetTasksEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Repeat master'),
      ),
      body: BlocBuilder<TaskBloc, TaskState>(
          bloc: taskBloc,
          builder: (context, state) {
            if (state.tasks.isEmpty) {
              return const Center(child: Text('Nothing to show'));
            }

            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (BuildContext context, int index) {
                print("List ran");
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 2,
                    child: ExpansionTile(
                      title: Text(state.tasks[index].title),
                      subtitle: Text(
                          state.tasks[index].remainingDaysToRevise.toString()),
                      children: [
                        ListTile(
                          title: Text(state.tasks[index].description),
                          trailing: const Text("Days"),
                          // Add any additional widgets or functionality
                        ),
                        DoAfterDaysWidget(
                          taskModal: state.tasks[index],
                          index: index,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          //    else if (state is LoadingState) {
          //     return const Center(child: CircularProgressIndicator());
          //   }
          //   return const Center(
          //     child: Text("this never runs"),
          //   );
          // },
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
              taskBloc.add(AddTaskEvent(task));
              // _scheduleNotification(task);
              // adding event to add task
              print(task.toString());
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
    //final scheduledDate = DateTime.now().add( Duration( seconds: notificationAfterseconds));
    final notificationManager = NotificationManager();

    Timer.periodic(const Duration(seconds: 10), (timer) async {
      DateTime scheduledDate = DateTime.now().add(const Duration(seconds: 5));
      await notificationManager.scheduleNotification(
        id: id,
        title: title,
        body: body,
        scheduledDate: scheduledDate,
      );
    });

    // await notificationManager.scheduleNotification(
    //   id: id,
    //   title: title,
    //   body: body,
    //   scheduledDate: scheduledDate,
    // );
  }
}
