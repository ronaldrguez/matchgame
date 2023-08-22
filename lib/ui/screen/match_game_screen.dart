import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/bloc/match_game/match_game_bloc.dart';
import 'package:matchgame/ui/screen/complete_screen.dart';
import 'package:matchgame/ui/widget/match_game_widget.dart';

import 'failed_screen.dart';

class MatchGameScreen extends StatelessWidget{

  static const route = 'match_game_screen';

  const MatchGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text('Match Game'),
        leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () {
          AppNavigator().pop();
        },),
      ),
      body: BlocBuilder<MatchGameBloc, MatchGameState>(
        bloc: context.read<MatchGameBloc>(),
        builder: (context, state) {
          if(state is InMatchGameState) {
            return MatchGameWidget( matchGame: state.matchGame,);
          } else if (state is CompleteMatchGameState){
            return CompleteScreen(matchGame: state.matchGame);
          } else if(state is FailedMatchGameState){
            return const FailedScreen();
          } else if (state is LoadingMatchGameState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if(state is ErrorMatchGameState){
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(child: Text('State not valid'),);
          }
        },
      ),
    );
  }

}