import 'package:flutter/material.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/user.dart';

class RankingList extends StatelessWidget {
  final List<MatchGame> matchGames;
  final Set<User> users;

  const RankingList({super.key, required this.matchGames, required this.users});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: SingleChildScrollView(
        child: Column(
        children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          child: ListTile(
            leading: Text('Pos', style: Theme.of(context).textTheme.titleMedium),
            title: Text('Users', style: Theme.of(context).textTheme.titleMedium),
            trailing: Text('Duration', style: Theme.of(context).textTheme.titleMedium),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: matchGames.length,
          itemBuilder: (BuildContext context, int index) {
            return RankingListItem(pos: index + 1, matchGame: matchGames.elementAt(index), userName: users.firstWhere((user) => user.id == matchGames.elementAt(index).userId).name);
          },
        )
      ],),),
    );
  }
}

class RankingListItem extends StatelessWidget {
  final MatchGame matchGame;
  final String userName;
  final int pos;

  const RankingListItem({super.key, required this.pos, required this.matchGame, required this.userName});

  @override
  Widget build(BuildContext context) {
    var min = matchGame.duration ~/ 60;
    var sec = matchGame.duration - (min * 60);
    return ListTile(
      leading: Text('$pos'),
      title: Text(userName),
      subtitle: Text('${matchGame.errors} errors'),
      trailing: Text('${min > 9 ? min : '0$min'} : ${sec > 9 ? sec : '0$sec'}'),
    );
  }
}