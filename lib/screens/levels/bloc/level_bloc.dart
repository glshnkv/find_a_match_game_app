import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:find_a_match_game_app/models/level_model.dart';
import 'package:find_a_match_game_app/repository/levels_repository.dart';
import 'package:meta/meta.dart';

part 'level_event.dart';
part 'level_state.dart';

class LevelBloc extends Bloc<LevelEvent, LevelState> {
  final LevelsRepository _levelsRepository;
  LevelBloc(this._levelsRepository) : super(LevelInitial()) {
    on<GetLevelsEvent>(_getLevelsHandler);
  }

  void _getLevelsHandler(
      GetLevelsEvent event, Emitter<LevelState> emit) {
    final levels = _levelsRepository.getSimpleLevels;
    emit(LoadedLevelsState(levels: levels));
  }
}
