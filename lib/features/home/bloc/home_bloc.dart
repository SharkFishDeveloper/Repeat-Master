import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeScreenState> {
  HomeBloc() : super(NoTaskState()) {
    on<AddTaskEvent>(addTask);
    on<DeleteTaskEvent>(deleteTask);
  }

  FutureOr<void> addTask(HomeEvent event, Emitter<HomeScreenState> emit) {}

  FutureOr<void> deleteTask(
      DeleteTaskEvent event, Emitter<HomeScreenState> emit) {}
}
