part of 'match_game_bloc.dart';

abstract class MatchGameEvent {}

class LoadingMatchGameEvent extends MatchGameEvent {}

class ChoosingImageEvent extends MatchGameEvent {
  final ImageGame chosen;

  ChoosingImageEvent(this.chosen,);
}

class ExpiringImageRevealEvent extends MatchGameEvent {
  final ImageGame expiredImage;

  ExpiringImageRevealEvent(this.expiredImage,);
}

class HideImageEvent extends MatchGameEvent{}

class EndMatchGameEvent extends MatchGameEvent{}

