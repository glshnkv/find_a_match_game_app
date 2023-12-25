
class CoinsRepository {
  int _coinsCounter = 0;

  int get getCoinsCount => _coinsCounter;

  void increment(int coins) => _coinsCounter += coins;

}