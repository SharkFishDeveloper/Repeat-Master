import 'package:flutter/material.dart';

import '../../do_after_logic.dart';

class DoAfterDaysWidget extends StatefulWidget {
  const DoAfterDaysWidget({super.key});

  @override
  State<DoAfterDaysWidget> createState() => _DoAfterDaysWidgetState();
}

class _DoAfterDaysWidgetState extends State<DoAfterDaysWidget> {
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
              DoAfterDays.incrementIndex();
              setState(() {});
            },
            child: const Text("Done"))
        //Text('1'),
        //Text(DoAfterDays.doAfterDays[DoAfterDays.index].toString()),
      ],
    );
  }
}
