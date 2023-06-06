import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:repeat_master/features/task/bloc/task_bloc.dart';
import 'package:repeat_master/modals/task_modal.dart';

import '../../bloc/do_after_bloc.dart';
import '../../do_after_logic.dart';

class DoAfterDaysWidget extends StatefulWidget {
  final TaskModal taskModal;
  final int index;
  const DoAfterDaysWidget(
      {super.key, required this.taskModal, required this.index});

  @override
  State<DoAfterDaysWidget> createState() => _DoAfterDaysWidgetState();
}

class _DoAfterDaysWidgetState extends State<DoAfterDaysWidget> {
  //int reviseAfterDays;
  late final TaskBloc taskBloc;
  @override
  void initState() {
    print("Row wid ran");
    super.initState();
    taskBloc = BlocProvider.of<TaskBloc>(context);
    taskBloc.add(
        CalculateRemainingDaysEvent()); //*calculates the remaining days of the task as soon as the widget is initalized
    //DoAfterDays.daystoSubtract();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Repeat after days : ${widget.taskModal.remainingDaysToRevise}'),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              DoAfterDays.incrementIndex();
              taskBloc.add(RevisionDoneEvent(
                  taskModal: widget.taskModal, index: widget.index));
            //  taskBloc.add(GetTasksEvent());
            },
            child: const Text("Done"))
        //Text('1'),
        //Text(DoAfterDays.doAfterDays[DoAfterDays.index].toString()),
      ],
    );
  }
}
