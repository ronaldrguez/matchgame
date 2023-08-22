import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:matchgame/models/image_game.dart';
import 'package:matchgame/models/match_game.dart';
import 'package:matchgame/models/preferences.dart';
import 'package:matchgame/models/user.dart';

part '../enum/hive_boxes.dart';

class HiveService {
  static const int dbVersion = 1;

  static Future<void> initHive() async {
    await Hive.initFlutter();
    _initialConfigs();
  }

  static Future<void> _initialConfigs() async {
    Hive.registerAdapter(UserPreferencesAdapter());

    await Hive.openBox<UserPreferences>(HiveBoxes.preferencesBox.value);

    //Config preferences
    final preferences = getFirst<UserPreferences>(HiveBoxes.preferencesBox.value);

    if (preferences == null) {
      //Create boxes with
      await _initBoxes();
      save<UserPreferences>(
          HiveBoxes.preferencesBox.value,
          UserPreferences(
            dbVersion: dbVersion,
            isLoggedIn: false, userId: '', latestLogIn: DateTime.now(),
          ));
      //_populateDB();
    } else if (preferences.dbVersion != dbVersion) {
      await _deleteBoxes();
      await _initBoxes();
      save<UserPreferences>(HiveBoxes.usersBox.value,
          preferences.copyWith(dbVersion: dbVersion));
      //_populateDB();
    } else {
      await _initBoxes();
    }
  }

  static void _registerAdapters() {
    Hive.registerAdapter(ImageGameAdapter());
    Hive.registerAdapter(MatchGameAdapter());
    Hive.registerAdapter(UserAdapter());
  }

  static Future<void> _openBoxes() async {
    await Future.wait([
      //Data
      Hive.openBox<MatchGame>(HiveBoxes.imageGamesBox.value),
      Hive.openBox<MatchGame>(HiveBoxes.matchGamesBox.value),
      Hive.openBox<User>(HiveBoxes.usersBox.value),
    ]);
  }

  static Future<void> _deleteBoxes() async {
    await Future.wait([
      Hive.deleteBoxFromDisk(HiveBoxes.imageGamesBox.value),
      Hive.deleteBoxFromDisk(HiveBoxes.matchGamesBox.value),
      Hive.deleteBoxFromDisk(HiveBoxes.usersBox.value),
      Hive.deleteBoxFromDisk(HiveBoxes.preferencesBox.value),
    ]);
  }

  static Box<T> getBox<T>(String boxName) {
    return Hive.box<T>(boxName);
  }

  static ValueListenable<Box<T>> getBoxListenable<T>(String boxName,
      {List? keys}) {
    return getBox<T>(boxName).listenable(keys: keys);
  }

  static T? getElement<T>(String boxName, dynamic key) {
    final box = getBox<T>(boxName);
    return box.get(key);
  }

  static List<T> getAll<T>(String boxName, {bool Function(T)? where}) {
    final box = getBox<T>(boxName);
    return where != null
        ? box.values.where(where).toList()
        : box.values.toList();
  }

  static T? getFirst<T>(String boxName) {
    final box = getBox<T>(boxName);
    final elements = box.values.toList();
    return elements.isNotEmpty ? elements.first : null;
  }

  static Iterable<T> where<T>(String boxName, bool Function(T) where) {
    final box = getBox<T>(boxName);
    return box.values.where(where);
  }

  static Map<dynamic, T> whereAsMap<T>(
      String boxName, bool Function(MapEntry<dynamic, T>) where) {
    final box = getBox<T>(boxName);
    return Map.fromEntries(box.toMap().entries.where(where));
  }

  static MapEntry<dynamic, T>? firstWhere<T>(
      String boxName, bool Function(T) where) {
    final box = getBox<T>(boxName);
    final boxMap = box.toMap();
    final searchResult = boxMap.entries
        .where((MapEntry<dynamic, T> element) => where(element.value));
    if (searchResult.isNotEmpty) {
      return searchResult.first;
    } else {
      return null;
    }
  }

  static Map<dynamic, T> getAllAsMap<T>(String boxName) {
    final box = getBox<T>(boxName);
    return box.toMap();
  }

  static Future<int> save<T>(String boxName, T element) async {
    try {
      final box = getBox<T>(boxName);
      return await box.add(element);
    } catch (e) {
      log('$e', error: e);
      return -1;
    }
  }

  static Future<Iterable<int>> saveAll<T>(
      String boxName, Iterable<T> elements) async {
    try {
      final box = getBox<T>(boxName);
      return await box.addAll(elements);
    } catch (e) {
      log('$e', error: e);
      return [];
    }
  }

  static Future<Iterable<int>> saveAllIfNotExist<T>(
      String boxName, Iterable<T> elements) async {
    try {
      final box = getBox<T>(boxName);
      final newElements = elements.where((e) => !box.values.contains(e));
      return await box.addAll(newElements);
    } catch (e) {
      log('$e', error: e);
      return [];
    }
  }

  static Future<void> put<T>(String boxName, dynamic key, T element) async {
    try {
      final box = getBox<T>(boxName);
      await box.put(key, element);
    } catch (e) {
      log('$e', error: e);
    }
  }

  static Future<void> updateAt<T>(
      String boxName, int position, T element) async {
    try {
      final box = getBox<T>(boxName);
      await box.putAt(position, element);
    } catch (e) {
      log('$e', error: e);
    }
  }

  static Future<void> putAll<T>(
      String boxName, Map<dynamic, T> elements) async {
    try {
      final box = getBox<T>(boxName);
      await box.putAll(elements);
    } catch (e) {
      log('$e', error: e);
    }
  }

  static Future<void> removeAll<T>(String boxName, Iterable keys) async {
    try {
      final box = getBox<T>(boxName);

      await box.deleteAll(keys);
    } catch (e) {
      log('$e', error: e);
    }
  }

  static Future<void> remove<T>(String boxName, dynamic key) async {
    try {
      final box = getBox<T>(boxName);

      await box.delete(key);
    } catch (e) {
      log('$e', error: e);
    }
  }

  static Future<void> emptyBox<T>(String boxName) async {
    try {
      final box = getBox<T>(boxName);
      final keys = box.toMap().keys;
      await box.deleteAll(keys);
    } catch (e) {
      log('$e', error: e);
    }
  }

  static Future<void> clearBoxes() async {
    await emptyBox<MatchGame>(HiveBoxes.imageGamesBox.value);
    await emptyBox<MatchGame>(HiveBoxes.matchGamesBox.value);
    await emptyBox<User>(HiveBoxes.usersBox.value);
    await emptyBox<UserPreferences>(HiveBoxes.preferencesBox.value);
  }

  static _initBoxes() async {
    _registerAdapters();
    await _openBoxes();
  }

  /*static _populateDB () async {
    final assetData = await rootBundle.loadString('assets/data.json');
    final data = jsonDecode(assetData);
    var populate = Populate.fromJson(data);

    saveAll(HiveBoxes.questionBox.value, populate.questions);
    saveAll(HiveBoxes.categoryBox.value, populate.categories);
  }*/
}