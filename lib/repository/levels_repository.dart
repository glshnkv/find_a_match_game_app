import 'package:find_a_match_game_app/models/level_model.dart';

class LevelsRepository {
  final List<LevelModel> _list = [
    LevelModel(
      number: 1,
      gridSize: 2,
      isDone: false,
    ),
    LevelModel(
      number: 2,
      gridSize: 2,
      isDone: false,
    ),
    LevelModel(
      number: 3,
      gridSize: 2,
      isDone: false,
    ),
    LevelModel(
      number: 4,
      gridSize: 3,
      isDone: false,
    ),
    LevelModel(
      number: 5,
      gridSize: 3,
      isDone: false,
    ),
    LevelModel(
      number: 6,
      gridSize: 3,
      isDone: false,
    ),
    LevelModel(
      number: 7,
      gridSize: 3,
      isDone: false,
    ),
    LevelModel(
      number: 8,
      gridSize: 3,
      isDone: false,
    ),
    LevelModel(
      number: 9,
      gridSize: 3,
      isDone: false,
    ),
    LevelModel(
      number: 10,
      gridSize: 3,
      isDone: false,
    ),
  ];

  List<LevelModel> get getSimpleLevels => _list;
}
