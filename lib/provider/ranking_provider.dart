import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/user.dart';

abstract class RankingProvider {
  const RankingProvider();

  List<MatchGame> getAllMatchGames();

  User findUser(String userId);
}