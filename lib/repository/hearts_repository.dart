import 'dart:async';

class HeartsRepository {
  int _heartsCounter = 10;
  Timer? _timer;

  HeartsRepository() {
    _startTimer();
  }

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


  void _startTimer() {
    _timer = Timer.periodic(Duration(hours: 1), (timer) {
      if (_heartsCounter < 10) {
        _heartsCounter += 1;
      }
    });
  }

  void dispose() {
    _timer?.cancel();
  }
}