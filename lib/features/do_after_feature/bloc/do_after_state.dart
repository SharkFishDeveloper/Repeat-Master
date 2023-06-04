part of 'do_after_bloc.dart';

abstract class DoAfterState extends Equatable {
  const DoAfterState();
  
  @override
  List<Object> get props => [];
}

class DoAfterInitialState extends DoAfterState {
   final int remainingDays;

   const DoAfterInitialState(this.remainingDays);
}

class RevisionDeadlineExceededState extends DoAfterState {}