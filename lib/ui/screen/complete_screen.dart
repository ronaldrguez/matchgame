import 'dart:math';

import 'package:app_navigator/app_navigator.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/bloc/ranking/ranking_bloc.dart';
import 'package:matchgame/models/match_game.dart';

class CompleteScreen extends StatefulWidget{
  final MatchGame matchGame;

  const CompleteScreen({super.key, required this.matchGame});

  @override
  State<StatefulWidget> createState() => _CompleteScreenState();

}

class _CompleteScreenState extends State<CompleteScreen> {
  final controller = ConfettiController();
  bool isPlaying = false;

  @override
  void initState() {
    controller.play();
    controller.addListener(() {
      setState(() {
        isPlaying = controller.state == ConfettiControllerState.playing;
      });
    });
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: ConfettiWidget(confettiController: controller, blastDirectionality: BlastDirectionality.explosive, child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text('Congrats you have ends the game with ${widget.matchGame.errors < 3 ? 'only' : ''} ${widget.matchGame.errors} errors!!!', style: Theme.of(context).textTheme.titleLarge,),),
                const SizedBox(height: 30,),
                ElevatedButton(onPressed: () {
                    if(isPlaying) {
                      controller.stop();
                    }
                    context.read<RankingBloc>().add(LoadingRankingEvent());
                    AppNavigator().pop();
                  }, child: const Text('Go to Ranking'))
              ],
            )),
          ),
        );
  }

}