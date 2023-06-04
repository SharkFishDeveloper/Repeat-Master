import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/do_after_bloc.dart';
import '../../do_after_logic.dart';

class DoAfterDaysWidget extends StatefulWidget {
  const DoAfterDaysWidget({super.key});

  @override
  State<DoAfterDaysWidget> createState() => _DoAfterDaysWidgetState();
}

class _DoAfterDaysWidgetState extends State<DoAfterDaysWidget> {
  //int reviseAfterDays;
  late final DoAfterBloc doAfterBloc;
  @override
  void initState() {
    super.initState();
    doAfterBloc = BlocProvider.of<DoAfterBloc>(context);
    doAfterBloc.add(RemainingDaysEvent());    //*calculates the remaining days of the task as soon as the widget is initalized
    //DoAfterDays.daystoSubtract();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Repeat after days : ${DoAfterDays.afterDays}'),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              doAfterBloc.add(RevisionDoneEvent(DateTime.now()));
            },
            child: const Text("Done"))
        //Text('1'),
        //Text(DoAfterDays.doAfterDays[DoAfterDays.index].toString()),
      ],
    );
  }
}
