part of 'match_game_bloc.dart';

abstract class MatchGameState extends Equatable {

  MatchGameState copyWith();
}

class InitialMatchGameState extends MatchGameState {

  @override
  List<Object?> get props => [];

  @override
  InitialMatchGameState copyWith() {
    return InitialMatchGameState();
  }
}

class LoadingMatchGameState extends MatchGameState {

  @override
  List<Object?> get props => [];

  @override
  LoadingMatchGameState copyWith() {
    return LoadingMatchGameState();
  }
}

class InMatchGameState extends MatchGameState {
  final MatchGame matchGame;
  final DateTime? startGame;
  final List<ImageGame> chosen;

  InMatchGameState({required this.matchGame, this.startGame, this.chosen = const []});

  @override
  List<Object?> get props => [matchGame, startGame, chosen];

  @override
  InMatchGameState copyWith({MatchGame? matchGame, DateTime? startGame, List<ImageGame>? chosen}) {
    return InMatchGameState(matchGame: matchGame ?? this.matchGame, startGame: startGame ?? this.startGame, chosen: chosen ?? this.chosen);
  }
}

class CompleteMatchGameState extends MatchGameState {
  final MatchGame matchGame;

  CompleteMatchGameState(this.matchGame);

  @override
  List<Object?> get props => [matchGame];

  @override
  CompleteMatchGameState copyWith({MatchGame? matchGame}) {
    return CompleteMatchGameState(matchGame ?? this.matchGame);
  }
}

class FailedMatchGameState extends MatchGameState {
  @override
  MatchGameState copyWith() {
    return FailedMatchGameState();
  }

  @override
  List<Object?> get props => [];

}

class ErrorMatchGameState extends MatchGameState {
  final String message;

  ErrorMatchGameState(this.message);

  @override
  List<Object?> get props => [message];

  @override
  ErrorMatchGameState copyWith({String? message}) {
    return ErrorMatchGameState(message ?? this.message);
  }
}