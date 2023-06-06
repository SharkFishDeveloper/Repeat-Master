// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

 class TaskState extends Equatable {
 final List<TaskModal> tasks;

  const TaskState({
    required this.tasks,
  });

  @override
  List<Object> get props => [tasks];
}

// class InitialiseTaskState extends TaskState { //* called whenever there are changes in the state task modal
//   final List<TaskModal> tasks;

//   const InitialiseTaskState({
//     required this.tasks,
//   });
// }
