import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/bloc/ranking/ranking_bloc.dart';
import 'package:matchgame/bloc/match_game/match_game_bloc.dart';
import 'package:matchgame/ui/screen/match_game_screen.dart';
import 'package:matchgame/ui/widget/ranking_list_widget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String choice = 'Select';
  late MatchGameBloc bloc;

  @override
  void initState() {
    bloc = context.read<MatchGameBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ranking'),
      ),
      body: BlocBuilder<RankingBloc, RankingState>(
        bloc: context.read<RankingBloc>(),
        builder: (context, state) {
          if(state is InRankingState){
            return RankingList(matchGames: state.matchGames, users: state.users);
          } else if (state is ErrorRankingState){
            return Center(
              child: Text(state.message),
            );
          } else {
            return const Center(child: CircularProgressIndicator(),);
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.add(LoadingMatchGameEvent());
          AppNavigator().push(const MatchGameScreen(), name: MatchGameScreen.route);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}