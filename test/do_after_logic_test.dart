import 'package:flutter_test/flutter_test.dart';
import 'package:repeat_master/features/do_after_feature/do_after_logic.dart';

void main() {
  group("testing the do after logic class GetDaysSinceTaskCreated method", () {
    test("testing the get days since task created function on the same day",
        () {
      expect(DoAfterDays.GetDaysSinceTaskCreated(DateTime.now()), 0);
    });

    test("testing the get days since task created function on the previous day",
        () {
      expect(
          DoAfterDays.GetDaysSinceTaskCreated(
              DateTime.now().subtract(const Duration(days: 5))),
          5);
    });
  });

  group("Testing GetRemainingDaysTORevise fuction", () {
    test("Test 1", () {
      expect(DoAfterDays.GetRemainingDaysTORevise(0), 1);
    });
    test("Test 2", () {
      DoAfterDays.index=1;
      expect(DoAfterDays.GetRemainingDaysTORevise(0), 3);
    });
     test("Test 3", () {
      DoAfterDays.index=1;
      expect(DoAfterDays.GetRemainingDaysTORevise(2), 1);
    });
       test("Test 4", () {
      DoAfterDays.index=2;
      expect(DoAfterDays.GetRemainingDaysTORevise(0), 7);
    });
  });
}
