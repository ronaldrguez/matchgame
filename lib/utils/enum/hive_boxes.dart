part of '../services/hive_service.dart';

enum HiveBoxes {
// Collections
  usersBox('user_box'),
  preferencesBox('preferences_box'),
  imageGamesBox('image_games_box'),
  matchGamesBox('match_games_box');

  const HiveBoxes(this.value);

  final String value;
}