import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:repeat_master/features/do_after_feature/do_after_logic.dart';

import '../../../modals/task_modal.dart';
import '../../home/home_repository/home_repo.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
//
  TaskRepository taskRepository;

  TaskBloc(this.taskRepository) : super(const TaskState(tasks: [])) {
    //on<CalculateRemainingDaysEvent>(calculateRemainingDays);
    // on<UpdateTaskEvent>(updateTask);
    on<AddTaskEvent>(addTask);
    on<GetTasksEvent>(getTasks);
    on<RevisionDoneEvent>(revisionDone);
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
      print("first element : $tasks[0]");
      print("get tasks: ran ");
    } catch (e) {
      print("Error getting task : " + e.toString());
    }
  }

  FutureOr<void> revisionDone(
      RevisionDoneEvent event, Emitter<TaskState> emit) {
    int daysSinceTaskCreated =
        DoAfterDays.GetDaysSinceTaskCreated(event.taskModal.dateTime);
    int remainingDays =
        DoAfterDays.GetRemainingDaysTORevise(daysSinceTaskCreated);
    print("remainingDays by calculation: $remainingDays");

    if (state.tasks[event.index].remainingDaysToRevise != remainingDays) {
      final updatedTaskModal = state.tasks[event.index]
          .copyWith(remainingDaysToRevise: remainingDays);

      try {
        taskRepository.updateTask(updatedTaskModal);
        List<TaskModal> updatedTasks = [...state.tasks];
        updatedTasks[event.index] = updatedTaskModal;
        emit(TaskState(tasks: updatedTasks));
        // newTasks.(event.task);
        // emit(TaskState(tasks: newTasks));
        print("Updated tasks is : $updatedTasks");
        print("updatedTaskModal is: ${updatedTaskModal.toString()}");
        print("done updating task : ");
      } catch (e) {
        print("Error updating task : " + e.toString());
      }
    }
  }

  // FutureOr<void> calculateRemainingDays(CalculateRemainingDaysEvent event, Emitter<TaskState> emit) {

  //   int daysSinceTaskCreated =
  //       DoAfterDays.GetDaysSinceTaskCreated(event.taskModal.dateTime);
  //   int remainingDays =
  //       DoAfterDays.GetRemainingDaysTORevise(daysSinceTaskCreated);
  //   print("remainingDays by calculation: $remainingDays");
  //   final updatedTaskModal = state.tasks[event.index]
  //       .copyWith(remainingDaysToRevise: remainingDays);

  //   try {
  //     taskRepository.updateTask(updatedTaskModal);
  //     List<TaskModal> updatedTasks = [...state.tasks];
  //     updatedTasks[event.index] = updatedTaskModal;
  //     emit(TaskState(tasks: updatedTasks));
  //     // newTasks.(event.task);
  //     // emit(TaskState(tasks: newTasks));
  //     print("Updated tasks is : $updatedTasks");
  //     print("updatedTaskModal is: ${updatedTaskModal.toString()}");
  //     print("done updating task : ");
  //   } catch (e) {
  //     print("Error updating task : " + e.toString());
  //   }
  // }
}
