import 'package:get_storage/get_storage.dart';

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
}

enum CacheManagerKey { TOKEN }