part of 'level_bloc.dart';

@immutable
abstract class LevelState {}

class LevelInitial extends LevelState {}

class LoadedLevelsState extends LevelState {
  final List<LevelModel> levels;

  LoadedLevelsState({required this.levels});
}
