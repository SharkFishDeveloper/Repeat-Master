import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:repeat_master/modals/task_modal.dart';

import '../home_repository/home_repo.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeScreenState> {
  TaskRepository taskRepository;

  HomeBloc(this.taskRepository) : super(IntialHomeState(const [])) {
    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
    on<GetTasksEvent>(getTasks);
  }

  FutureOr<void> addTask(
      AddTaskEvent event, Emitter<HomeScreenState> emit) async {
    emit(LoadingState());

    try {
      taskRepository.insertTask(event.task);
      final listtask = await taskRepository.getTasks();
      emit(IntialHomeState(listtask));
      print("done inserting task : ");
    } catch (e) {
      print("Error inserting task : " + e.toString());
    }
  }

  FutureOr<void> deleteTask(
      DeleteTaskEvent event, Emitter<HomeScreenState> emit) async {
    taskRepository.deleteTask(event.id);
    final listtask = await taskRepository.getTasks();
    emit(IntialHomeState(listtask));
    print(" Successfully Deleted task");
  }

  FutureOr<void> getTasks(
      GetTasksEvent event, Emitter<HomeScreenState> emit) async {
    final List<TaskModal> tasks;
    emit(LoadingState());
    try {
      tasks = await taskRepository.getTasks();
      emit(IntialHomeState(tasks));
    } catch (e) {
      print("Error getting task : " + e.toString());
    }
  }
}
