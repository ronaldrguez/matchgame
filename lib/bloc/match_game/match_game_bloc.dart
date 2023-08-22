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
        emit(InMatchGameState(matchGame: matchGame));
      } catch (e) {
        emit(ErrorMatchGameState(e.toString()));
      }
    });

    on<MatchingImagesEvent>((event, emit) async {
      try {
        if(state is InMatchGameState) {
          late MatchGame matchGame;
          var auxState = state as InMatchGameState;
          if(event.comparison) {
            var images = <ImageGame>[];
            int i = 0;
            while(i < auxState.matchGame.images.length) {
              event.chosen.map((e) => e.id).contains(auxState.matchGame.images.elementAt(i).id) ? images.add(auxState.matchGame.images.elementAt(i).copyWith(isShow: true)) : images.add(auxState.matchGame.images.elementAt(i));
              i++;
            }
            matchGame = auxState.matchGame.copyWith(images: images, rights: auxState.matchGame.rights + 1);
          } else {
            matchGame = auxState.matchGame.copyWith(errors: auxState.matchGame.errors + 1);
          }
          if(matchGame.images.map((e) => e.isShow).where((element) => element == true).length == matchGame.images.length){
            matchGame = matchGame.copyWith(duration: DateTime.now().difference(auxState.startGame!).inSeconds);
            _repository.save(matchGame);
            emit(CompleteMatchGameState(matchGame));
          } else {
            emit(auxState.copyWith(matchGame: matchGame));
          }
        }
      } catch (e) {
        emit(ErrorMatchGameState(e.toString()));
      }
    });

    on<HideImagesEvent>((event, emit) async {
      try {
        if(state is InMatchGameState) {
          var auxState = state as InMatchGameState;
          final images = <ImageGame>[];
          for (var image in auxState.matchGame.images) {
            images.add(image.copyWith(isShow: false));
          }
          var matchGame = auxState.matchGame.copyWith(images: images);
          emit(auxState.copyWith(matchGame: matchGame, startGame: DateTime.now()));
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
  }
}