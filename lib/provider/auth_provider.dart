import 'package:matchgame/models/user.dart';

abstract class AuthProvider {
  const AuthProvider();

  Future<User?> signIn (String userName, String password);

  Future<bool> signUp (User user);

  Future<bool> signOut();

  Future<User?> keepLogin();
}