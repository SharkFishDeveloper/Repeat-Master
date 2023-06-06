import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:repeat_master/features/home/bloc/home_bloc.dart';

import '../../../modals/task_modal.dart';
import '../../home/home_repository/home_repo.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
//
  TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(const TaskState(tasks: [])) {
    on<CalculateRemainingDaysEvent>(calculateRemainingDays);
    // on<UpdateTaskEvent>(updateTask);
    on<AddTaskEvent>(addTask);
    on<GetTasksEvent>(getTasks);
  }

  FutureOr<void> calculateRemainingDays(
      CalculateRemainingDaysEvent event, Emitter<TaskState> emit) {
    //* this method should run initial as soon as the widget is loaded
  }

  // void _calculateRemainingDays() {
  //   final now = DateTime.now();
  //   final today = DateTime(now.year, now.month, now.day);
  //   final revisionDay =
  //       DateTime(_revisionDate.year, _revisionDate.month, _revisionDate.day);
  //   final difference = revisionDay.difference(today).inDays;
  // }

  // FutureOr<void> updateTask(UpdateTaskEvent event, Emitter<TaskState> emit) {
  //   state.tasks=
  //   taskModal = event.taskModal;
  //   taskRepository.updateTask(taskModal);
  // }

  FutureOr<void> addTask(AddTaskEvent event, Emitter<TaskState> emit) async {
    
    try {
      taskRepository.insertTask(event.task);
      List<TaskModal> newTasks = [...state.tasks];
      newTasks.add(event.task);
      emit(TaskState(tasks: newTasks));

      print("done inserting task : ");
    } catch (e) {
      print("Error inserting task : " + e.toString());
    }
  }

  FutureOr<void> getTasks(GetTasksEvent event, Emitter<TaskState> emit) async {
    // final List<TaskModal> tasks;
    try {
      final List<TaskModal> tasks = await taskRepository.getTasks();
      emit(TaskState(tasks: tasks));
    } catch (e) {
      print("Error getting task : " + e.toString());
    }
  }
}
