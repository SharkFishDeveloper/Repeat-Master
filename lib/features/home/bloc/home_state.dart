part of 'home_bloc.dart';

@immutable
abstract class HomeScreenState {}

class IntialHomeState extends HomeScreenState {
    final List<TaskModal> taskList;
  // String taskName;

  IntialHomeState(this.taskList);
}

class LoadingState extends HomeScreenState {}

