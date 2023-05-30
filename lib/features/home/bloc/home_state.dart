part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class NoTaskState extends HomeState {}

class AddedTasksState extends HomeState {}
