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
    await _box.write(CacheManagerKey.NOTIFICATION_TIME.toString(), time);
    return true;
  }

  DateTime? getNotificationTime() {
    log('getNotificationTime called with ${_box.read(CacheManagerKey.NOTIFICATION_TIME.toString())}');
    return _box.read(CacheManagerKey.NOTIFICATION_TIME.toString());
  }

  Future<void> removeNotificationTime() async {
    await _box.remove(CacheManagerKey.NOTIFICATION_TIME.toString());
  }

  Future<bool> saveFavoriteJokes(List<Joke> jokes) async {
    await _box.write(CacheManagerKey.FAVORITE_JOKES.toString(), jokes);
    return true;
  }

  List<Joke> getFavoriteJokes() {
    final jokes = _box.read(CacheManagerKey.FAVORITE_JOKES.toString());
    return jokes != null ? List<Joke>.from(jokes) : [];
  }

  Future<void> removeFavoriteJokes() async {
    await _box.remove(CacheManagerKey.FAVORITE_JOKES.toString());
  }
}

enum CacheManagerKey { TOKEN, NOTIFICATION_TIME, FAVORITE_JOKES }