import 'package:matchgame/models/user.dart';
import 'package:matchgame/provider/auth_provider.dart';
import 'package:matchgame/utils/services/hive_service.dart';

import '../../models/preferences.dart';

class AuthLocalProvider extends AuthProvider {
  const AuthLocalProvider();

  @override
  Future<User?> signIn(String userName, String password) async {
    final users = HiveService.getAll<User>(HiveBoxes.usersBox.value,);
    for(var user in users) {
      if(user.userName == userName && user.password == password) {
        final preferences = HiveService.getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);
        await HiveService.updateAt<UserPreferences>(HiveBoxes.preferencesBox.value, 0, preferences!.copyWith(
            isLoggedIn: true,
            userId: user.id,
            latestLogIn: DateTime.now()
        ));
        return user;
      }
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    final preferences = HiveService.getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);
    await HiveService.save<UserPreferences>(HiveBoxes.preferencesBox.value, preferences!.copyWith(
        isLoggedIn: false,
        userId: null,
        latestLogIn: DateTime.now()
    ));
    return true;
  }

  @override
  Future<bool> signUp(User user) async {
    final existUser = HiveService.getAll<User>(HiveBoxes.usersBox.value, where:(e) => user.userName == e.userName);
    var result = -1;
    if(existUser.isEmpty){
      result = await HiveService.save<User>(HiveBoxes.usersBox.value, user);
    }
    return result != -1 ? true : false;
  }

  @override
  Future<User?> keepLogin() async {
    final preferences = HiveService.getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);
    if(preferences?.isLoggedIn ?? false) {
      final user = HiveService.getAll<User>(HiveBoxes.usersBox.value, where: (element) => preferences!.userId! == element.id);
      return user.first;
    }
    return null;
  }

}