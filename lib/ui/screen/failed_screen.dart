import 'package:app_navigator/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/bloc/ranking/ranking_bloc.dart';

class FailedScreen extends StatelessWidget {
  const FailedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text('You Have Failed!!!'),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<RankingBloc>().add(LoadingRankingEvent());
                AppNavigator().pop();
              },
              child: const Text('Go to Ranking'))
        ],
      )),
    );
  }
}
