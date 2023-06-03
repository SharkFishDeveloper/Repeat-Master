class DoAfterDays {
  static List<int> doAfterDays = [1, 3, 7, 15, 21, 30];
  static int index = 0;

  static incrementIndex() {
    if (index == 4) {
      index = 0;
    }
    index++;
  }

  static get afterDays => doAfterDays[index];
}
