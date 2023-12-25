import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_a_match_game_app/repository/coins_repository.dart';
import 'package:find_a_match_game_app/repository/hearts_repository.dart';
import 'package:find_a_match_game_app/services/shared_preferences.dart';
import 'package:meta/meta.dart';

part 'scores_event.dart';

part 'scores_state.dart';

class ScoresBloc extends Bloc<ScoresEvent, ScoresState> {
  final HeartsRepository _heartsRepository;
  final CoinsRepository _coinsRepository;

  ScoresBloc(this._heartsRepository, this._coinsRepository)
      : super(ScoresInitial()) {
    on<GetScoresEvent>(_getScoresHandler);
    on<AddCoinsEvent>(_addCoinsHandler);
    on<TakeHeartEvent>(_takeHeartHandler);

  }

  void _getScoresHandler(
      GetScoresEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    if (storage.coins == 0 && storage.hearts == 0) {
      storage.coins = _coinsRepository.getCoinsCount;
      storage.hearts = _heartsRepository.getHeartsCount;
    }
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts));
  }

  void _addCoinsHandler(
      AddCoinsEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.coins += event.coins;
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts));
  }

  void _takeHeartHandler(
      TakeHeartEvent event, Emitter<ScoresState> emit) async {
    SharedPreferencesService storage = await SharedPreferencesService.getInstance();
    storage.hearts -= 1;
    emit(UpdateScoresState(
        coins: storage.coins,
        hearts: storage.hearts));
  }
}
