import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/provider/local/match_game_local_provider.dart';
import 'package:matchgame/provider/match_game_provider.dart';

class MatchGameRepository {
  final MatchGameProvider provider;

  const MatchGameRepository({this.provider = const MatchGameLocalProvider()});

  MatchGame getMatchGame() => provider.getMatchGame();

  void save(MatchGame matchGame) => provider.save(matchGame);
}