import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/user.dart';
import 'package:matchgame/provider/local/ranking_local_provider.dart';
import 'package:matchgame/provider/ranking_provider.dart';

class RankingRepository {
  final RankingProvider provider;

  const RankingRepository({this.provider = const RankingLocalProvider()});

  List<MatchGame> getAllMatchGames() => provider.getAllMatchGames();

  User findUser(String userId) => provider.findUser(userId);
}