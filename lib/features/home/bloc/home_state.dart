part of 'home_bloc.dart';

@immutable
abstract class HomeScreenState {}

class NoTaskState extends HomeScreenState {}

class AddedTasksState extends HomeScreenState {
  final List<String> taskNameList;
 // String taskName;
  //! this is used in the UI and is filled by the addTask method in the bloc
  AddedTasksState(this.taskNameList);
}
