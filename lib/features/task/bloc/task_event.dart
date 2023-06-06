// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class CalculateRemainingDaysEvent extends TaskEvent {}

class UpdateTaskEvent extends TaskEvent {
  final TaskModal taskModal;
  const UpdateTaskEvent({
    required this.taskModal,
  });
}

class AddTaskEvent extends TaskEvent {
  final TaskModal task;
  //final String task;
  const AddTaskEvent(this.task);
}

class GetTasksEvent extends TaskEvent {}

class RevisionDoneEvent extends TaskEvent {
  final TaskModal taskModal;
  final int index;
  
 const  RevisionDoneEvent({required this.index,
    required this.taskModal,
  });
}
