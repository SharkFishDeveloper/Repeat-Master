import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repeat_master/modals/task_modal.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeScreenState> {
  HomeBloc() : super(NoTaskState()) {
    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
  }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<HomeScreenState> emit) {
   
    emit(AddedTasksState(event.taskList));
  }

  FutureOr<void> deleteTask(
      DeleteTaskEvent event, Emitter<HomeScreenState> emit) {}
}
