class DoAfterDays {
  static List<int> doAfterDays = [
    1,
    3,
    7,
    15,
    21,
    30,
    40,
    50,
  ];
   static int index = 0;

   static incrementIndex() { //* TO BE CALLED FROM DONE BUTTON
    if (index == 7) {
      index = 0;
    }
    index++;
    print("index incremented");
  }

  static get dateAndTimeNow => DateTime.now();
  static get afterDays => doAfterDays[index];

   static int GetDaysSinceTaskCreated(DateTime createdDate) {
    Duration difference = dateAndTimeNow.difference(createdDate);
    int daysSinceTaskCreated = difference.inDays;
    return daysSinceTaskCreated;
  }

   static int GetRemainingDaysTORevise(daysSinceTaskCreated) {
    int remainingDays = DoAfterDays.afterDays - daysSinceTaskCreated;
    if (remainingDays == 0) {
      print("Deadline exceeded");
    }
    return remainingDays;
  }
}
