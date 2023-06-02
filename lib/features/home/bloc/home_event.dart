part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  final TaskModal task;
  //final String task;
  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends HomeEvent {
  final String id;
  DeleteTaskEvent(this.id);
}

class GetTasksEvent extends HomeEvent {}

class SeeDetailsEvent extends HomeEvent {}
