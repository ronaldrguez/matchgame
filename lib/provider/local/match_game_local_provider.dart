import 'dart:math';
import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/preferences.dart';
import 'package:matchgame/models/user.dart';
import 'package:matchgame/provider/match_game_provider.dart';
import 'package:matchgame/utils/services/hive_service.dart';

class MatchGameLocalProvider extends MatchGameProvider {

  const MatchGameLocalProvider();

  @override
  MatchGame getMatchGame(){
    var preferences = HiveService.getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);
    var symbol = '';
    var random = Random();
    final images = List.generate(16, (index) {
      if(index % 2 == 0) {
        symbol = random.nextInt(99).toString();
      }
      return ImageGame(id: ImageGame.generateId, isShow: true, symbol: symbol);
    });
    images.shuffle();
    return MatchGame(id: MatchGame.generateId, rights: 0, errors: 0, duration: 0, userId: preferences?.userId ?? '', images: images,);
  }

  @override
  void save(MatchGame matchGame) {
    var preferences = HiveService.getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);
    var users = HiveService.getAll<User>(HiveBoxes.usersBox.value);
    var index = users.indexWhere((user) => user.id == preferences?.userId);
    if(index != -1) {
      HiveService.updateAt(HiveBoxes.usersBox.value, index, users.elementAt(index).copyWith(results: [...users.elementAt(index).results, matchGame]));
      HiveService.save(HiveBoxes.matchGamesBox.value, matchGame);
    }
  }
}