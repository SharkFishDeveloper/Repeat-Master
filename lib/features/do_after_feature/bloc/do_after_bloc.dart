import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../home/home_repository/home_repo.dart';

part 'do_after_event.dart';
part 'do_after_state.dart';

class DoAfterBloc extends Bloc<DoAfterEvent, DoAfterState> {
   TaskRepository taskRepository;
  DoAfterBloc(this.taskRepository) : super(const DoAfterInitialState(1)) {
    on<RemainingDaysEvent>(calculateRemainingDays);
    on<RevisionDoneEvent>(revisionDone);
  }

  FutureOr<void> revisionDone(
      RevisionDoneEvent event, Emitter<DoAfterState> emit) {
       // TODO : call the home repository insert method to save the date and time of the task after done button click
       

  }

  FutureOr<void> calculateRemainingDays(
      RemainingDaysEvent event, Emitter<DoAfterState> emit) {}
}
