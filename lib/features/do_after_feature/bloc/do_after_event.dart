part of 'do_after_bloc.dart';

abstract class DoAfterEvent extends Equatable {
  const DoAfterEvent();

  @override
  List<Object> get props => [];
}

// class InitialRemaniningDaysEvent extends DoAfterEvent {
//   final int remainingDays;

//   const InitialRemaniningDaysEvent(this.remainingDays);
// }

class RemainingDaysEvent extends DoAfterEvent {
  
}

class RevisionDoneEvent extends DoAfterEvent {
  final DateTime dateTime;

  const RevisionDoneEvent(this.dateTime);
}

//class RevisionDeadlineExceededEvent extends DoAfterEvent {}
