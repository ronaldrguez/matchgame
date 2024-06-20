import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matchgame/bloc/match_game/match_game_bloc.dart';

class ClockBackwardsWidget extends StatefulWidget {
  const ClockBackwardsWidget({super.key});

  @override
  State<StatefulWidget> createState() => _ClockBackwardsWidgetState();
}

class _ClockBackwardsWidgetState extends State<ClockBackwardsWidget> {
  late Timer timer;
  late int min;
  late int second;
  late MatchGameBloc bloc;

  @override
  void initState() {
    bloc = context.read<MatchGameBloc>();
    min = 2;
    second = 0;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (second == 0 && min > 0) {
        second = 59;
        min--;
      } else if (second > 0) {
        second--;
      } else {
        timer.cancel();
        bloc.add(EndMatchGameEvent());
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    if(timer.isActive) {
      timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: Text(
          '${min > 9 ? min : '0$min'} : ${second > 9 ? second : '0$second'}',
        style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.black26),
      ),
    );
  }
}
