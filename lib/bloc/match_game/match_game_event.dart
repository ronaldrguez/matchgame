part of 'match_game_bloc.dart';

abstract class MatchGameEvent {}

class LoadingMatchGameEvent extends MatchGameEvent {}

class MatchingImagesEvent extends MatchGameEvent {
  final List<ImageGame> chosen;
  final bool comparison;

  MatchingImagesEvent(this.chosen, this.comparison);
}

class EndMatchGameEvent extends MatchGameEvent{}

class HideImagesEvent extends MatchGameEvent {}

