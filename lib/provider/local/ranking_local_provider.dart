import 'package:matchgame/models/preferences.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/user.dart';
import 'package:matchgame/provider/ranking_provider.dart';
import 'package:matchgame/utils/services/hive_service.dart';


class RankingLocalProvider extends RankingProvider {
  const RankingLocalProvider();

  @override
  List<MatchGame> getAllMatchGames() {
    final matchGame = HiveService.getAll<MatchGame>(HiveBoxes.matchGamesBox.value);
    matchGame.sort((a,b) => a.total.compareTo(b.total));
    return matchGame;
  }

  User findUser(String userId) {
    final users = HiveService.getAll<User>(HiveBoxes.usersBox.value);
    return users.firstWhere((user) => user.id == userId);
  }
}