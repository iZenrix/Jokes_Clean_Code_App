import 'package:get/get.dart';
import 'package:jokes_app/app/modules/auth/controllers/auth_controller.dart';
import 'package:jokes_app/app/modules/auth/controllers/login_controller.dart';
import 'package:jokes_app/app/modules/auth/controllers/register_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(
      () => RegisterController(), fenix: true
    );
    Get.lazyPut<LoginController>(
      () => LoginController(), fenix: true
    );
    Get.lazyPut<AuthController>(
      () => AuthController(), fenix: true
    );
  }
}
