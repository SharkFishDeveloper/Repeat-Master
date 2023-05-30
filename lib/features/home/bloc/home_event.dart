part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class AddTaskEvent extends HomeEvent {}

class DeleteTaskEvent extends HomeEvent {}

class SeeDetailsEvent extends HomeEvent {}
