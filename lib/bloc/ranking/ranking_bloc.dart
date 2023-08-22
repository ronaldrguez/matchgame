import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/user.dart';
import 'package:matchgame/repository/ranking_repository.dart';

part 'package:matchgame/bloc/ranking/ranking_event.dart';
part 'package:matchgame/bloc/ranking/ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent,RankingState> {
  final RankingRepository _repository;
  RankingBloc(this._repository) : super(UnTriviaState()){

    on<LoadingRankingEvent>((event, emit) async {
      try {
        emit(LoadRankingState());
        final matchGames = _repository.getAllMatchGames();
        final Set<User> users = <User>{};
        for (var matchGame in matchGames) {
          users.add(_repository.findUser(matchGame.userId));
        }
        emit(InRankingState(
          matchGames: matchGames,
          users: users
        ));
      } catch (e){
        emit(ErrorRankingState(e.toString()));
      }
    });
  }
}