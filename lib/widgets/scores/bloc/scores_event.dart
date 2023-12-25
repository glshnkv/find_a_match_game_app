part of 'scores_bloc.dart';

@immutable
abstract class ScoresEvent {}

class GetScoresEvent extends ScoresEvent {}

class AddCoinsEvent extends ScoresEvent {
  final int coins;

  AddCoinsEvent({required this.coins});
}

class TakeHeartEvent extends ScoresEvent {}