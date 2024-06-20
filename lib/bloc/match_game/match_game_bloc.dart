import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/repository/match_game_repository.dart';

part 'package:matchgame/bloc/match_game/match_game_event.dart';
part 'package:matchgame/bloc/match_game/match_game_state.dart';


class MatchGameBloc extends Bloc<MatchGameEvent, MatchGameState>{
  final MatchGameRepository _repository;
  MatchGameBloc(this._repository) : super(InitialMatchGameState()){

    on<LoadingMatchGameEvent>((event, emit) async {
      try {
        emit(LoadingMatchGameState());
        MatchGame matchGame = _repository.getMatchGame();
        emit(InMatchGameState(matchGame: matchGame, startGame: DateTime.now()));
      } catch (e) {
        emit(ErrorMatchGameState(e.toString()));
      }
    });

    on<ExpiringImageRevealEvent>((event, emit) async {
      try {
        if(state is InMatchGameState) {
          late MatchGame matchGame;
          var auxState = state as InMatchGameState;
          var chosen = auxState.chosen;
          var images = <ImageGame>[];
          for(var choose in chosen) {
            if (choose.id == event.expiredImage.id) {
              chosen.remove(choose);
              break;
            }
          }
          int i = 0;
          while (i < auxState.matchGame.images.length) {
            if(event.expiredImage.id == auxState.matchGame.images[i].id) {
              images.add(auxState.matchGame.images[i].copyWith(isShow: false));
            } else {
              images.add(auxState.matchGame.images[i]);
            }
            i++;
          }
          matchGame = auxState.matchGame.copyWith(images: images,);
          emit(auxState.copyWith(matchGame: matchGame, chosen: chosen));
        }
      } catch (e) {
        emit(ErrorMatchGameState(e.toString()));
      }
    });

    on<ChoosingImageEvent>((event, emit) async {
      try {
        if(state is InMatchGameState) {
          var auxState = state as InMatchGameState;
          MatchGame matchGame = auxState.matchGame;
          var chosen = [...auxState.chosen, event.chosen];
          if(chosen.length.isEven) {
            var images = <ImageGame>[];
            if(chosen[0].symbol == chosen[1].symbol) {
              int i = 0;
              while (i < auxState.matchGame.images.length) {
                if(chosen.sublist(0,2).map((e) => e.id).contains(auxState.matchGame.images[i].id)) {
                  images.add(auxState.matchGame.images[i].copyWith(isShow: true));
                } else {
                  images.add(auxState.matchGame.images[i]);
                }
                i++;
              }
              matchGame = auxState.matchGame.copyWith(images: images, rights: auxState.matchGame.rights + 1,);
            } else {
              matchGame = auxState.matchGame.copyWith(errors: auxState.matchGame.errors + 1);
            }
            emit(auxState.copyWith(matchGame: matchGame, chosen: chosen.length > 2 ? chosen.sublist(2) : []));
          } else {
            emit(auxState.copyWith(chosen: chosen));
          }
          var x = matchGame.images.map((e) => e.isShow).where((element) => element == true).length == matchGame.images.length;
          if(x){
            matchGame = matchGame.copyWith(duration: DateTime.now().difference(auxState.startGame!).inSeconds);
            _repository.save(matchGame);
            emit(CompleteMatchGameState(matchGame));
          }
        }
      } catch (e) {
        emit(ErrorMatchGameState(e.toString()));
      }
    });

    on<EndMatchGameEvent>((event, emit) async {
      try {
        if(state is InMatchGameState) {
          var auxState = state as InMatchGameState;
          var matchGame = auxState.matchGame.copyWith(duration: DateTime.now().difference(auxState.startGame!).inSeconds);
          _repository.save(matchGame);
          emit(FailedMatchGameState());
        }
      } catch (e) {
        emit(ErrorMatchGameState(e.toString()));
      }
    });

    on<HideImageEvent>((event, emit) async {
      var images = <ImageGame>[];
      if(state is InMatchGameState) {
        late MatchGame matchGame;
        var auxState = state as InMatchGameState;
        int i = 0;
        while (i < auxState.matchGame.images.length) {
          images.add(auxState.matchGame.images[i].copyWith(isShow: false));
          i++;
        }
        matchGame = auxState.matchGame.copyWith(images: images,);
        emit(auxState.copyWith(matchGame: matchGame,));
      }
    });
  }

  @override
  void onTransition(Transition<MatchGameEvent, MatchGameState> transition) {
    log(' Event: ${transition.event.toString()}');
    log('State: ${transition.currentState.toString()}');
    super.onTransition(transition);
  }
}