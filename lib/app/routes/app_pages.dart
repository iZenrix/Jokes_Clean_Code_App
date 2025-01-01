import 'package:get/get.dart';
import 'package:jokes_app/app/modules/setting/bindings/setting_binding.dart';
import 'package:jokes_app/app/modules/setting/views/setting_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/auth_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/joke/bindings/joke_binding.dart';
import '../modules/joke/views/joke_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: _Paths.AUTH,
      page: () => const AuthView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.JOKE,
      page: () => JokeView(),
      binding: JokeBinding(),
    ),
    GetPage(
        name: _Paths.SETTING,
        page: () => const SettingView(),
        binding: SettingBinding(),
    ),
  ];
}
