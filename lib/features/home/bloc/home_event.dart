part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {
  List<String> taskList;
  //final String task;
  AddTaskEvent(this.taskList);
}

class DeleteTaskEvent extends HomeEvent {}

class SeeDetailsEvent extends HomeEvent {}
