import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/models/match_game.dart';

abstract class MatchGameProvider {
  const MatchGameProvider();

  MatchGame getMatchGame();

  void save(MatchGame matchGame);
}