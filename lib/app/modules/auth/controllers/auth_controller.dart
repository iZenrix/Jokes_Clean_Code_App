import 'package:get/get.dart';
import 'package:jokes_app/app/core/mixin/cache_manager_mixin.dart';

class AuthController extends GetxController with CacheManager{
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}
