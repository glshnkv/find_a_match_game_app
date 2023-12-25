
class HeartsRepository {
  int _heartsCounter = 10;

  int get getHeartsCount => _heartsCounter;

  void increment() {
    if (_heartsCounter < 10) {
      _heartsCounter += 1;
    }
  }

  void decrement() {
    if (_heartsCounter > 0) {
      _heartsCounter -= 1;
    }
  }
}
