import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:matchgame/models/image_game.dart';

part 'package:matchgame/bloc/choose/choose_event.dart';
part 'package:matchgame/bloc/choose/choose_state.dart';

class ChooseBloc extends Bloc<ChooseEvent, ChooseState> {
  ChooseBloc() : super(UnChooseState()) {
    on<ChoosingFirstImageEvent>((event, emit) async {
      emit(InFirstChooseState(option1: event.option1));
    });

    on<ChoosingSecondImageEvent>((event, emit) async {
      if(state is InFirstChooseState) {
        var condition = (state as InFirstChooseState).option1.symbol.compareTo(event.option2.symbol) == 0;
        emit(InChooseState(option1: (state as InFirstChooseState).option1, option2: event.option2, comparison: condition));
      }
    });

    on<ResetChoose>((event, emit) async {
      emit(UnChooseState());
    });
  }
}
