import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:jokes_app/app/data/models/joke_model.dart';

mixin CacheManager {
  final GetStorage _box = GetStorage();

  Future<bool> saveToken(String? token) async {
    await _box.write(CacheManagerKey.TOKEN.toString(), token);
    return true;
  }

  String? getToken() {
    return _box.read(CacheManagerKey.TOKEN.toString());
  }

  Future<void> removeToken() async {
    await _box.remove(CacheManagerKey.TOKEN.toString());
  }

  Future<bool> saveNotificationTime(DateTime time) async {
    log('saveNotificationTime called with $time');
    await _box.write(CacheManagerKey.NOTIFICATION_TIME.toString(), time.toIso8601String());
    return true;
  }

  DateTime? getNotificationTime() {
    log('getNotificationTime called with ${_box.read(CacheManagerKey.NOTIFICATION_TIME.toString())}');
    final notificationTime = _box.read(CacheManagerKey.NOTIFICATION_TIME.toString());
    if (notificationTime != null) {
      return DateTime.parse(notificationTime);
    }
    return null;
  }

  Future<void> removeNotificationTime() async {
    await _box.remove(CacheManagerKey.NOTIFICATION_TIME.toString());
  }

  Future<bool> saveFavoriteJokes(List<Joke> jokes) async {
    await _box.write(CacheManagerKey.FAVORITE_JOKES.toString(), jokes.map((e) => e.toJson()).toList());
    return true;
  }

  List<Joke> getFavoriteJokes() {
    final jokes = _box.read(CacheManagerKey.FAVORITE_JOKES.toString());
    log('getFavoriteJokes called with $jokes');
    return jokes != null ? jokes.map<Joke>((joke) => Joke.fromJson(joke)).toList() : [];
  }

  Future<void> removeFavoriteJokes() async {
    await _box.remove(CacheManagerKey.FAVORITE_JOKES.toString());
  }
}

enum CacheManagerKey { TOKEN, NOTIFICATION_TIME, FAVORITE_JOKES }