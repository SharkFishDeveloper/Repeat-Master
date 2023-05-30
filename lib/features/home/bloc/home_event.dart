part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
//  List<TaskModal> tasks;
  final String task;
  AddTaskEvent(this.task);
}

class DeleteTaskEvent extends HomeEvent {}

class SeeDetailsEvent extends HomeEvent {}
